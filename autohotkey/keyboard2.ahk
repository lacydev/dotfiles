﻿#Requires AutoHotkey v2.0

; ================================
; INIT
; *===============================

;#NoEnv	; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
;SendMode Input	; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; ================================
; AHK KEYS
; ================================

; hotkeys for this script
^#r::Reload
^#p::Pause -1
^#e::Edit

; ================================
; REASSIGN SILLY WINDOWS KEYS
; ================================

; #f::return
#Backspace::!F4
; #h::WinMinimize "A"

; ================================
; HYPER APPS
; ================================

#Enter::RunOrActivate("Cmder ahk_exe ConEmu64.exe","C:\tools\Cmder\Cmder.exe","")
	#F::RunOrActivate("ahk_exe vivaldi.exe","C:\Program Files\Vivaldi\Application\vivaldi.exe","")
	#B::RunOrActivate("ahk_exe thunderbird.exe","C:\Program Files\Mozilla Thunderbird\thunderbird.exe","")
	#M::RunOrActivate("ahk_exe Spotify.exe","C:\Users\soyla\AppData\Roaming\Spotify\Spotify.exe","")
	#N::RunOrActivate("ahk_exe Joplin.exe","C:\Program Files\Joplin\Joplin.exe","")
	#P::RunOrActivate("ahk_exe KeePassXC.exe","C:\Program Files\KeePassXC\KeePassXC.exe","")
 ^!Esc::RunOrActivate("ahk_exe taskmgr.exe","taskmgr.exe","")
	#J::RunOrActivate("ahk_exe Playnite.DesktopApp.exe","C:\Users\soyla\AppData\Local\Playnite\Playnite.DesktopApp.exe","")

; Setup for Explorer.exe
	#E::RunOrActivate("ahk_class CabinetWClass","explorer.exe C:\Users\soyla\","")

RunOrActivate(exec_test,exec_path,win_dflt)
{
	if WinExist(exec_test)
	{
		if WinActive(exec_test)
		{
			WinMinimize exec_test
		} else {
			WinActivate exec_test
		}
	} else {
		Run exec_path, ,win_dflt
		WinWait exec_test
		WinActivate exec_test
	}
	return
}
; Setup for Gayming
#HotIf WinActive("ahk_exe Playnite.DesktopApp.exe")
	Joy13::F11
#HotIf

F7 & LButton::{
	static toggle := 0
	HoldButtonToggle("LButton",toggle)
}

HoldButtonToggle(btn,toggle)
{
	if (toggle = 1) {
		Send "{" btn " up}"
		toggle := 0
	} else {
		toggle := 1
		Send "{" btn " down}"
	}
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
