#include-once
#include <Array.au3>;for _ArrayToString
#include "cURLConstants.au3";for _cURL_Easy_Exec

Global $_cURL_hDll
Global Const $cURL_tagCALLBACKDATA = "ptr func;ptr data" ;Callback function ptr; extra data
Global Const $cURL_tagCALLBACKARGS = "ptr;int;int;ptr" ;Arguments for callbackdata function pAddr;iSize;iCout;pExtraData
Global Const $cURL_tagVERSIONINFO = "int age;ptr version;uint version_num;ptr host;int features;ptr ssl_version;int ssl_version_num;ptr libz_version;ptr protocols;ptr ares;int ares_num;ptr libidn;int iconv_ver_num;ptr libssh_version"
Global Const $cURL_tagCURLMSG = "int msg;ptr easy_handle;ptr whatever;int result"

; #INDEX# =======================================================================================================================
; Title .........: cURL
; AutoIt Version : 3.3.12.0
; Language ......: English
; Description ...: Functions that assist make requests by cURL
; Author(s) .....: BIOS
; ===============================================================================================================================

; #CURRENT# =====================================================================================================================
; _cURL_Startup
; _cURL_Easy_Init
; _cURL_Easy_SetOpt
; _cURL_Easy_SetWriteFuncMode
; _cURL_Easy_GetInfo
; _cURL_Easy_Exec
; _cURL_Easy_Perform
; _cURL_Easy_Cleanup
; _cURL_Shutdown
; _cURL_Version
; _cURL_Easy_Escape
; _cURL_Easy_DupHandle
; _cURL_Easy_Pause
; _cURL_Easy_Recv
; _cURL_Easy_Reset
; _cURL_Easy_Send
; _cURL_Easy_UnEscape
; _cURL_Multi_AddHandle
; _cURL_Multi_Cleanup
; _cURL_Multi_InfoRead
; _cURL_Multi_Init
; _cURL_Multi_Perform
; _cURL_Multi_RemoveHandle
; _cURL_Multi_SetOpt
; _cURL_Multi_SetTimerFuncMode
; _cURL_Free
; _cURL_GetDate
; _cURL_VersionInfo
; ===============================================================================================================================

; #FUNCTION# ===========================================================================================================
; Name...........: _cURL_Startup
; Description ...: Creates Dll handle and initialize it
; Syntax.........: _cURL_Startup ( $sDllPath = @ScriptDir & '\cURL.dll' )
; Parameters ....: $sDllPath - Path to cURL.dll
; Return values .: Always 1
; Author ........: BIOS
; Modified.......: 05/05/2015
; Related .......:
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _cURL_Startup($sDllPath = @ScriptDir & '\cURL.dll')
	If $_cURL_hDll Then Return 2
	$_cURL_hDll = DllOpen($sDllPath)
	If @error Then Return SetError(1, 0, 0)

	Return 1
EndFunc   ;==>_cURL_Startup

; #FUNCTION# ===========================================================================================================
; Name...........: _cURL_Easy_Init
; Description ...: Start a libcurl easy session
; Syntax.........: _cURL_Easy_Init()
; Parameters ....:
; Return values .: cURL handle
; Author ........: BIOS
; Modified.......: 05/05/2015
; Related .......:
; Link ..........: http://curl.haxx.se/libcurl/c/curl_easy_init.html
; Example .......:
; ===============================================================================================================================
Func _cURL_Easy_Init()
	$aRet = DllCall($_cURL_hDll, "ptr:cdecl", "easy_init")
	If @error Then Return SetError(@error, 0, 0)

	Return $aRet[0]
EndFunc   ;==>_cURL_Easy_Init

; #FUNCTION# ===========================================================================================================
; Name...........: _cURL_Easy_SetOpt
; Description ...: Set options to cURL handle
; Syntax.........: _cURL_Easy_SetOpt( $hCURL, $iOpt, $vVal )
; Parameters ....: $hCURL - cURL handle from _cURL_Easy_Init
;                  $iOpt - One of the $cURL_OPT_* constant
;                  $vVal - Value to set (PTR, INT or STRING)
; Return values .: $cURL_E*
; Author ........: BIOS
; Modified.......: 05/05/2015
; Related .......:
; Link ..........: http://curl.haxx.se/libcurl/c/curl_easy_setopt.html
; Example .......:
; ===============================================================================================================================
Func _cURL_Easy_SetOpt($hCURL, $iOpt, $vVal)
	Select
		Case IsArray($vVal)
			Return _cURL_Easy_SetOpt($hCURL, $iOpt, _ArrayToString($vVal, @LF))
		Case IsPtr($vVal)
			$aRet = DllCall($_cURL_hDll, "int:cdecl", "easy_setopt_void", "ptr", $hCURL, "int", $iOpt, "ptr", $vVal)
		Case IsString($vVal)
			$aRet = DllCall($_cURL_hDll, "int:cdecl", "easy_setopt_str", "ptr", $hCURL, "int", $iOpt, "str", $vVal)
		Case Else
			$aRet = DllCall($_cURL_hDll, "int:cdecl", "easy_setopt_long", "ptr", $hCURL, "int", $iOpt, "long", $vVal)
	EndSelect
	If @error Then Return SetError(@error, 0, 0)

	Return $aRet[0]
