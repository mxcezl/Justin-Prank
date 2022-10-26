Dim objShell,objFSO,objFile

Set objShell = CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")

' create path from env var %userprofile%
strPath = objShell.ExpandEnvironmentStrings("%userprofile%") & "\jh\changer.ps1"

If objFSO.FileExists(strPath) Then
    set objFile = objFSO.GetFile(strPath)
    strCMD = "powershell -nologo -command " & Chr(34) & "&{" & objFile.ShortPath & "}" & Chr(34)
    objShell.Run strCMD, 0
Else
    WScript.Echo "Failed to find " & strPath
    WScript.Quit
End If
