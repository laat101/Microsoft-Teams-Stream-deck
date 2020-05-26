$branch = "master"
$files = @(
    "https://raw.githubusercontent.com/laat101/wvd/$branch/TeamsStatus.ahk"
)

$installpath =  $env:LOCALAPPDATA + "\StreamDeckProject"
if(-NOT(Test-Path $installpath )){
    New-Item -Path $installpath -ItemType Directory | Out-Null
}

foreach($file in $files){
    Invoke-webrequest $file -OutFile ($installpath + "\" + ($file.Split("/")[-1]))
}
