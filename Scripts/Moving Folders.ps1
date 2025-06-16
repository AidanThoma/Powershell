<#  This script is to move images between two folders
        - Move Between Images and Images2
        
    How it works
        - Checks to see what folder is empty and move to that one
        - Use a for loop to move each file recursively

#>

$ImagesFolder = dir -path "File Directory 1"
$Images2Folder = dir -path "File Directory 2"

#   Check which folder is empty
if ( ($ImagesFolder | Measure-Object).Count -eq 0 ) {
    $source = $Images2Folder
    $sourcePath = "File Directory 1"
    $destPath = "File Directory 2"
    Write-Host "Moving Files to $destPath" -ForegroundColor Blue
} 
else  { 
    $source = $ImagesFolder
    $sourcePath = "File Directory 1"
    $destPath = "File Directory 2"
    Write-Host "Moving Files to $destPath" -ForegroundColor Blue
}
foreach ($file in $source) {
    $dest = Join-Path -Path $destPath -ChildPath $file.Name

    Write-Host "Moving: $($file.Name) to $dest" -BackgroundColor Black -ForegroundColor Green

    try {
        $file.MoveTo($dest)
        Start-Sleep -Seconds 0
    }
    catch {
        <#Do this if a terminating exception happens#>
        Write-Host "Failed to move $($file.Name) : $_" -ForegroundColor Red
    }
}