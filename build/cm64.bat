rem @echo off
rmdir /S /Q Win
mkdir Win
cd Win
cmake -BCMakeFiles -S../ -G "Visual Studio 16 2019"
cd ..