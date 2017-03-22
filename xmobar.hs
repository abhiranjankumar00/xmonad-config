-- xmobar config used by Vic Fryzel
-- Author: Vic Fryzel
-- http://github.com/vicfryzel/xmonad-config

-- This is setup for dual 1920x1080 monitors, with the right monitor as primary
Config {
    font = "xft:Fixed-8",
    bgColor = "#000000",
    fgColor = "#ffffff",
    position = TopW L 100,
    lowerOnStart = True,
    commands = [
        Run MultiCpu ["-t","Cpu:<total0><total1><total2><total3>","-L","30","-H","60","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC","-w","3"] 10,
        Run Memory ["-t","Mem: <usedratio>%","-H","8192","-L","4096","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Swap ["-t","Swap: <usedratio>%","-H","1024","-L","512","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Date "%a %b %_d %l:%M" "date" 10,

        -- Battery information. This is likely to require some customization
        -- based upon your specific hardware. Or, for a desktop you may want
        -- to just remove this section entirely.
        Run Battery [
        "-t", "<acstatus>: <left>% - <timeleft>",
        "--",
        --"-c", "charge_full",
        "-O", "AC",
        "-o", "Bat",
        "-h", "green",
        "-l", "red"
        ] 10,

        Run StdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    template = "%StdinReader% }{ %multicpu% | %memory% * %swap% | %battery% | <fc=#FFFFCC>%date%</fc>"
}
