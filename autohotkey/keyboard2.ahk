; ================================
; INIT
; *===============================

#Requires AutoHotkey v2.0

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
^#i::Run "C:\ProgramData\chocolatey\lib\autohotkey.portable\tools\Install.cmd"

; ================================
; REASSIGN SILLY WINDOWS KEYS
; ================================

#Backspace::!F4
; #f::return
; #h::WinMinimize "A"

; ================================
; HYPER APPS
; ================================

#Enter::RunOrActivate("Cmder ahk_exe ConEmu64.exe","C:\tools\Cmder\Cmder.exe","")
	#F::RunOrActivate("ahk_exe vivaldi.exe","C:\Program Files\Vivaldi\Application\vivaldi.exe","")
	#B::RunOrActivate("ahk_exe thunderbird.exe","C:\Program Files\Mozilla Thunderbird\thunderbird.exe","")
	#M::RunOrActivate("ahk_exe Spotify.exe","C:\Users\soyla\AppData\Roaming\Spotify\Spotify.exe","")
	; #N::RunOrActivate("ahk_exe Joplin.exe","C:\Program Files\Joplin\Joplin.exe","")
	#P::RunOrActivate("ahk_exe KeePassXC.exe","C:\Program Files\KeePassXC\KeePassXC.exe","")
 ^!Esc::RunOrActivate("ahk_exe taskmgr.exe","taskmgr.exe","")
	#J::RunOrActivate("ahk_exe Playnite.DesktopApp.exe","C:\Users\soyla\AppData\Local\Playnite\Playnite.DesktopApp.exe","")


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

; ================================
; GAYMING
; ================================

#HotIf WinActive("ahk_exe Playnite.DesktopApp.exe")
	Joy13::F11
#HotIf

; ================================
; EXPLORER.EXE
; ================================

global explorer_tests := [ "ahk_class CabinetWClass",
	"Save",
	"Saving",
	"Open", ]

#E::RunOrActivate("ahk_class CabinetWClass","explorer.exe C:\Users\soyla\","")

#HotIf MultiWindowCheck(explorer_tests)
	; TODO: ^? to see a list of hotkeys for explorer
	^+H::ChangeDirectory("%PUBLIC%")
	^H::ChangeDirectory("%HOMEPATH%")
	^J::ChangeDirectory("%HOMEPATH%\Downloads")
	^K::ChangeDirectory("%APPDATA%")
	^I::ChangeDirectory("%LOCALAPPDATA%")
	^D::ChangeDirectory("%HOMEPATH%\.dotfiles")
	^P::ChangeDirectory("%HOMEPATH%\Projects")
	^M::ChangeDirectory("P:\Media")
	^G::ChangeDirectory("C:\Games")
#HotIf

ChangeDirectory(location)
{
	Send "^l"
	Send location
	Send "{Enter}"
}

MultiWindowCheck(tests)
{
	global
	local is_active := false

	for k,v in tests {
		if WinActive(v) {
			is_active := true
			break
		}
	}

	return is_active
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

