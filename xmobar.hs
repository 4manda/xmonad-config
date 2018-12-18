-- xmobar config used by Vic Fryzel
-- Author: Vic Fryzel
-- Origin from http://github.com/vicfryzel/xmonad-config

-- Further customized for Amanda 
Config {
    font = "-*-Fixed-Bold-R-Normal-*-13-*-*-*-*-*-*-*",
    borderColor = "black",
    border = TopB,
    bgColor = "#080808",
    fgColor = "#d3d1c9",
    position = TopW L 100,
    lowerOnStart = True,
    commands = [
        Run Cpu ["-L","3","-H","50","--low","#dfdfdf","--normal","#ffdfaf","--high","#d75f00"] 10,
        Run Memory ["-t","Mem: <usedratio>%","-H","8192","-L","4096","-h","#d75f00","-l","#dfdfdf","-n","#ffdfaf"] 10,
        Run Wireless "wlp4s0" ["-t","WiFi: <essid> <quality>","-H","70","-L","30","-h","#d75f00","-l","#dfdfdf","-n","#ffdfaf"] 10,
        Run Com "uname" ["-s", "-r"] "" 36000,
        Run BatteryP ["BAT0"] ["-t", "Bat: <acstatus><watts> (<left>%)", "-L", "10", "-H", "80", "-l", "#d75f00", "-n", "#ffdfaf", "-p", "3", "--", "-O", "<fc=#dfdfdf>On</fc> - ", "-i", "", "-L", "-15", "-H", "-5", "-l", "#d75f00", "-m", "#ffdfaf", "-h", "#dfdfdf"] 60,
        Run Date "%a %b %_d %l:%M" "date" 10,
        Run Com "getMasterVolume" [] "volumelevel" 10,
        Run StdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    template = "%StdinReader% | %cpu% | %memory% | %wlp4s0wi% | }{ %battery% | %uname% | <fc=#ffaf87>%date%</fc> "
--template = "%StdinReader% }{ %multicpu%   %memory%   %swap%  %em1% |  <fc=#FFFFCC>%date%</fc>   |   Volume: <fc=#b2b2ff>%volumelevel%</fc>"
--}
