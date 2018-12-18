-- xmobar config used by Vic Fryzel
-- Author: Vic Fryzel
-- https://github.com/vicfryzel/xmonad-config

-- This xmobar config is for a single 4k display (3840x2160) and meant to be
-- used with the stalonetrayrc-single config.
--
-- If you're using a single display with a different resolution, adjust the
-- position argument below using the given calculation.
Config {
    -- Position xmobar along the top, with a stalonetray in the top right.
    -- Add right padding to xmobar to ensure stalonetray and xmobar don't
    -- overlap. stalonetrayrc-single is configured for 12 icons, each 23px
    -- wide. 
    -- right_padding = num_icons * icon_size
    -- right_padding = 12 * 23 = 276
    -- Example: position = TopP 0 276
    -- position = TopP 0 276,
    position = TopW L 100,
    font = "xft:monospace-8",
    bgColor = "#000000",
    -- fgColor = "#ffffff",
    fgColor = "#d3d1c9",
    lowerOnStart = False,
    overrideRedirect = False,
    allDesktops = True,
    persistent = True,
    commands = [
        Run Weather "KSFO" ["-t","<tempF>F <skyCondition>","-L","64","-H","77","-n","#CEFFAC","-h","#FFB6B0","-l","#96CBFE"] 36000,
        -- Run MultiCpu ["-t","Cpu: <total0> <total1> <total2> <total3>","-L","30","-H","60","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC","-w","3"] 10,
        Run Cpu ["-L","3","-H","50","--low","#dfdfdf","--normal","#ffdfaf","--high","#d75f00"] 10,
        Run Memory ["-t","Mem: <usedratio>%","-H","8192","-L","4096","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Swap ["-t","Swap: <usedratio>%","-H","1024","-L","512","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Wireless "wlp4s0" ["-t","WiFi: <essid> <quality>","-H","70","-L","30","-h","#d75f00","-l","#dfdfdf","-n","#ffdfaf"] 10,
        -- Run Network "eth0" ["-t","Net: <rx>, <tx>","-H","200","-L","10","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run BatteryP ["BAT0"] ["-t", "Bat: <acstatus><watts> (<left>%)", "-L", "10", "-H", "80", "-l", "#d75f00", "-n", "#ffdfaf", "-p", "3", "--", "-O", "<fc=#dfdfdf>On</fc> - ", "-i", "", "-L", "-15", "-H", "-5", "-l", "#d75f00", "-m", "#ffdfaf", "-h", "#dfdfdf"] 60,
        Run Date "%a %b %_d %l:%M" "date" 10,
        Run Com "uname" ["-s", "-r"] "" 36000,
        Run Com "getMasterVolume" [] "volumelevel" 10,
        Run StdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    template = "%StdinReader% }{ %cpu%   %memory%   %wlp4s0wi%   %battery%   <fc=#FFFFCC>%date%</fc>"
}
