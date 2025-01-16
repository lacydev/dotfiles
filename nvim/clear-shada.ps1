$shada = Get-ChildItem -Filter "*.tmp.*" -Path "C:\Users\soyla\AppData\Local\nvim-data\shada\"

if ( $shada.length -gt 0 ) {
	Write-Host "Deleting extra Shada files..."
	$shada | ForEach-Object {
		Remove-Item "$($_.FullName)" -Verbose
	}
} else {
	Write-Host "There aren't any Shada files to delete, hun ^_^"
}
