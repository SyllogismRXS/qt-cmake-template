Notes for Building on Windows
==============================

Build Dependencies:
--------------------
1. MinGW (installer/mingw-get-setup.exe) 
2. cmake (Win32 installer)
3. Qt libraries 4.8.6 for Windows (MinGW)

MinGW Notes:
-------------
After installing MinGW with the automated installer, you will need to install
the build tools. Install the following build tools:
1. mingw-developer-toolkit
2. mingw32-base
3. mingw32-gcc-g++
4. msys-base

Setup your PATH:
----------------
Under "Advanced System Settings" -> Environment Variables. Edit the PATH 
variable under the "System variables." Append the MinGW, Qt, and CMake bin
directories to the PATH variable. For example:

C:\MinGW\bin;C:\Qt\4.8.6\bin;C:\Program Files (x86)\CMake 2.8\bin 

Configure and Build
--------------------
Open a regular cmd prompt (for some reason you can't use MinGW prompt) and 
navigate to the qt-cmake-template directory. Execute the build.bat windows
script.

\path\to\qt-cmake-template> build.bat

This should generate executables in the bin directory. Double click on the
executables to run them.


