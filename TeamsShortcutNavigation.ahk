if !WinExist(ahk_exe Teams.exe)
{
    Run, %LOCALAPPDATA%\Microsoft\Teams\Update.exe --processStart "Teams.exe"
}
WinActivate, ahk_exe Teams.exe
WinMaximize, ahk_exe Teams.exe
Sleep, 100

outputkeys = 
for n, key in A_Args
{
    keyvalue = %key%
    if keyvalue = Ctrl 
    {
        outputkeys = %outputkeys%^
    } else if keyvalue = Shift 
    {
        outputkeys = %outputkeys%+
    } else if keyvalue = Alt 
    {
        outputkeys = %outputkeys%!
    } else if keyvalue = Left 
    {
        outputkeys = %outputkeys%{Left}
    } else if keyvalue = Right 
    {
        outputkeys = %outputkeys%{Right}
    } else if keyvalue = Up 
    {
        outputkeys = %outputkeys%{Up}
    } else if keyvalue = Down 
    {
        outputkeys = %outputkeys%{Down}
    } else if keyvalue = Enter 
    {
        outputkeys = %outputkeys%{Enter}
    } else 
    {
        outputkeys = %outputkeys%%keyvalue%
    }
}
Send %outputkeys%
Return