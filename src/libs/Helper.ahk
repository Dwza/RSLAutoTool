
;Save Image
SavePicture(hBM, sFile) {                                            ; By SKAN on D293 @ bit.ly/2krOIc9
Local V,  pBM := VarSetCapacity(V,16,0)>>8,  Ext := LTrim(SubStr(sFile,-3),"."),  E := [0,0,0,0]
Local Enc := 0x557CF400 | Round({"bmp":0, "jpg":1,"jpeg":1,"gif":2,"tif":5,"tiff":5,"png":6}[Ext])
  E[1] := DllCall("gdi32\GetObjectType", "Ptr",hBM ) <> 7
  E[2] := E[1] ? 0 : DllCall("gdiplus\GdipCreateBitmapFromHBITMAP", "Ptr",hBM, "UInt",0, "PtrP",pBM)
  NumPut(0x2EF31EF8,NumPut(0x0000739A,NumPut(0x11D31A04,NumPut(Enc+0,V,"UInt"),"UInt"),"UInt"),"UInt")
  E[3] := pBM ? DllCall("gdiplus\GdipSaveImageToFile", "Ptr",pBM, "WStr",sFile, "Ptr",&V, "UInt",0) : 1
  E[4] := pBM ? DllCall("gdiplus\GdipDisposeImage", "Ptr",pBM) : 1
Return E[1] ? 0 : E[2] ? -1 : E[3] ? -2 : E[4] ? -3 : 1  
}

;get rectangle
InputRect(ByRef vX1, ByRef vY1, ByRef vX2, ByRef vY2)
{
	global vInputRectState := 0
	DetectHiddenWindows, On
	Gui, 2: -Caption +ToolWindow +AlwaysOnTop +hWndhGuiSel
	Gui, 2: Color, Red
	WinSet, Transparent, 128, % "ahk_id " hGuiSel
	Hotkey, *LButton, InputRect_Return, On
	Hotkey, *RButton, InputRect_End, On
	Hotkey, Esc, InputRect_End, On
	KeyWait, LButton, D
	MouseGetPos, vX0, vY0
	SetTimer, InputRect_Update, 10
	KeyWait, LButton
	Hotkey, *LButton, Off
	Hotkey, Esc, InputRect_End, Off
	SetTimer, InputRect_Update, Off
	Gui, 2: Destroy
	return

	InputRect_Update:
	if !vInputRectState
	{
		MouseGetPos, vX, vY
		(vX < vX0) ? (vX1 := vX, vX2 := vX0) : (vX1 := vX0, vX2 := vX)
		(vY < vY0) ? (vY1 := vY, vY2 := vY0) : (vY1 := vY0, vY2 := vY)
		Gui, 2:Show, % "NA x" vX1 " y" vY1 " w" (vX2-vX1) " h" (vY2-vY1)
		return
	}
	vInputRectState := 1

	InputRect_End:
	if !vInputRectState
		vInputRectState := -1
	Hotkey, *LButton, Off
	Hotkey, *RButton, Off
	Hotkey, Esc, Off
	SetTimer, InputRect_Update, Off
	Gui, 2: Destroy

	InputRect_Return:
	return
}
