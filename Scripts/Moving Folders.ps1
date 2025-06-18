<#  This script is to move images between two folders
        - Move Between Images and Images2
        
    How it works
        - Checks to see what folder is empty and move to that one
        - Use a for loop to move each file recursively

#>

$ImagesFolder = Get-ChildItem -path "C:\Users\athom\OneDrive\Desktop\Work\PowerShell Test\Scripts\Files\Dir1\"
$Images2Folder = Get-ChildItem -path "C:\Users\athom\OneDrive\Desktop\Work\PowerShell Test\Scripts\Files\Dir2\"

#   Check which folder is empty
if ( ($ImagesFolder | Measure-Object).Count -eq 0 ) {
    $source = $Images2Folder
    #$sourcePath = "C:\Users\athom\OneDrive\Desktop\Work\PowerShell Test\Scripts\Files\Dir2\"
    $destPath = "C:\Users\athom\OneDrive\Desktop\Work\PowerShell Test\Scripts\Files\Dir1\"
    Write-Host "Moving Files to $destPath" -ForegroundColor Blue
} 
else  { 
    $source = $ImagesFolder
    #$sourcePath = "C:\Users\athom\OneDrive\Desktop\Work\PowerShell Test\Scripts\Files\Dir1\"
    $destPath = "C:\Users\athom\OneDrive\Desktop\Work\PowerShell Test\Scripts\Files\Dir2\"
    Write-Host "Moving Files to $destPath" -ForegroundColor Blue
}
foreach ($file in $source) {
    $dest = Join-Path -Path $destPath -ChildPath $file.Name

    Write-Host "Moving: $($file.Name) to $dest" -BackgroundColor Black -ForegroundColor White

    try {
        $file.MoveTo($dest)
        Start-Sleep -Milliseconds 500
    }
    catch {
        <#Do this if a terminating exception happens#>
        Write-Host "Failed to move $($file.Name) : $_" -ForegroundColor Red
    }
}
Write-Host "Files All Moved!" -ForegroundColor Green