EndFunc   ;==>_cURL_Easy_SetOpt

; #FUNCTION# ===========================================================================================================
; Name...........: _cURL_Easy_SetWriteFuncMode
; Description ...: Set callback mode for response, now you must set options $cURL_OPT_HEADERDATA or $cURL_OPT_WRITEDATA with $cURL_tagCALLBACKDATA
; Syntax.........: _cURL_Easy_SetWriteFuncMode( $hCURL, $sFuncName )
; Parameters ....: $hCURL - cURL handle from _cURL_Easy_Init
; Return values .: $cURL_E*
; Author ........: BIOS
; Modified.......: 05/05/2015
; Related .......:
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _cURL_Easy_SetWriteFuncMode($hCURL)
	$aRet = DllCall($_cURL_hDll, "int:cdecl", "easy_setopt_writefuncmode", "ptr", $hCURL)
	If @error Then Return SetError(@error, 0, 0)

	Return $aRet[0]
EndFunc   ;==>_cURL_Easy_SetWriteFuncMode

; #FUNCTION# ===========================================================================================================
; Name...........: _cURL_Easy_GetInfo
; Description ...: extract information from a curl handle
; Syntax.........: _cURL_Easy_GetInfo( $hCURL, $iInfo )
; Parameters ....: $hCURL - cURL handle from _cURL_Easy_Init
;                  $iInfo - One of the $cURL_INFO_* constant
; Return values .: $cURL_E*
; Author ........: BIOS
; Modified.......: 05/05/2015
; Related .......:
; Link ..........: http://curl.haxx.se/libcurl/c/curl_easy_getinfo.html
; Example .......:
; ===============================================================================================================================
Func _cURL_Easy_GetInfo($hCURL, $iInfo)
	$aRet = DllCall($_cURL_hDll, "int:cdecl", "easy_getinfo", "ptr", $hCURL, "int", $iInfo)
	If @error Then Return SetError(@error, 0, 0)

	Return $aRet[0]
EndFunc   ;==>_cURL_Easy_GetInfo

; #FUNCTION# ===========================================================================================================
; Name...........: _cURL_Easy_Perform
; Description ...: Performe request
; Syntax.........: _cURL_Easy_Perform( $hCURL )
; Parameters ....: $hCURL - cURL handle from _cURL_Easy_Init
; Return values .: $cURL_E*
; Author ........: BIOS
; Modified.......: 05/05/2015
; Related .......:
; Link ..........: http://curl.haxx.se/libcurl/c/curl_easy_perform.html
; Example .......:
; ===============================================================================================================================
Func _cURL_Easy_Perform($hCURL)
	$aRet = DllCall($_cURL_hDll, "int:cdecl", "easy_perform", "ptr", $hCURL)
	If @error Then Return SetError(@error, 0, 0)

	Return $aRet[0]
EndFunc   ;==>_cURL_Easy_Perform

; #FUNCTION# ===========================================================================================================
; Name...........: _cURL_Easy_Cleanup
; Description ...: End a libcurl easy handle
; Syntax.........: _cURL_Easy_Cleanup( $hCURL )
; Parameters ....: $hCURL - cURL handle from _cURL_Easy_Init
; Return values .: Always 1
; Author ........: BIOS
; Modified.......: 05/05/2015
; Related .......:
; Link ..........: http://curl.haxx.se/libcurl/c/curl_easy_cleanup.html
; Example .......:
; ===============================================================================================================================
Func _cURL_Easy_Cleanup($hCURL)
	$aRet = DllCall($_cURL_hDll, "int:cdecl", "easy_cleanup", "ptr", $hCURL)
	If @error Then Return SetError(@error, 0, 0)

	Return 1
EndFunc   ;==>_cURL_Easy_Cleanup

