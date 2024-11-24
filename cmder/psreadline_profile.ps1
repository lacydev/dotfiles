Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -HistorySearchCursorMovesToEnd

Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# This is an example of a macro that you might use to execute a command.
# This will add the command to history.
Set-PSReadLineKeyHandler -Key Ctrl+b `
												 -BriefDescription SaveInHistory `
												 -LongDescription "Save current line in history but do not execute" `
												 -ScriptBlock {
		param($key, $arg)

		$line = $null
		$cursor = $null
		[Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
		[Microsoft.PowerShell.PSConsoleReadLine]::AddToHistory($line)
		[Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
}

# This key handler shows the entire or filtered history using Out-GridView. The
# typed text is used as the substring pattern for filtering. A selected command
# is inserted to the command line without invoking. Multiple command selection
# is supported, e.g. selected by Ctrl + Click.
# As another example, the module 'F7History' does something similar but uses the
# console GUI instead of Out-GridView. Details about this module can be found at
# PowerShell Gallery: https://www.powershellgallery.com/packages/F7History.
Set-PSReadLineKeyHandler -Key F7 `
												 -BriefDescription History `
												 -LongDescription 'Show command history' `
												 -ScriptBlock {
		$pattern = $null
		[Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$pattern, [ref]$null)
		if ($pattern)
		{
				$pattern = [regex]::Escape($pattern)
		}

		$history = [System.Collections.ArrayList]@(
				$last = ''
				$lines = ''
				foreach ($line in [System.IO.File]::ReadLines((Get-PSReadLineOption).HistorySavePath))
				{
						if ($line.EndsWith('`'))
						{
								$line = $line.Substring(0, $line.Length - 1)
								$lines = if ($lines)
								{
										"$lines`n$line"
								}
								else
								{
										$line
								}
								continue
						}

						if ($lines)
						{
								$line = "$lines`n$line"
								$lines = ''
						}

						if (($line -cne $last) -and (!$pattern -or ($line -match $pattern)))
						{
								$last = $line
								$line
						}
				}
		)
		$history.Reverse()

		$command = $history | Out-GridView -Title History -PassThru
		if ($command)
		{
				[Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
				[Microsoft.PowerShell.PSConsoleReadLine]::Insert(($command -join "`n"))
		}
}
