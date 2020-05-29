<#
.SYNOPSIS
Backup

?test if robocopy available

ATT***
using robocopy because of XCopy path lenght<254 limitation
Error: Insufficient memory

robocopy /s /xo /log:bak-???.log /tee 
	\\server1\d$\BORDALIMA D:\!!!!BAKS\Server1\BORDALIMA *.doc 
	\\server1\d$\BORDALIMA D:\!!!!BAKS\Server1\BORDALIMA *.xls
	+
	\\server1\d$\BORDALIMA\Design D:\!!!!BAKS\Server1\BORDALIMA\Design

xcopy /s/d/h/r/j/c/l ^ 
	\\server1\d$\BORDALIMA\Design ^
	D:\!!!!BAKS\Server1\BORDALIMA\Design | ^
	tee BAK-Design.log

#>

$xType = "Design";
$xName = "bak-$xType";

# work in USERPROFILE folder
set-Location $env:USERPROFILE;

#?file existes
$xFile = Get-ChildItem "$xName.log";

#?if exist then rename with AAA-Date:creation
if ( $xFile -ne $null )
	{
	$xDate = $xFile.CreationTime.ToString("yyyyMMddhhmmss");
	$x  = "{0}.log" -f $xName;
	$xx = "{0}-{1}.log" -f $xName, $xDate;
	Rename-Item $x $xx;
	}

# can now start backup process
robocopy /s /xo /np /log:bak-design.log /w:1 /r:1 /tee `
	"\\server1\d$\BORDALIMA\Design" `
	"D:\!!!!BAKS\Server1\BORDALIMA\Design"

	