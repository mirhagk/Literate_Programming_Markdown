Powershell Implementation
===

Using markdown for literate programming makes it really easy to create programs to process the files. This is a powershell implementation, with the corresponding full documentation that goes along with literate programming.

Parameters
---

The first part we must define is the parameters for this script.

	[CmdletBinding()]
	Param(

The first parameter is the name of the file. The parameter is mandatory and the name can be ommitted, just placing it as the first positional argument.

	[Parameter(Mandatory=$True,Position=1)]
	[string]$fileName
	)
	
Determining Output filename
---

Given the input file name we need to generate an output file name. By default we just drop the last file extension so `filename.ps1.md` becomes `filename.ps1`. 

We find the last `.` and then grab the beginning of the string up until that point.

$outputFileName = $filename.substring(0,$filename.LastIndexOf("."))

Processing
---

	get-content $filename | where-object { $_.StartsWith("`t") } | select-object { $_.Substring(1) } | set-content $outputFileName