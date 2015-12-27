# Windows environment setup
## The windows commandline (cmd.exe)
First of all to have the autocomplete behave like the one on Linux we need to install Clink. https://mridgers.github.io/clink/ . The Windows command line has some "alias" support with the doskey keyword z.B. `doskey ls=dir $*` the `&*` is used to pass the parameters to the command. 

It is possible to execute a `.bat` or `.cmd` file everytime before a commandline opens. You can specify it with the Registry key `HKEY_CURRENT_USER\Software\Microsoft\Command Processor\AutoRun`. Set this Key to the path to the cmdrc.bat from this Repository and place the Macros.bat into the same directory. Everything should work now as always

## The Vimconfiguration 
Vim is a lot based around switching modes and you get to enter `normal` mode by hitting the `ESC` key. On the normal Keyboard layout the `ESC` key is on the far top left cornor which is quite a way to travel. To make thinks easier i remapped the `CAPS-Lock` key to the `ESC` key by creating a key.reg file with the following content and doubleclick on it which adds it to the registry. (Works under windows 10 like a charm) 
     REGEDIT4
     [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout]
     "Scancode Map"=hex:00,00,00,00,00,00,00,00,03,00,00,00,3a,00,46,00,01,00,3a,00,00,00,00,00
     
     
     