; #FUNCTION# ===========================================================================================================
; Name...........: _cURL_Shutdown
; Description ...: Destroy Dll handle
; Syntax.........: _cURL_Shutdown()
; Return values .: Success - 1
; Author ........: BIOS
; Modified.......: 05/05/2015
; Related .......:
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _cURL_Shutdown()
	If Not $_cURL_hDll Then Return 2
	Return SetError(@error, 0, DllClose($_cURL_hDll))
EndFunc   ;==>_cURL_Shutdown

; #FUNCTION# ===========================================================================================================
; Name...........: _cURL_Version
; Description ...: Returns version of libcurl
; Syntax.........: _cURL_Version()
; Return values .: Success - Version
; Author ........: BIOS
; Modified.......: 05/05/2015
; Related .......:
; Link ..........: http://curl.haxx.se/libcurl/c/curl_version.html
; Example .......:
; ===============================================================================================================================
Func _cURL_Version()
	$aRet = DllCall($_cURL_hDll, "ptr:cdecl", "_version")
	If @error Then Return SetError(@error, 0, 0)

	$struct = DllStructCreate('char val[512]', $aRet[0])
	$sRet = ''
	For $i = 1 To 512
		$sVal = DllStructGetData($struct, 'val', $i)
		If $sVal = 0 Then ExitLoop
		$sRet &= $sVal
	Next
	Return $sRet
EndFunc   ;==>_cURL_Version

; #FUNCTION# ===========================================================================================================
; Name...........: _cURL_Easy_Escape
; Description ...: URL encodes the given string
; Syntax.........: _cURL_Easy_Escape( $hCURL, $sString )
; Parameters ....: $hCURL - cURL handle from _cURL_Easy_Init
;                  $sString - String to escape
; Return values .: Success - New string
; Author ........: BIOS
; Modified.......: 05/05/2015
; Related .......:
; Link ..........: http://curl.haxx.se/libcurl/c/curl_easy_escape.html
; Example .......:
; ===============================================================================================================================
Func _cURL_Easy_Escape($hCURL, $sString)
	$aRet = DllCall($_cURL_hDll, "ptr:cdecl", "easy_escape", "ptr", $hCURL, "str", $sString, "int", StringLen($sString))
	If @error Then Return SetError(@error, 0, 0)

	$iMaxLen = StringLen($sString) * 3
	$struct = DllStructCreate('char val[' & $iMaxLen & ']', $aRet[0])
	$sRet = ''
	For $i = 1 To $iMaxLen
		$sVal = DllStructGetData($struct, 'val', $i)
		If $sVal = 0 Then ExitLoop
		$sRet &= $sVal
	Next

	_cURL_Free($aRet[0])
	Return $sRet
EndFunc   ;==>_cURL_Easy_Escape

; #FUNCTION# ===========================================================================================================
; Name...........: _cURL_Easy_DupHandle
; Description ...: Clone a libcurl session handle
; Syntax.........: _cURL_Easy_DupHandle( $hCURL )
; Parameters ....: $hCURL - cURL handle from _cURL_Easy_Init
; Return values .: $cURL_E*
; Author ........: BIOS
; Modified.......: 05/05/2015
; Related .......:
; Link ..........: http://curl.haxx.se/libcurl/c/curl_easy_duphandle.html
; Example .......:
; ===============================================================================================================================
Func _cURL_Easy_DupHandle($hCURL)
	$aRet = DllCall($_cURL_hDll, "ptr:cdecl", "easy_duphandle", "ptr", $hCURL)
	If @error Then Return SetError(@error, 0, 0)

	Return $aRet[0]
EndFunc   ;==>_cURL_Easy_DupHandle

; #FUNCTION# ===========================================================================================================
; Name...........: _cURL_Easy_Pause
; Description ...: pause and unpause a connection
; Syntax.........: _cURL_Easy_Pause( $hCURL, $iBitmask )
; Parameters ....: $hCURL - cURL handle from _cURL_Easy_Init
;                  $iBitmask - set of bits that sets the new state of the connection. Combination of $cURL_PAUSE_*
; Return values .: $cURL_E*
; Author ........: BIOS
; Modified.......: 05/05/2015
; Related .......:
; Link ..........: http://curl.haxx.se/libcurl/c/curl_easy_pause.html
; Example .......:
; ===============================================================================================================================
Func _cURL_Easy_Pause($hCURL, $iBitmask)
	$aRet = DllCall($_cURL_hDll, "int:cdecl", "easy_pause", "ptr", $hCURL, "int", $iBitmask)
	If @error Then Return SetError(@error, 0, 0)

	Return $aRet[0]
EndFunc   ;==>_cURL_Easy_Pause

