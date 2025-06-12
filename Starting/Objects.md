<!-- Use Ctrl+Shift+V to open up a window in VS Code with Markdown Preview Enhanced -->

# **Useful links**
<li><a href="https://shd101wyy.github.io/markdown-preview-enhanced/#/markdown-basics">Markdown Preview Enhanced Docs</a></li>
<li><a href="https://www.youtube.com/watch?v=f9xPJXslVWE">PowerShell Tutorial Video (Ojects)</a></li>
<li><a href="https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-powershell-1.0/ee692795(v=technet.10)?redirectedfrom=MSDN">.Net Formating method </a></li>
<br>

## Objects
Script we are trying to understand

```powershell
Get-PSDrive | ?{$_.Free -gt 1} | %{$Count = 0; Write-Host "";} { $_.Name + ": Used: " + "{0:N2}" -f ($_.Used/1gb) + " Free: " + "{0:N2}" -f ($_.free/1gb) + " Total: " + "{0:N2}" -f (($_.Used/1gb)+($_.Free/1gb)); $Count = $Count + $_.Free;}{Write-Host"";Write-Host "Total Free Space " ("{0:N2}" -f ($Count/1gb)) -backgroundcolor magenta}
```

<br>
<br>

```powershell
Get-PSDrive
```
- this returns all drives on my system
<br>

```powershell
get-alias ?
```
- ? is an alias for Where-Object
<br>

## These you **NEED** to know
###### Where-Object (?)

```powershell
Get-PSDrive | Where-Object{$_.free -gt 1}
```
- We pipe all of our objects into Where-Object
    - Where-Object helps us sort out our objects
- {$_} means our current object
    - .free is a property of our object
    - -gt means greater than (just like assembly!)
    - -ge means greater than or equal
<br>

##### Select-Object

```powershell
Get-PSDrive | ? {$_.free -gt 1} | Select-Object Root, Used, Free
```
- We then pipe it again into our select-object and filter for Root, Used, and Free
- More like select properties
```powershell
Get-PSDrive | ? {$_.free gt 1} | Select-Object *
- This lets us see all of our proterties
```
<br>

##### ForEach-Object

```powershell
Get-PSDrive | ?{$_.free -gt 1} | ForEach-Object {"Aidan"}
```
- ForEach is just like a forloop
    - The {"Aidan"} just prints to the console

```powershell
Get-PSDrive | Where-Object {$_.free -gt 1} | ForEach-Object { Write-Host "Free space for" $_.root "is" ($_.Free/1gb) -ForegroundColor red}
```
- Write-Host just writes to console
    - Only writes to console and not logs
    - Can  change the color using -Foregroundcolor
- .root is the root value and .free is the free propterty
    - We can divide by one gigabyte (gb) or megabyte (mg)

```powershell
Get-PSDrive | Where-Object {$_.free -gt 1} | 
ForEach-Object { Write-Host "Free space for" $_.root "is" ("{0:N2}" -f ($_.Free/1gb)) -ForegroundColor red}
```
- Formatted to the 2nd decimal place    
    - Remember the () between the "{0:N2}" AND the ($_.free/1gb)
<br>
<br>

### Formating
##### "{0:N0}" -f 10000
- f means format
