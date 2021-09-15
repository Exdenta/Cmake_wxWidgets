# Requirements

1. Windows 10
2. WSL 2
3. VS Code
4. VcXsrv X Server
5. Cmake 3.16
6. wxWidgets 3.15

## Install

### 2. WSL 2

[Setup guide](https://docs.microsoft.com/en-us/windows/wsl/install-win10)

sudo apt install build-essential
sudo apt install libgtk-3-dev


### 3. VS Code

[Install VS Code](https://code.visualstudio.com/) for Windows and WSL

Install extensions:
- CMake
- C++
- Remote development

### 4. VcXsrv X Server

[Setup guide](https://medium.com/javarevisited/using-wsl-2-with-x-server-linux-on-windows-a372263533c3)

### 5. Cmake 3.16

Windows:
- download .msi file from [link](https://github.com/Kitware/CMake/releases/tag/v3.16.8)
- install and add CMake to the PATH

Linux
- install latest version with command:
```
sudo apt-get install cmake
```
OR install from the source:
```
mkdir ~/libs
cd ~/libs
git clone https://github.com/Kitware/CMake.git
cd CMake/
git checkout v3.16.0
./bootstrap && make && sudo make install
```
- On Linux change CMake build directory

### 6. wxWidgets 3.15

- Download wxWidgets
```
mkdir ~/libs
cd ~/libs
git clone https://github.com/wxWidgets/wxWidgets.git
cd wxWidgets
git checkout v3.1.5
git submodule update --init
```
- Build wxWidgets shared library
```
mkdir gtk_build
cd gtk_build
../configure --enable-debug
make -j4
sudo make install
```
- Open /etc/enviroment, i.e. with:
```
sudo gedit /etc/environment
```
- Add path to library binaries to PATH in /etc/enviroment:
```
PATH="/home/alexa/libs/wxWidgets/gtk_build/lib"
```

### 7. Add new project

- Add line to the root CMakeLists.txt:
```
add_subdirectory(app)
```
- Add new folder with app.cpp file and CMakeLists.txt

### Optional:

Tools for wxWidgets:
1. Poedit (Translation for wxWidget app)
2. Установка wxFormBuilder
Скачайте .exe файл и установите
https://github.com/wxFormBuilder/wxFormBuilder/releases/tag/v3.9.0
