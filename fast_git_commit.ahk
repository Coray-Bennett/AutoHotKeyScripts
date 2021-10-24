#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%
#IfWinActive
^!g::
Send, git add .{Enter}
Send, git status{Enter}
Sleep 100
InputBox, msg, Commit Message
message := msg
if(msg = "i"){
    message := "initial commit"
}
else if(msg = "ft"){
    message := "failing test"
}
else if(msg = "pt"){
    message := "passing test"
}
else if(msg = "d"){
    message := "documentation"
}
InputBox, confirm, confirm? (y/n)
if(confirm = "y" or confirm = "yes")
{
Send, git commit -m "%message%"{Enter}
Send, git push{Enter}
}
else
{
Send, git restore --staged .{Enter}
}
return 