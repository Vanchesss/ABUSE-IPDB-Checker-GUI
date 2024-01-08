#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <ListViewConstants.au3>
#include <GuiListView.au3>
#include <GuiImageList.au3>
#include <GuiButton.au3>
#include <GuiStatusBar.au3>
#include <Crypt.au3>
#include <Array.au3>
#include <MsgBoxConstants.au3>
#include <File.au3>
#include <WinAPIShellEx.au3>
#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WindowsConstants.au3>
#include "cURL.au3"
#include "cURLConstants.au3"
#include <Excel.au3>
#include <GUIConstants.au3>
#include <GUIConstantsEx.au3>
#include <Word.au3>
#include <File.au3>
#include <ProgressConstants.au3>
#include <StaticConstants.au3>
#NoTrayIcon
;Pause and Exit Buttons--------------------------
Global $Paused
HotKeySet("{F11}", "TogglePause")
HotKeySet("{Esc}", "Terminate")
Func TogglePause()
    $Paused = NOT $Paused
    While $Paused
    sleep(50)
        ToolTip('PAUSE',0,0)
    WEnd
    ToolTip("")
EndFunc
Func Terminate()
    Exit 0
EndFunc
; Pause and Exit Buttons-----------------


;--------------Functions----------------------

;==============Checking the IP address format==============
Func ValidIP($vd_IP)
Local $vd_c, $vd_code
$vd_a = StringSplit($vd_IP, ".")
$vd_c = 1
$vd_code = 0
While $vd_c <= $vd_a[0]
If $vd_a[0] = 4 And StringLen($vd_IP) >= 7 And StringLen($vd_IP) <= 15 _
  And StringIsDigit($vd_a[$vd_c]) And $vd_a[$vd_c] <= 255 Then
If $vd_code = 0 Then $vd_code = 0
Else
$vd_code = $vd_code + 1
EndIf
$vd_c = $vd_c + 1
WEnd
If $vd_code = 0 Then
Return 1
Else
Return 0
EndIf
SetError($vd_code)
EndFunc
;========== End Function Checking the IP address format========

;=======Main GUI==================
Func _Input($Title = "")
  Global $GUI = GUICreate($Title, 560, 620)
  Local $Input = GUICtrlCreateEdit("", 30, 170, 500,200)
  Local $BtnOK = GUICtrlCreateButton("Check", 100, 550, 150,40, -1, 0x01) ; $BS_DEFPUSHBUTTON
  Local $BtnCancel = GUICtrlCreateButton("Exit", 300, 550, 150,40)
  Local $Pic1 = GUICtrlCreatePic(@ScriptDir & "/abuseipdb.png.pagespeed.ce.CI8T6WsXU7.res", 140, 4, 267, 97)
   Global $Label1 = GUICtrlCreateLabel("Enter the IP as a column (each address starts on a new line)", 30, 138, 500, 24)
	GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
	Global $LabelLimitRemaining = GUICtrlCreateLabel("", 30, 500, 496, 24)
	GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")

Global $prProgress1 = GUICtrlCreateProgress(30, 416, 500, 49)
Global $prtext1 = GUICtrlCreateLabel("Ready ", 28, 380, 503, 28)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
;Global $prLabel1 = GUICtrlCreateLabel("0", 382, 381, 52, 28)
;GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")

GUISetState(@SW_SHOW)
 GUISetState()
  GUISetState()
  ;$Text=0
  Global $Text = GUICtrlRead($Input)
   Do
     Switch GUIGetMsg()
		  Case -3, $BtnCancel
			  exit
       Case $BtnOK
         $Text = GUICtrlRead($Input)
				  If $Text = "" Then
                MsgBox(16, "Error", "Please enter the text")
                ContinueLoop
					EndIf
        Return SetError(0, $Text)
     EndSwitch
  Until 0
EndFunc
;========== End Function MainGUI===============


;=======Function 1Dto2DArray==================