; #FUNCTION# ===========================================================================================================
; Name...........: _cURL_Easy_Recv
; Description ...: receives raw data on an "easy" connection
; Syntax.........: _cURL_Easy_Recv( $hCURL, $pBuffer, $iSize, $pN )
; Parameters ....: $hCURL - cURL handle from _cURL_Easy_Init
;                  $pBuffer - pointer to your buffer that will get the received data
;                  $iSize - maximum amount of data you can get in that buffer
;                  $iN - number of received bytes
; Return values .: $cURL_E*
; Author ........: BIOS
; Modified.......: 05/05/2015
; Related .......:
; Link ..........: http://curl.haxx.se/libcurl/c/curl_easy_recv.html
; Example .......:
; ===============================================================================================================================
Func _cURL_Easy_Recv($hCURL, $pBuffer, $iSize, ByRef $iN)
	$struct = DllStructCreate('int val')
	$aRet = DllCall($_cURL_hDll, "int:cdecl", "easy_recv", "ptr", $hCURL, "ptr", $pBuffer, "int", $iSize, "ptr", DllStructGetPtr($struct))
	If @error Then Return SetError(@error, 0, 0)

	$iN = DllStructGetData($struct, 'val')
	Return $aRet[0]
EndFunc   ;==>_cURL_Easy_Recv

; #FUNCTION# ===========================================================================================================
; Name...........: _cURL_Easy_Reset
; Description ...: reset all options of a libcurl session handle
; Syntax.........: _cURL_Easy_Reset( $hCURL )
; Parameters ....: $hCURL - cURL handle from _cURL_Easy_Init
; Return values .: Always 1
; Author ........: BIOS
; Modified.......: 05/05/2015
; Related .......:
; Link ..........: http://curl.haxx.se/libcurl/c/curl_easy_reset.html
; Example .......:
; ===============================================================================================================================
Func _cURL_Easy_Reset($hCURL)
	$aRet = DllCall($_cURL_hDll, "none:cdecl", "easy_reset", "ptr", $hCURL)
	If @error Then Return SetError(@error, 0, 0)

	Return 1
EndFunc   ;==>_cURL_Easy_Reset

; #FUNCTION# ===========================================================================================================
; Name...........: _cURL_Easy_Send
; Description ...: sends raw data over an "easy" connection
; Syntax.........: _cURL_Easy_Send( $hCURL, $pBuffer, $iSize, $pN )
; Parameters ....: $hCURL - cURL handle from _cURL_Easy_Init
;                  $pBuffer - pointer to the data that you want sent
;                  $iSize - data length that you want sent
;                  $pN - number of sent bytes
; Return values .: $cURL_E*
; Author ........: BIOS
; Modified.......: 05/05/2015
; Related .......:
; Link ..........: http://curl.haxx.se/libcurl/c/curl_easy_send.html
; Example .......:
; ===============================================================================================================================
Func _cURL_Easy_Send($hCURL, $pBuffer, $iSize, ByRef $iN)
	$struct = DllStructCreate('int val')
	$aRet = DllCall($_cURL_hDll, "int:cdecl", "easy_send", "ptr", $hCURL, "ptr", $pBuffer, "int", $iSize, "ptr", DllStructGetPtr($struct))
	If @error Then Return SetError(@error, 0, 0)

	$iN = DllStructGetData($struct, 'val')
	Return $aRet[0]
EndFunc   ;==>_cURL_Easy_Send

; #FUNCTION# ===========================================================================================================
; Name...........: _cURL_Easy_UnEscape
; Description ...: URL decodes the given string
; Syntax.........: _cURL_Easy_UnEscape( $hCURL, $sString, $iOutLength )
; Parameters ....: $hCURL - cURL handle from _cURL_Easy_Init
;                  $sString - String to unescape
;                  $pOutLength - Variable to store new string length
; Return values .: Success - New string
; Author ........: BIOS
; Modified.......: 05/05/2015
; Related .......:
; Link ..........: http://curl.haxx.se/libcurl/c/curl_easy_unescape.html
; Example .......:
; ===============================================================================================================================
Func _cURL_Easy_UnEscape($hCURL, $sString, ByRef $iOutLength)
	$struct = DllStructCreate('int val')

	$aRet = DllCall($_cURL_hDll, "ptr:cdecl", "easy_unescape", "ptr", $hCURL, "str", $sString, "int", StringLen($sString), "ptr", DllStructGetPtr($struct))
	If @error Then Return SetError(@error, 0, 0)

	$iOutLength = DllStructGetData($struct, 'val')

	$stuct = DllStructCreate('char val[' & $iOutLength & ']', $aRet[0])
	$sOutString = DllStructGetData($struct, 'val')

	_cURL_Free($aRet[0])
	Return $sOutString
