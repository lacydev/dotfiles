#Requires AutoHotkey v2.0

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
#h::WinMinimize "A"

; ================================
; HYPER APPS
; ================================

#Enter::RunOrActivate("Cmder ahk_exe ConEmu64.exe","C:\tools\Cmder\Cmder.exe","")
	#F::RunOrActivate("ahk_exe vivaldi.exe","C:\Users\soyla\Desktop\LACYYY - Vivaldi.lnk","")
	#B::RunOrActivate("ahk_exe thunderbird.exe","C:\Program Files\Mozilla Thunderbird\thunderbird.exe","")
	#M::RunOrActivate("ahk_exe Spotify.exe","C:\Users\soyla\AppData\Roaming\Spotify\Spotify.exe","")
	#N::RunOrActivate("ahk_exe Joplin.exe","C:\Program Files\Joplin\Joplin.exe","")
	#P::RunOrActivate("ahk_exe KeePassXC.exe","C:\Program Files\KeePassXC\KeePassXC.exe","")
 ^!Esc::RunOrActivate("ahk_exe taskmgr.exe","taskmgr.exe","")
	#J::RunOrActivate("ahk_exe Playnite.DesktopApp.exe","C:\Users\soyla\AppData\Local\Playnite\Playnite.DesktopApp.exe","")

; Setup for Explorer.exe
	#E::RunOrActivate("ahk_class CabinetWClass","explorer.exe c:\Users\soyla\","")

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
; Setup for Playnite
#HotIf WinActive("ahk_exe Playnite.DesktopApp.exe")
	Joy13::F11

#HotIf WinActive("ahk_class CabinetWClass")
{
	#+H::
	{
		Send "!d"
		Send "{Blind}{Text}`%HOMEPATH`%"
		Send "{Enter}"
		return
	}
	#!H::
	{
		Send "!d"
		Send "{Blind}{Text}C:\Users\Public"
		Send "{Enter}"
		return
	}
	#+J::
	{
		Send "!d"
		Send "{Blind}{Text}`%HOMEPATH`%\Downloads\"
		Send "{Enter}"
		return
	}
	#+L::
	{
		Send "!d"
		Send "{Blind}{Text}`%APPDATA`%"
		Send "{Enter}"
		return
	}
	#E::
	{
		Send "!d"
		Send "{Blind}{Text}explorer ."
		Send "{Enter}"
		return
	}
}

; ================================
; NUMPAD FOR KRITA SETUP
; ================================

#HotIf WinActive("ahk_exe krita.exe")
{
}

; ================================
; HELPFUL
; ================================

#HotIf WinActive("ahk_class Minecraft")
	!S::Send "§"