Func _1Dto2DArray(Const ByRef $a1D, $iCol = 1)
  If Not IsArray($a1D) Or UBound($a1D, 0) <> 1 Then Return SetError(1, 0, 0)
  If $iCol < 1 Then Return SetError(2, 0, 0)
  Local $iLen = UBound($a1D)
  If $iLen = 1 Then Return [[ $a1D[0] ]]
  Local $a2D[Ceiling($iLen / $iCol)][$iCol], $Line, $j
  For $i = 0 To $iLen - 1
    $a2D[$Line][$j] = $a1D[$i]
    If $j = $iCol - 1 Then
      $Line += 1
      $j = 0
    Else
      $j += 1
    EndIf
  Next
  Return $a2D
EndFunc
;========== EndFunction 1Dto2DArray==========

;========== Swap Rows Columns==========
Func _ArraySwap_Rows_Columns(ByRef $a_Array)
    Local $i_Row, $i_Column, $a_Tmp[1]

    If UBound($a_Array, 0) <> 2 Then Return False
    $i_Row = UBound($a_Array)
    $i_Column = UBound($a_Array, 2)
    ReDim $a_Tmp[$i_Column][$i_Row]
    For $i = 0 To $i_Row - 1
        For $j = 0 To $i_Column - 1
            $a_Tmp[$j][$i] = $a_Array[$i][$j]
        Next
    Next
    $a_Array = $a_Tmp
    Return True
EndFunc
;==========End Swap Rows Columns==========


$hAPI_KEY=FileReadLine ( @ScriptDir & "/API_KEY.conf",1 )
If $hAPI_KEY="" Then
	MsgBox ( 0, "API KEY not found", "Enter your API key in the API_KEY.conf file in the program folder")
	Exit
Endif

While 1
Do
$sGUI = _Input("Abuse IPDB Checker")
GUISetState(@SW_SHOWNOACTIVATE)
$Textmod=StringReplace ($Text, @CRLF, ":" )
$array1 = StringSplit($Textmod,":", 2)

For $i = UBound($array1) - 1 To 0 Step -1 ;Delete empty lines
    If $array1[$i] = "" Then
        _ArrayDelete($array1, $i)
    EndIf
	Next
Global $kolarr=UBound($array1) - 1


;----------------------Checking IP address format----------------------

For $i = 0 To UBound($array1)-1
    If ValidIP($array1[$i]) = 1 Then

    Else
        MsgBox(0,"Error", 'The object  ' & $array1[$i] & ' is not an IP address, or is set incorrectly')
				$i=0
				GUIDelete($GUI)
			ExitLoop

    EndIf
	Next
Until $i > UBound($array1)-1
;----------------------End Checking IP address format----------------------


_cURL_Startup()
FileDelete (@ScriptDir & "\response.log") ; Deleting the old log file
$hFile = FileOpen("response.log", 1)
If $hFile = -1 Then
    Exit
EndIf

For $i=0 to $kolarr

;----------------Progress Bar---------------------------
$sFirst = ': '
$sSecond = ' load'
$prfinal= $i+1
$TotalSize=$kolarr+1
$Percent = $prfinal/$TotalSize * 100
GUICtrlSetData($prProgress1, $Percent)
$okrug = StringFormat("%.0f", $Percent) ;rounding % to integers
GUICtrlSetData( $prtext1, 'Objects checked:  '&$i+1&'  from  '&$TotalSize&'                                                        '&$okrug&' %' )
$hCURL = _cURL_Easy_Init()
$IPaddress='https://api.abuseipdb.com/api/v2/check?ipAddress=' & $array1[$i] ;GET request to the API
ConsoleWrite($IPaddress)
_cURL_Easy_SetOpt($hCURL, $cURL_OPT_URL, $IPaddress)
_cURL_Easy_SetOpt($hCURL, $cURL_OPT_FOLLOWLOCATION, 1)
Dim $aHeaders[2] = [$hAPI_KEY, 'Accept: application/json']
_cURL_Easy_SetOpt($hCURL, $cURL_OPT_HTTPHEADER, $aHeaders)
$sResponse = _cURL_Easy_Exec($hCURL)
_cURL_Easy_Cleanup($hCURL)
ConsoleWrite('Item:' & $array1[$i])
ConsoleWrite('Response: ' & @CRLF & $sResponse)
FileWriteLine($hFile, $sResponse & @CRLF)

