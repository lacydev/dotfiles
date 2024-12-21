; ================================
; INIT
; *===============================

#Requires AutoHotkey v2.0

;#NoEnv	; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn	; Enable warnings to assist with detecting common errors.
;SendMode Input	; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%	; Ensures a consistent starting directory.

; ================================
; AHK KEYS
; ================================

; hotkeys for this script
^#r::Reload
^#p::Pause -1
^#e::Edit
^#i::Run "C:\ProgramData\chocolatey\lib\autohotkey.portable\tools\Install.cmd"

; ================================
; REASSIGN SILLY WINDOWS KEYS
; ================================

#Backspace::!F4
; #f::return
#h::WinMinimize("A")
#c::CenterWindow("A",0)
#+c::CenterWindow("A",1)

CenterWindow(WinTitle,DoResize)
{
	if DoResize == 1
	{
		; WinMove ,,(A_ScreenWidth*0.67),(A_ScreenHeight*0.78), WinTitle
		WinMove ,,1920,(1080 + SysGet(4)), WinTitle
	}
	WinGetPos ,, &Width, &Height, WinTitle
	WinMove (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2),,, WinTitle
}

; ================================
; HYPER APPS
; ================================

RunOrActivate(exec_test,exec_path)
{
	if WinExist(exec_test)
	{
		if !WinActive(exec_test)
		{
			WinActivate(exec_test)
		} else {
			AppCycleWindows()
		}
	} else {
		Run(exec_path)
		WinWait(exec_test)
		WinActivate(exec_test)
	}
	return
}

#Enter::RunOrActivate("Cmder ahk_exe ConEmu64.exe","C:\tools\Cmder\Cmder.exe")
		; #'::RunOrActivate("NVIM ahk_exe fvim.exe","C:\ProgramData\chocolatey\bin\fvim.exe")
		#'::RunOrActivate("ahk_exe neovide.exe","C:\Program Files\Neovide\neovide.exe")
		#F::RunOrActivate("ahk_exe vivaldi.exe","C:\Program Files\Vivaldi\Application\vivaldi.exe")
		; #F::RunOrActivate("ahk_exe chrome.exe","C:\Program Files\Chromium\Application\chrome.exe"	)
		#B::RunOrActivate("ahk_exe thunderbird.exe","C:\Program Files\Mozilla Thunderbird\thunderbird.exe")
		#M::RunOrActivate("ahk_exe Spotify.exe","C:\Users\soyla\AppData\Roaming\Spotify\Spotify.exe")
		#S::RunOrActivate("ahk_exe AIMP.exe","C:\Program Files\AIMP\AIMP.exe")
		#N::RunOrActivate("ahk_exe Notion.exe","C:\Users\soyla\AppData\Local\Programs\Notion\Notion.exe")
		#P::RunOrActivate("ahk_exe KeePassXC.exe","C:\Program Files\KeePassXC\KeePassXC.exe")
 ^!Esc::RunOrActivate("ahk_exe LibreHardwareMonitor.exe","C:\ProgramData\chocolatey\lib\librehardwaremonitor\tools\LibreHardwareMonitor.exe")
		#J::RunOrActivate("ahk_exe Playnite.DesktopApp.exe","C:\Users\soyla\AppData\Local\Playnite\Playnite.DesktopApp.exe")
	 #F7::RunOrActivate("ahk_exe AutoClicker-3.0.exe", "C:\tools\Autoclicker OP\AutoClicker-3.0.exe")

AppCycleWindows()
{
	ActiveProcess := WinGetProcessName("A")
	if ActiveProcess == "explorer.exe" {
		WinActivateBottom("ahk_class CabinetWClass")
	} else {
		WinActivateBottom("ahk_exe " . ActiveProcess)
	}
}

!`::AppCycleWindows()

; ================================
; GAYMING
; ================================

#HotIf WinActive("ahk_exe Playnite.DesktopApp.exe")
	Joy13::F11
#HotIf

; ================================
; EXPLORER.EXE
; ================================


#E::RunOrActivate("ahk_class CabinetWClass","explorer.exe C:\Users\soyla\")

#HotIf WinActive("ahk_class CabinetWClass")
	; TODO: ^? to see a list of hotkeys for explorer
	^+H::ChangeDirectory("%PUBLIC%")
	 ^H::ChangeDirectory("%HOMEPATH%")
	 ^J::ChangeDirectory("%HOMEPATH%\Downloads")
	 ^K::ChangeDirectory("%APPDATA%")
	 ^I::ChangeDirectory("%LOCALAPPDATA%")
	 ^D::ChangeDirectory("%HOMEPATH%\.dotfiles")
	 ^G::ChangeDirectory("C:\Games")
	 ^P::ChangeDirectory("%HOMEPATH%\Projects")

	^!C::ChangeDirectory("C:\")
	^!D::ChangeDirectory("D:\")
	^!E::ChangeDirectory("E:\")
	^!F::ChangeDirectory("F:\")
	^!Z::ChangeDirectory("Z:\")
#HotIf

ChangeDirectory(location)
{
	Send "^l"
	Send "^a"
	Send location
	Send "{Enter}"
	return
}


; ================================
; NUMPAD
; ================================

NumpadHome::F13
NumpadUp::F14
NumpadPgUp::F15
NumpadLeft::F16
NumpadClear::F17
NumpadRight::F18
NumpadEnd::F19
NumpadDown::F20
NumpadPgDn::F21
NumpadIns::F22
NumpadDel::F23
NumpadMult::F24
NumpadDiv::^F13


