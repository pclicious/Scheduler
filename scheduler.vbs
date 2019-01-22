Option Explicit
Dim TaskName,App_FullPath,strTime
TaskName = "Execute_Notepad"
App_FullPath = "C:\scheduler vbs\openchrome.bat"
strTime = "12:03"
Call CreateTask(TaskName,App_FullPath,strTime)
Call CreateTask(TaskName,App_FullPath,"12.30")

'*****************************************************************
Sub CreateTask(TaskName,App_FullPath,strTime)
Dim ws,strtask,exitcode
Set ws = CreateObject("Wscript.Shell")
strtask = "schtasks /create /sc Daily /tn "& qq(TaskName) & _
          " /tr "& qq(App_FullPath) & _
          " /st " & strTime & " /f"

exitcode = ws.Run(strtask, 0, True)

If exitcode <> 0 Then
  WScript.Echo "External command failed: " & Hex(exitcode)
Else
    wscript.echo "Success !"
End If
End Sub
'*****************************************************************
Function qq(str)
    qq = chr(34) & str & chr(34)
End Function
'*****************************************************************