
If Not WScript.Arguments.Named.Exists("elevate") Then
  CreateObject("Shell.Application").ShellExecute WScript.FullName _
    , """" & WScript.ScriptFullName & """ /elevate", "", "runas", 1
  WScript.Quit
End If

Dim objShell, strCmdGetInfo, strCmdType, strOutput, objExec, objRegInfo, objMatches, restart

strCmdGetInfo = "bcdedit"

Set objShell = CreateObject("WScript.Shell")
Set objExec = objShell.Exec(strCmdGetInfo)
strOutput = objExec.StdOut.ReadAll

Set objRegInfo = New RegExp
objRegInfo.Pattern = "hypervisorlaunchtype *(\w*)"
objRegInfo.Global = False
objRegInfo.IgnoreCase = True

Set objMatches = objRegInfo.Execute(strOutput)

If objMatches.Item(0).Submatches.Item(0) = "Auto" Then
    objShell.Exec("bcdedit /set hypervisorlaunchtype off")
Else
    objShell.Exec("bcdedit /set hypervisorlaunchtype auto")
End If

restart = MsgBox("Now changed to " & objMatches.Item(0).Submatches.Item(0) & vbCrLf & "Want to restard now?", vbYesNo Or vbExclamation Or vbMsgBoxSetForeground, "Restart")
If restart = vbYes Then
    objShell.Exec("shutdown /r /t 0")
    'MsgBox "Bye"
End If