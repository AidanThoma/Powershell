$fileContent = Get-Content .\Files\Writing.txt

$colors = @('Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')

$num = 0
$loops = 0

<#
foreach ($line in $fileContent){
    Write-Host "$($line)" -ForegroundColor $colors[$num]
    Write-Host "$($line)"
    $num++
    if ($num -ge $colors.Length) {
        $num = 0
        $loops++
    }
}
Write-Host "Loops: $($loops)`n Num: $($num)"
#>

$words = $fileContent -split '\s+' # This splits it by any white space

foreach ($word in $words) {
    Write-Host "$($word) " -NoNewline -ForegroundColor $colors[$num]
    $num++
    if ($word -like "*.*"){
        Write-Host ""
    }
    
    if ($num -ge $colors.Length) {
        $num = 0
    }
    Start-Sleep -Milliseconds 50
}