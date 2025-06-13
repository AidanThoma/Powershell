<# Top 10 PowerShell Commands for begginers
 https://www.youtube.com/watch?v=MP_UR5iWfZQ #>

#   This gets content from a file
#   Get-Content Files\hosts.txt


#$hosts = Get-Content Files\hosts.txt

# Get content with a path

$hosts = Get-Content -Path .\Files\hosts.txt

# Using a for loop
<#
$hosts |  ForEach-Object {
     Write-Host "Hostname: $($_)" -BackgroundColor White -ForegroundColor Black   
    }
#>

#   Output string into a file
$string = "My name is Aidan and I really am enjoying my job!"
$string2 = "This line will be appened to the file"

#   Create a new file if there isn't one
$string | Out-File -FilePath .\Files\Outfile.txt
$string2 | Out-File -FilePath .\Files\Outfile.txt -Append



#   Empties OutputHosts.txs
Clear-Content -path .\Files\OutputHosts.txt

#   Writes all hosts from hosts.txt to OutputHosts.txt 
$hosts | ForEach-Object {
    "Hostname: $($_)" | Out-File .\Files\OutputHosts.txt -Append
}


#   Scanning Multiple Hosts for two port

$hosts | ForEach-Object {

    Write-Host "Testing Host $($_)" -BackgroundColor Black -ForegroundColor Red
    $result = Test-NetConnection -ComputerName $_ -port 443
    Write-Host "RemotePort: $($result.RemotePort), Sucess: $($result.TcpTestSucceeded)" -BackgroundColor Black -ForegroundColor Blue

    $result = Test-NetConnection -ComputerName $_ -port 80
    Write-Host "RemotePort: $($result.RemotePort), Sucess: $($result.TcpTestSucceeded)" -BackgroundColor Black -ForegroundColor Blue
    Write-Host "Sleeping" -BackgroundColor Black -ForegroundColor White
    Write-Host ""
    Start-Sleep -Seconds 1
    Write-Host ""
}

Write-Host "Finished" -BackgroundColor Black -ForegroundColor DarkGreen

#   You can convert objects to JSON
#   $hosts | convertto-json
