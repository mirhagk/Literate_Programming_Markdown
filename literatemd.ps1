[CmdletBinding()]
Param(
	[Parameter(Mandatory=$True,Position=1)]
	[string]$fileName,
	[Parameter(Mandatory=$false)]
	[string]$outputFileName = $Null
)

if (!$outputFileName){
	$outputFileName = $filename.substring(0,$filename.LastIndexOf("."))
}

get-content $filename | where-object { $_.StartsWith("`t") } | foreach-object { $_.Substring(1) } | set-content $outputFileName
