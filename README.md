# Windows environment setup

## Windows Keyrepeat Settings
To speedup the keyrepeat delay and repeat under windows, i use a tool that i found on stackoverflow. To Compile it you need to have a C Compiler installed on your System. If Visual Studio is installed just press the windows button and enter "Developer Command Prompt for VS2015" and then run the command cl keyrepeat.c user32.lib. Right now i use 200 delay and a rate of 20
http://stackoverflow.com/questions/171326/how-can-i-increase-the-key-repeat-rate-beyond-the-oss-limit

## Windows Keyboard Layout Settings
Since Vim is only able to process Keyboard input that is a character (and Control) i modified the normal German Keyboard Layout to output characters when AltGr (Control and Alt) is pressed. To do so i used the Microsoft Keyboard Layout Creator 1.4 (downloaded from https://www.microsoft.com/en-us/download/details.aspx?id=22339), loaded (from the File menu) the existing German keyboard configuration and edited it. The Changes are saved to a file that is part of the German-Vim.zip shipped within this repository if customization is reqired. If not, the already build setup for the keyboard layout is also included in the zip. To use it install it and enter the Windows language settings to configure the Keyboard Layout to be German-Vim. Now if you press AltGr (or Ctrl-Alt) and any character reached with your left hand, a character gets output and can now be used in your vimrc.

## The windows commandline (cmd.exe)
First of all to have the autocomplete behave like the one on Linux we need to install Clink. https://mridgers.github.io/clink/ . The Windows command line has some "alias" support with the doskey keyword z.B. `doskey ls=dir $*` the `&*` is used to pass the parameters to the command. 

It is possible to execute a `.bat` or `.cmd` file everytime before a commandline opens. You can specify it with the Registry key `HKEY_CURRENT_USER\Software\Microsoft\Command Processor\AutoRun`. Set this Key to the path to the cmdrc.bat from this Repository and place the Macros.bat into the same directory. Everything should work now as always

The colors are like the ones of Visual Studio with the Dark Theme enabled. The Transparency is set to zero. The Background color is set to `RGB (30, 30, 30)` and the Foreground Text color is set to `RGB (255, 255, 255)`. 

## The Vim Configuration 
Vim is a lot based around switching modes and you get to enter `normal` mode by hitting the `ESC` key. On the normal Keyboard layout the `ESC` key is on the far top left cornor which is quite a way to travel. To make thinks easier i remapped the `CAPS-Lock` key to the `ESC` key by creating a key.reg file with the following content and doubleclick on it which adds it to the registry. (Works under windows 10 like a charm) 

     REGEDIT4
     [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout]
     "Scancode Map"=hex:00,00,00,00,00,00,00,00,03,00,00,00,3a,00,46,00,01,00,3a,00,00,00,00,00


## Vim Plugins
First of all we need to setup Pathogen (a vim plugin from tpope). To do so go to https://github.com/tpope/vim-pathogen and follow the Instructions from the README file. It basically says, copy the pathogen.vim file into the ~/.vim/autoload/ folder (if it doesnt exist create it). After you setup the call `execute pathogen#infect()` in your .vimrc file you can now clone any plugin repository into the folder ~/vim/bundles/ and pathogen will take care of settings the runtime paths in the running vim instance
     
     
     

