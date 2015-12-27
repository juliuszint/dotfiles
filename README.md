# Windows environment setup
## The windows commandline (cmd.exe)
First of all to have the autocomplete behave like the one on Linux we need to install Clink. https://mridgers.github.io/clink/ . The Windows command line has some "alias" support with the doskey keyword z.B. `doskey ls=dir $*` the `&*` is used to pass the parameters to the command. 

It is possible to execute a `.bat` or `.cmd` file everytime before a commandline opens. You can specify it with the Registry key `HKEY_CURRENT_USER\Software\Microsoft\Command Processor\AutoRun`. Set this Key to the path to the cmdrc.bat from this Repository and place the Macros.bat into the same directory. Everything should work now as always

## The Vim Configurationfile (.vimrc)


