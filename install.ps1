$branch = "master"
$files = @(
    "https://raw.githubusercontent.com/laat101/Microsoft-Teams-Stream-deck/$branch/TeamsShortcutNavigation.ahk",
    "https://raw.githubusercontent.com/laat101/Microsoft-Teams-Stream-deck/$branch/TeamsStatus.ahk"
    
)

$installpath =  $env:ProgramData + "\StreamDeckProject"
if(-NOT(Test-Path $installpath )){
    New-Item -Path $installpath -ItemType Directory | Out-Null
}

foreach($file in $files){
    Invoke-webrequest $file -OutFile ($installpath + "\" + ($file.Split("/")[-1]))
}
