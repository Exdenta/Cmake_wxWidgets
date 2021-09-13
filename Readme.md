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

### 3. VS Code

[Install VS Code](https://code.visualstudio.com/) for Windows and WSL

Install extensions:
- CMake
- C++
- Remote development

### 4. VcXsrv X Server

[Setup guide](https://medium.com/javarevisited/using-wsl-2-with-x-server-linux-on-windows-a372263533c3)

### 5. Cmake 3.16

# Windows:
- download .msi file from [link](https://github.com/Kitware/CMake/releases/tag/v3.16.8)
- install and add CMake to the PATH

# Linux
- install latest version with command:
```
sudo apt-get install cmake
```
OR install from the source:
```
mkdir ~/Libs
cd ~/Libs
git clone https://github.com/Kitware/CMake.git
cd CMake/
git checkout v3.16.0
./bootstrap && make && sudo make install
```

### 6. wxWidgets 3.15

- Download wxWidgets into your 3rdparty folder

```
cd ../..
git submodule add https://github.com/wxWidgets/wxWidgets.git  3rdparty/wxWidgets
cd .\3rdparty\wxWidgets
git checkout v3.1.5
git submodule update --init
```

- Add line to the CMakeLists.txt
```
add_subdirectory(3rdparty)
```
- And create CMakeLists.txt in 3rdparty folder with following content:
```
cmake_minimum_required(VERSION 3.15)
set(wxBUILD_SHARED FALSE)
add_subdirectory(wxWidgets)
add_library(3rdparty::wx::net ALIAS net)
add_library(3rdparty::wx::base ALIAS base)
add_library(3rdparty::wx::core ALIAS core)
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
