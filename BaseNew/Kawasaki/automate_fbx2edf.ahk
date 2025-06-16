#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

; Open the application
Run, "C:\Users\alexa\Desktop\BaseNew\Kawasaki\fbx2edf_x64.exe"
WinWaitActive, FBX2EDF x64
Sleep, 1000 ; Wait for the window to be fully active

; Press the 'l' key to open the load file dialog
Send, l
Sleep, 500

; Select the model file
Send, C:\Users\alexa\Desktop\BaseNew\Kawasaki\model.fbx{Enter}
Sleep, 500

; Tab 6 times
Send, {Tab 6}
Sleep, 500

; Press the spacebar to check the Recalculate Normals checkbox
Send, {Space}
Sleep, 500

; Tab twice
Send, {Tab 2}
Sleep, 500

; Paste the script file path
Send, C:\Users\alexa\Desktop\BaseNew\Kawasaki\model.ini{Enter}
Sleep, 500

; Quit the script
ExitApp