EndFunc   ;==>_cURL_Easy_UnEscape

; #FUNCTION# ===========================================================================================================
; Name...........: _cURL_Multi_AddHandle
; Description ...: add an easy handle to a multi session
; Syntax.........: _cURL_Multi_AddHandle( $hCURLM, $hCURL )
; Parameters ....: $hCURLM - cURL handle from _cURL_Multi_Init
;                  $hCURL  - cURL handle from _cURL_Easy_Init
; Return values .: $cURL_E*
; Author ........: BIOS
; Modified.......: 20/05/2015
; Related .......:
; Link ..........: http://curl.haxx.se/libcurl/c/curl_multi_add_handle.html
; Example .......:
; ===============================================================================================================================
Func _cURL_Multi_AddHandle($hCURLM, $hCURL)
	$aRet = DllCall($_cURL_hDll, "int:cdecl", "multi_add_handle", "ptr", $hCURLM, "ptr", $hCURL)
	If @error Then Return SetError(@error, 0, 0)

	Return $aRet[0]
EndFunc   ;==>_cURL_Multi_AddHandle

; #FUNCTION# ===========================================================================================================
; Name...........: _cURL_Multi_Cleanup
; Description ...: close down a multi session
; Syntax.........: _cURL_Multi_Cleanup( $hCURLM )
; Parameters ....: $hCURLM - cURL handle from _cURL_Multi_Init
; Return values .: $cURL_E*
; Author ........: BIOS
; Modified.......: 20/05/2015
; Related .......:
; Link ..........: http://curl.haxx.se/libcurl/c/curl_multi_cleanup.html
; Example .......:
; ===============================================================================================================================
Func _cURL_Multi_Cleanup($hCURLM)
	$aRet = DllCall($_cURL_hDll, "int:cdecl", "multi_cleanup", "ptr", $hCURLM)
	If @error Then Return SetError(@error, 0, 0)

	Return $aRet[0]
EndFunc   ;==>_cURL_Multi_Cleanup

; #FUNCTION# ===========================================================================================================
; Name...........: _cURL_Multi_InfoRead
; Description ...: close down a multi session
; Syntax.........: _cURL_Multi_InfoRead( $hCURL, ByRef $iLeft )
; Parameters ....: $hCURLM - cURL handle from _cURL_Multi_Init
;                  $iLeft  - how many messages are left
; Return values .: Success      - Array [ msg , ; what this message means
; Return values .:                        easy_handle , ; the handle it concerns
; Return values .:                        whatever , ; message-specific data
; Return values .:                        result ; return code for transfer
; Return values .:                      ]
; Author ........: BIOS
; Modified.......: 20/05/2015
; Related .......:
; Link ..........: http://curl.haxx.se/libcurl/c/curl_multi_info_read.html
; Example .......:
; ===============================================================================================================================
Func _cURL_Multi_InfoRead($hCURLM, ByRef $iLeft)
	$struct = DllStructCreate($cURL_tagCURLMSG)
	$aRet = DllCall($_cURL_hDll, "int:cdecl", "multi_info_read", "ptr", $hCURLM, "ptr", DllStructGetPtr($struct))
	If @error Then Return SetError(@error, 0, 0)

	$iLeft = $aRet[0]

	Dim $aRet[4] = [DllStructGetData($struct, 'msg'), DllStructGetData($struct, 'easy_handle'), DllStructGetData($struct, 'whatever'), DllStructGetData($struct, 'result')]

	Return $aRet
EndFunc   ;==>_cURL_Multi_InfoRead

; #FUNCTION# ===========================================================================================================
; Name...........: _cURL_Multi_Init
; Description ...: Start a libcurl multi session
; Syntax.........: _cURL_Multi_Init()
; Parameters ....:
; Return values .: cURL handle
; Author ........: BIOS
; Modified.......: 20/05/2015
; Related .......:
; Link ..........: http://curl.haxx.se/libcurl/c/curl_multi_init.html
; Example .......:
; ===============================================================================================================================
Func _cURL_Multi_Init()
	$aRet = DllCall($_cURL_hDll, "ptr:cdecl", "multi_init")
	If @error Then Return SetError(@error, 0, 0)

	Return $aRet[0]
EndFunc   ;==>_cURL_Multi_Init

