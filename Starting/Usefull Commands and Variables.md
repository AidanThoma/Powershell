<!-- Use Ctrl+Shift+V to open up a window in VS Code with Markdown Preview Enhanced -->

<h1>Useful links</h1>
<li><a href="https://shd101wyy.github.io/markdown-preview-enhanced/#/markdown-basics">Markdown Preview Enhanced Docs</a></li>
<li><a href="https://www.youtube.com/watch?v=IHrGresKu2w">PowerShell Tutorial Video (Starter)</a></li>
<br>

<h4>Useful Commands</h4>
<!-- This line can make a text colored
	<span style="color: red;">get-help</span>get-help -->

```powershell
Start-Transcript
```
- creates a transcript (txt file) of what you all do in a single session
	- puts it in documents by default

```powershell
Start-Transcript -Path "C:\transcripts\mytranscript.txt" -NoClobber
```
- this will put the transcript in the directed path
	- -NoClobber prevents overwriting

```powershell
Stop-Transcript
```

- take a wild guess what this does
<br>

```powershell
Get-Process chrome | get-member
```
- grabs type, METHODS, properties, and more

```powershell
Get-Process -Name "c*"
```
- grabs all processes that begin with "c"

```powershell
Get-Process -Name -chrome | stop-process
```
- grabs the process chrome, takes it's output (object), and stops its process
<br>


```powershell 
Get-Help Start-Transcript -online
```
- Pulls up a online tab which shows examples
<br>

```powershell
get-history
```
- spits out something like this

	Id CommandLine
  		-- -----------
   		1 Get-Alias clear
   		2 cld
   		3 clt
   		4 Get-Alias
   		5 $zebra = Get-Process chrome
<br>

```powershell
Get-Command
```
- gets all commands

```powershell
Get-Command -noun service
```
- filter outs for nouns
<br>


```powershell
Get-Service
```
- gets Services
<br>

```powershell
Get-Alias
```
- get-alias cd (Gets cd's alias)
<br>



<h3>Variables</h3>
<h5>Variables are stored as $</h5>

```powershell
$zebra = Get-Process chrome
```

-sets $zebra as chrome)
```powershell
$zebra | kill
```
- kills chrome