Next

FileClose($hFile)
;---------------------------Parsing response-------------------
$sFilePath = @ScriptDir & "\response.log"
$slines = FileRead($sFilePath) ;passing the contents of the file to the variable
$p_IP=StringRegExp($slines,'ipAddress":"(.+?)"',3) ;parsing IP
$p_isPublic=StringRegExp($slines,'isPublic":(.+?),',3) ;parsing IP public\private
$p_ipVersion=StringRegExp($slines,'ipVersion":(.+?),',3) ;parsing  IP version
$p_isWhitelisted=StringRegExp($slines,'isWhitelisted":(.+?),',3) ; Is there 1 in the white list -yes null -no
$p_countryCode=StringRegExp($slines,'countryCode":"(.+?)",',3) ; parsing country
$p_abuseConfidenceScore=StringRegExp($slines,'abuseConfidenceScore":(.+?),',3) ;parsing abuse Confidence Score
$p_usageType=StringRegExp($slines,'usageType":"(.+?)",',3) ; parsing usage type
$p_isp=StringRegExp($slines,'isp":"(.+?)",',3) ; ISP
$p_domain=StringRegExp($slines,'domain":"(.+?)",',3) ; domain
$p_totalReports=StringRegExp($slines,'totalReports":(.+?),',3) ; parsing Total reports
$p_Limit=StringRegExp($slines,'X-RateLimit-Limit: (.+?...)',3); Limit
$p_Remaining= StringRegExp($slines,'X-RateLimit-Remaining:(.+?...)',3) ; Remaining
$p_minLimit=_ArrayMin($p_Limit, 1, 1)
$p_minRemaining=_ArrayMin($p_Remaining, 1, 1) ;API requests remaining per day
$p_LimitRemaining= "The limit of requests for the current API_KEY is "&@MDAY & "." & @MON & "." & @YEAR&':                              '&$p_minRemaining&"/"&$p_minLimit;осталось запросов к API за день
GUICtrlSetData($LabelLimitRemaining, $p_LimitRemaining)
_ArrayConcatenate($p_IP,$p_abuseConfidenceScore)
_ArrayConcatenate($p_IP,$p_totalReports)
_ArrayConcatenate($p_IP,$p_countryCode)
_ArrayConcatenate($p_IP,$p_isPublic)
_ArrayConcatenate($p_IP,$p_isWhitelisted)
_ArrayConcatenate($p_IP,$p_domain)
_ArrayConcatenate($p_IP,$p_usageType)
_ArrayConcatenate($p_IP,$p_isp)
Local $p_header[9]=["IP address", "Abuse Score(%)", "Total reports", "Country", "isPublic", "isWhitelisted","Domain","Type", "ISP"]
$kolarr=$kolarr+2
local $aFin
$aFin=_1Dto2DArray($p_IP, $kolarr-1)
;---------------array reverse-----------
_ArraySwap_Rows_Columns($aFin)
$p_header2=_1Dto2DArray($p_header, 9)
_ArrayConcatenate($p_header2,$aFin)
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeWrite Example", "Error creating the Excel application object." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
Local $oWorkbook = _Excel_BookNew($oExcel)
If @error Then
    MsgBox($MB_SYSTEMMODAL, "ERROR", "Error creating the new workbook." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
    _Excel_Close($oExcel)
    Exit
EndIf
_Excel_RangeWrite($oWorkbook,$oWorkbook.Activesheet, $p_header2, "A1")
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "ERROR", "Error writing to worksheet." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
$oExcel.Columns('A:K' ).EntireColumn.AutoFit
GUIDelete($GUI)
Wend
_cURL_Shutdown()