; #FUNCTION# ===========================================================================================================
; Name...........: _cURL_Multi_Perform
; Description ...: reads/writes available data from each easy handle
; Syntax.........: _cURL_Multi_Perform( $hCURLM, ByRef $iRunning )
; Parameters ....: $hCURLM - cURL handle from _cURL_Multi_Init
;                  $iRunning - how many handlers are running
; Return values .: $cURL_E*
; Author ........: BIOS
; Modified.......: 20/05/2015
; Related .......:
; Link ..........: http://curl.haxx.se/libcurl/c/curl_multi_perform.html
; Example .......:
; ===============================================================================================================================
Func _cURL_Multi_Perform($hCURLM, ByRef $iRunning)
	$struct = DllStructCreate('int val')
	$aRet = DllCall($_cURL_hDll, "int:cdecl", "multi_perform", "ptr", $hCURLM, "ptr", DllStructGetPtr($struct))
	If @error Then Return SetError(@error, 0, 0)

	$iRunning = DllStructGetData($struct, 'val')

	Return $aRet[0]
EndFunc   ;==>_cURL_Multi_Perform

; #FUNCTION# ===========================================================================================================
; Name...........: _cURL_Multi_RemoveHandle
; Description ...: remove an easy handle from a multi session
; Syntax.........: _cURL_Multi_RemoveHandle( $hCURLM, $hCURL )
; Parameters ....: $hCURLM - cURL handle from _cURL_Multi_Init
;                  $hCURL  - cURL handle from _cURL_Easy_Init
; Return values .: $cURL_E*
; Author ........: BIOS
; Modified.......: 20/05/2015
; Related .......:
; Link ..........: http://curl.haxx.se/libcurl/c/curl_multi_remove_handle.html
; Example .......:
; ===============================================================================================================================
Func _cURL_Multi_RemoveHandle($hCURLM, $hCURL)
	$aRet = DllCall($_cURL_hDll, "int:cdecl", "multi_remove_handle", "ptr", $hCURLM, "ptr", $hCURL)
	If @error Then Return SetError(@error, 0, 0)

	Return $aRet[0]
EndFunc   ;==>_cURL_Multi_RemoveHandle

; #FUNCTION# ===========================================================================================================
; Name...........: _cURL_Multi_SetOpt
; Description ...: set options for a curl multi handle
; Syntax.........: _cURL_Multi_SetOpt( $hCURLM, $iOpt, $vVal )
; Parameters ....: $hCURLM - cURL handle from _cURL_Multi_Init
;                  $iOpt - One of the $cURL_MOPT_* constant
;                  $vVal - Value to set (PTR, INT or STRING)
; Return values .: $cURL_E*
; Author ........: BIOS
; Modified.......: 20/05/2015
; Related .......:
; Link ..........: http://curl.haxx.se/libcurl/c/curl_multi_setopt.html
; Example .......:
; ===============================================================================================================================
Func _cURL_Multi_SetOpt($hCURLM, $iOpt, $vVal)
	Select
		Case IsArray($vVal)
			Return _cURL_Multi_SetOpt($hCURLM, $iOpt, _ArrayToString($vVal, @LF))
		Case IsPtr($vVal)
			$aRet = DllCall($_cURL_hDll, "int:cdecl", "multi_setopt_void", "ptr", $hCURLM, "int", $iOpt, "ptr", $vVal)
		Case IsString($vVal)
			$aRet = DllCall($_cURL_hDll, "int:cdecl", "multi_setopt_str", "ptr", $hCURLM, "int", $iOpt, "str", $vVal)
		Case Else
			$aRet = DllCall($_cURL_hDll, "int:cdecl", "multi_setopt_long", "ptr", $hCURLM, "int", $iOpt, "long", $vVal)
	EndSelect
	If @error Then Return SetError(@error, 0, 0)

	Return $aRet[0]
EndFunc   ;==>_cURL_Multi_SetOpt

; #FUNCTION# ===========================================================================================================
; Name...........: _cURL_Multi_SetTimerFuncMode
; Description ...: Set callback mode for timer, now you must set options $cURL_MOPT_TIMERDATA with $cURL_tagCALLBACKDATA
; Syntax.........: _cURL_Multi_SetTimerFuncMode( $hCURLM )
; Parameters ....: $hCURLM - cURL handle from _cURL_Multi_Init
; Return values .: Always 1
; Author ........: BIOS
; Modified.......: 05/05/2015
; Related .......:
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _cURL_Multi_SetTimerFuncMode($hCURLM)
	$aRet = DllCall($_cURL_hDll, "int:cdecl", "multi_setopt_timerfuncmode", "ptr", $hCURLM)
	If @error Then Return SetError(@error, 0, 0)

	Return 1
EndFunc   ;==>_cURL_Multi_SetTimerFuncMode

