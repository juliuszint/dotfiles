@echo off
doskey ls=dir $*
doskey rm=del $*
doskey cp=copy $*
doskey mv=move $*
doskey open=start $*
doskey clink="C:\PROGRA~2\clink\040B92~1.5/clink_x64.exe" --cfgdir "C:\Users\juliu\AppData\Local.\clink" $*
