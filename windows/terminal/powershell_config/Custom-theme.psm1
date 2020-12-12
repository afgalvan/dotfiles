#requires -Version 2 -Modules posh-git

function Write-Theme {
    param(
        [bool]
        $lastCommandFailed,
        [string]
        $with
    )

    ## Left Part
    $prompt = Set-Newline
    $currentFolder += Split-Path -Path (Get-Location) -Leaf
    $prompt = Write-Prompt -Object "$($sl.PromptSymbols.StartSymbol) " -ForegroundColor $sl.Colors.SessionInfoForegroundColor -BackgroundColor $sl.Colors.SessionInfoBackgroundColor
    $pathSymbol = if (($pwd.Path -eq $HOME) -or ($pwd.Path -eq "D:\")) {
        $sl.PromptSymbols.PathHomeSymbol
    }
    elseif ($currentFolder -eq "Programming") {
        $sl.PromptSymbols.ComputerSymbol
    }
    else { $sl.PromptSymbols.PathSymbol }

    # Writes the drive portion
    $path = $pathSymbol + " " + ($currentFolder) + " "
    $prompt += Write-Prompt -Object $path -ForegroundColor $sl.Colors.DriveForegroundColor -BackgroundColor $sl.Colors.SessionInfoBackgroundColor

    $status = Get-VCSStatus
    if ($status) {
        $themeInfo = Get-VcsInfo -status ($status)
        $prompt += Write-Prompt -Object $sl.PromptSymbols.SegmentSubForwardSymbol -ForegroundColor $sl.Colors.PromptForegroundColor -BackgroundColor $sl.Colors.SessionInfoBackgroundColor
        $prompt += Write-Prompt -Object " $($themeInfo.VcInfo) " -ForegroundColor $themeInfo.BackgroundColor -BackgroundColor $sl.Colors.SessionInfoBackgroundColor
    }
    If ($with) {
        $sWith = " $($with.ToUpper())"
        $prompt += Write-Prompt -Object $sl.PromptSymbols.SegmentSubForwardSymbol -ForegroundColor $sl.Colors.PromptForegroundColor -BackgroundColor $sl.Colors.SessionInfoBackgroundColor
        $prompt += Write-Prompt -Object $sWith -ForegroundColor $sl.Colors.WithForegroundColor -BackgroundColor $sl.Colors.SessionInfoBackgroundColor
    }
    $prompt += Write-Prompt -Object $sl.PromptSymbols.SegmentForwardSymbol -ForegroundColor $sl.Colors.SessionInfoBackgroundColor

    $prompt += Write-Prompt -Object "`r"
    $prompt += Set-Newline
    # Writes the postfixes to the prompt
    $indicatorColor = If ($lastCommandFailed) { $sl.Colors.CommandFailedIconForegroundColor } Else { $sl.Colors.PromptSymbolColor }
    $indicatorSymbol = if ($lastCommandFailed) { $sl.PromptSymbols.ErrorSymbol } Else { $sl.PromptSymbols.PromptIndicator }
    $prompt += Write-Prompt -Object $indicatorSymbol -ForegroundColor $indicatorColor
    $prompt += ' '
    $prompt
    $host.ui.RawUI.WindowTitle = ($currentFolder) + $sl.PromptSymbols.Lightning
    Break
}

$sl = $global:ThemeSettings #local settings
$sl.PromptSymbols.StartSymbol = [char]::ConvertFromUtf32(0xe62a)
$sl.PromptSymbols.ErrorSymbol = [char]::ConvertFromUtf32(0x2718)
$sl.PromptSymbols.PromptIndicator = [char]::ConvertFromUtf32(0x279C)
$sl.PromptSymbols.SegmentForwardSymbol = [char]::ConvertFromUtf32(0xE0B0)
$sl.PromptSymbols.SegmentSubForwardSymbol = [char]::ConvertFromUtf32(0xE0B1)
$sl.PromptSymbols.SegmentBackwardSymbol = [char]::ConvertFromUtf32(0xE0B2)
$sl.PromptSymbols.SegmentSubBackwardSymbol = [char]::ConvertFromUtf32(0xE0B3)
$sl.PromptSymbols.PathHomeSymbol = [char]::ConvertFromUtf32(0xf015)
$sl.PromptSymbols.PathSymbol = [char]::ConvertFromUtf32(0xF115)
$sl.PromptSymbols.ComputerSymbol = [char]::ConvertFromUtf32(0x1F4BB)
$sl.PromptSymbols.Lightning = [char]::ConvertFromUtf32(0x26A1)
$sl.Colors.PromptBackgroundColor = [ConsoleColor]::DarkGray
$sl.Colors.SessionInfoBackgroundColor = [ConsoleColor]::Black
$sl.Colors.VirtualEnvBackgroundColor = [ConsoleColor]::DarkGray
$sl.Colors.PromptSymbolColor = [ConsoleColor]::Green
$sl.Colors.CommandFailedIconForegroundColor = [ConsoleColor]::DarkRed
$sl.Colors.DriveForegroundColor = [ConsoleColor]::Cyan
$sl.Colors.PromptForegroundColor = [ConsoleColor]::Gray
$sl.Colors.SessionInfoForegroundColor = [ConsoleColor]::White
$sl.Colors.WithForegroundColor = [ConsoleColor]::Red
$sl.Colors.VirtualEnvForegroundColor = [System.ConsoleColor]::Magenta
$sl.Colors.TimestampForegroundColor = [ConsoleColor]::Green
$sl.Colors.UserForegroundColor = [ConsoleColor]::Yellow
$sl.Colors.GitForegroundColor = [ConsoleColor]::White # Just in case...