; #FUNCTION# ===========================================================================================================
; Name...........: _cURL_Free
; Description ...: reclaim memory that has been obtained through a libcurl call
; Syntax.........: _cURL_Free( $hCURL, $pBuffer, $iSize, $pN )
; Parameters ....: $hCURL - cURL handle from _cURL_Easy_Init
;                  $pBuffer - pointer to the data that you want sent
;                  $iSize - data length that you want sent
;                  $pN - number of sent bytes
; Return values .: Always 1
; Author ........: BIOS
; Modified.......: 05/05/2015
; Related .......:
; Link ..........: http://curl.haxx.se/libcurl/c/curl_free.html
; Example .......:
; ===============================================================================================================================
Func _cURL_Free($pBuffer)
	$aRet = DllCall($_cURL_hDll, "none:cdecl", "_free", "ptr", $pBuffer)
	If @error Then Return SetError(@error, 0, 0)

	Return 1
EndFunc   ;==>_cURL_Free

; #FUNCTION# ===========================================================================================================
; Name...........: _cURL_GetDate
; Description ...: Convert a date string to number of seconds
; Syntax.........: _cURL_GetDate( $sDate )
; Parameters ....: $sDate - String of date, see http://curl.haxx.se/libcurl/c/curl_getdate.html
; Return values .: Success - Date in number format
; Author ........: BIOS
; Modified.......: 05/05/2015
; Related .......:
; Link ..........: http://curl.haxx.se/libcurl/c/curl_getdate.html
; Example .......:
; ===============================================================================================================================
Func _cURL_GetDate($sDate)
	$aRet = DllCall($_cURL_hDll, "int:cdecl", "getdate", "str", $sDate)
	If @error Then Return SetError(@error, 0, 0)

	Return $aRet[0]
EndFunc   ;==>_cURL_GetDate

; #FUNCTION# ===========================================================================================================
; Name...........: _cURL_VersionInfo
; Description ...: Returns deetailed version of libcurl
; Syntax.........: _cURL_VersionInfo( $iType )
; Parameters ....: $iType - Version to get detailed info
; Return values .: Success      - Array [ age , ; describes what the age of this struct is. The number depends on how new the libcurl you're using is
; Return values .:                        version (if age >= 0), ; human readable string
; Return values .:                        version_num (if age >= 0), ; numeric representation
; Return values .:                        host (if age >= 0), ; human readable string
; Return values .:                        features (if age >= 0), ; bitmask of $cURL_VERSION_*
; Return values .:                        ssl_version (if age >= 0), ; human readable string
; Return values .:                        ssl_version_num (if age >= 0), ; always zero
; Return values .:                        libz_version (if age >= 0), ; human readable string
; Return values .:                        protocols (if age >= 0), ; protocols
; Return values .:                        ares (if age >= 1), ; human readable string
; Return values .:                        ares_num (if age >= 1), ; number
; Return values .:                        libidn (if age >= 2), ; human readable string
; Return values .:                        iconv_ver_num (if age >= 3), ; '_libiconv_version' if iconv support enabled
; Return values .:                        libssh_version (if age >= 3), ; human readable string
; Return values .:                      ]
; Author ........: BIOS
; Modified.......: 05/05/2015
; Related .......:
; Link ..........: http://curl.haxx.se/libcurl/c/curl_version_info.html
; Example .......:
; ===============================================================================================================================
Func _cURL_VersionInfo($iType = 3)
	$struct = DllStructCreate($cURL_tagVERSIONINFO)
	$aRet = DllCall($_cURL_hDll, "ptr:cdecl", "version_info", "ptr", DllStructGetPtr($struct))
	If @error Then Return SetError(@error, 0, 0)

	Dim $aConverted[13]
	$aConverted[0] = DllStructGetData($struct, 'age')

	$structt = DllStructCreate('char val[512]', DllStructGetData($struct, 'version'))
	$sRet = ''
	For $i = 1 To 512
		$sVal = DllStructGetData($structt, 'val', $i)
		If $sVal = 0 Then ExitLoop
		$sRet &= $sVal
	Next
	$aConverted[1] = $sRet
	$aConverted[2] = DllStructGetData($struct, 'version_num')

	$structt = DllStructCreate('char val[512]', DllStructGetData($struct, 'host'))
	$sRet = ''
	For $i = 1 To 512
		$sVal = DllStructGetData($structt, 'val', $i)
		If $sVal = 0 Then ExitLoop
		$sRet &= $sVal
	Next
	$aConverted[3] = $sRet
	$aConverted[4] = DllStructGetData($struct, 'features')

	$structt = DllStructCreate('char val[512]', DllStructGetData($struct, 'ssl_version'))
	$sRet = ''
	For $i = 1 To 512
		$sVal = DllStructGetData($structt, 'val', $i)
		If $sVal = 0 Then ExitLoop
		$sRet &= $sVal
	Next
	$aConverted[5] = $sRet
	$aConverted[6] = DllStructGetData($struct, 'ssl_version_num')

	$structt = DllStructCreate('char val[512]', DllStructGetData($struct, 'libz_version'))
	$sRet = ''
	For $i = 1 To 512
		$sVal = DllStructGetData($structt, 'val', $i)
		If $sVal = 0 Then ExitLoop
		$sRet &= $sVal
	Next
	$aConverted[7] = $sRet

	$structt = DllStructCreate('char val[512]', DllStructGetData($struct, 'protocols'))
	$sRet = ''
	For $i = 1 To 512
		$sVal = DllStructGetData($structt, 'val', $i)
		If $sVal = 0 Then ExitLoop
		$sRet &= $sVal
	Next
	$aConverted[8] = $sRet

	$structt = DllStructCreate('char val[512]', DllStructGetData($struct, 'ares'))
	$sRet = ''
	For $i = 1 To 512
		$sVal = DllStructGetData($structt, 'val', $i)
		If $sVal = 0 Then ExitLoop
		$sRet &= $sVal
	Next
	$aConverted[9] = $sRet
	$aConverted[10] = DllStructGetData($struct, 'ares_num')

	$structt = DllStructCreate('char val[512]', DllStructGetData($struct, 'libidn'))
	$sRet = ''
	For $i = 1 To 512
		$sVal = DllStructGetData($structt, 'val', $i)
		If $sVal = 0 Then ExitLoop
		$sRet &= $sVal
	Next
	$aConverted[11] = $sRet
	$aConverted[12] = DllStructGetData($struct, 'iconv_ver_num')

	$structt = DllStructCreate('char val[512]', DllStructGetData($struct, 'libssh_version'))
	$sRet = ''
	For $i = 1 To 512
		$sVal = DllStructGetData($structt, 'val', $i)
		If $sVal = 0 Then ExitLoop
		$sRet &= $sVal
	Next
	$aConverted[13] = $sRet

	Return $aConverted
