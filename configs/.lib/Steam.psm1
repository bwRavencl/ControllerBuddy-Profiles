Set-Variable SteamRegistryKeys -Option Constant -Value @(
    "HKLM:\SOFTWARE\WOW6432Node\Valve\Steam",
    "HKLM:\SOFTWARE\Valve\Steam"
)

<#
.SYNOPSIS

Get-SteamGamePath returns the installation path of a Steam game given its App ID.
#>
function Get-SteamGamePath() {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingEmptyCatchBlock', '', Justification = 'Exceptions are expected when checking multiple registry keys for Steam installation path')]
    param (
        [Parameter(Mandatory = $true)]
        [int]$AppId
    )

    $steamDir = $null
    foreach ($steamRegistryKey in $SteamRegistryKeys) {
        try {
            $installPath = (Get-ItemProperty -Path $steamRegistryKey -ErrorAction Stop).InstallPath
            if (Test-Path $installPath) {
                $steamDir = $installPath
                break
            }
        } catch {}
    }

    if (-not $steamDir) {
        return $null
    }

    $libraryfoldersVdfFile = Join-Path $steamDir steamapps\libraryfolders.vdf
    if (-not (Test-Path $libraryfoldersVdfFile)) {
        return $null;
    }

    $libraryPaths = @(Join-Path $steamDir $steamapps)
    $libraryfoldersVdfContent = Get-Content $libraryfoldersVdfFile -Raw
    $paths = [regex]::Matches($libraryfoldersVdfContent, '"path"\s*"([^"]+)"') | Select-Object -Unique
    foreach ($path in $paths) {
        $path = $path.Groups[1].Value -replace '\\\\', '\'
        $potentialLibraryPath = Join-Path $path steamapps
        if (Test-Path $potentialLibraryPath) {
            $libraryPaths += $potentialLibraryPath
        }
    }

    $appmanifestAcfFile = $null
    foreach ($libraryPath in $libraryPaths) {
        $potentialAppmanifestAcfFile = Join-Path $libraryPath "appmanifest_$AppId.acf"
        if (Test-Path $potentialAppmanifestAcfFile) {
            $appmanifestAcfFile = $potentialAppmanifestAcfFile
            break
        }
    }

    if (-not $appmanifestAcfFile) {
        return $null;
    }

    $installdir = (Select-String -Path $appmanifestAcfFile -Pattern '"installdir"\s*"([^"]+)"').Matches[0].Groups[1].Value
    $gameDir = Join-Path (Join-Path (Split-Path $appmanifestAcfFile) common) $installdir

    if (Test-Path $gameDir) {
        return $gameDir;
    }

    return $null;
}

Export-ModuleMember -Function Get-SteamGamePath