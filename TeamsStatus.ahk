status = %1%
lang = %2%

if !WinExist(ahk_exe Teams.exe)
{
    Run, %LOCALAPPDATA%\Microsoft\Teams\Update.exe --processStart "Teams.exe"
}
WinActivate, ahk_exe Teams.exe
WinMaximize, ahk_exe Teams.exe

if lang = NL
{
    switch status
    {
        case "available": OutputVar = beschikbaar
        case "busy": OutputVar = bezet
        case "dnd": OutputVar = niet-storen
        case "brb": OutputVar = zo-terug
        case "away": OutputVar = afwezig
        case "testcall": OutputVar = testcall
    }
} Else if lang = EN 
{
    switch status
    {
        case "available": OutputVar = available
        case "busy": OutputVar = busy
        case "dnd": OutputVar = dnd
        case "brb": OutputVar = brb
        case "away": OutputVar = away
        case "testcall": OutputVar = testcall
    }
}
Send ^/
Sleep, 200
Send %OutputVar%
Sleep, 200
Send {Enter}
return