EndFunc   ;==>_cURL_VersionInfo

; #FUNCTION# ===========================================================================================================
; Name...........: _cURL_Easy_Exec
; Description ...: Make request by specified cURL handle and return the response
; Syntax.........: _cURL_Easy_Exec( $hCURL )
; Parameters ....: $hCURL - cURL handle from _cURL_Easy_Init
; Return values .: Success - Full response string
; Author ........: BIOS
; Modified.......: 20/05/2015
; Related .......:
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _cURL_Easy_Exec($hCURL)
	_cURL_Easy_SetWriteFuncMode($hCURL)
	$callb = DllCallbackRegister('_cURL_Easy_Exec__Callback', 'int', $cURL_tagCALLBACKARGS)

	$structHeaders = DllStructCreate($cURL_tagCALLBACKDATA)
	DllStructSetData($structHeaders, 'func', DllCallbackGetPtr($callb))
	DllStructSetData($structHeaders, 'data', 1)
	_cURL_Easy_SetOpt($hCURL, $cURL_OPT_HEADERDATA, DllStructGetPtr($structHeaders))

	$structBody = DllStructCreate($cURL_tagCALLBACKDATA)
	DllStructSetData($structBody, 'func', DllCallbackGetPtr($callb))
	DllStructSetData($structBody, 'data', 2)
	_cURL_Easy_SetOpt($hCURL, $cURL_OPT_WRITEDATA, DllStructGetPtr($structBody))

	Global $_cURL__Exec_sHeaders = ''
	Global $_cURL__Exec_sBody = ''
	_cURL_Easy_Perform($hCURL)
	If @error Then Return SetError(1, 0, '')

	If $_cURL__Exec_sHeaders <> '' Then $_cURL__Exec_sBody = $_cURL__Exec_sHeaders & @CRLF & $_cURL__Exec_sBody

	Return $_cURL__Exec_sBody
EndFunc   ;==>_cURL_Easy_Exec

Func _cURL_Easy_Exec__Callback($pAddr, $iSize, $iCount, $pExtra)
	$struct = DllStructCreate('char val[' & ($iSize * $iCount) & ']', $pAddr)
	If $pExtra = 1 Then $_cURL__Exec_sHeaders &= DllStructGetData($struct, 'val')
	If $pExtra = 2 Then $_cURL__Exec_sBody &= DllStructGetData($struct, 'val')
	$struct = 0

	Return $iSize * $iCount
EndFunc   ;==>_cURL_Easy_Exec__Callback
