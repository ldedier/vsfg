# vsfg
Valgrind Suppresions File Generator for C or C++

## documentation about valgrind suppressions

* https://valgrind.org/docs/manual/manual-core.html#manual-core.suppress
* https://wiki.wxwidgets.org/Valgrind_Suppression_File_Howto

## requirements

* zsh
* mktemp
* perl
* valgrind
* gcc or g++

## use

./vsfg *<filename>* [language=C]

## example

./vsfg c_supps
./vsfg c_supps c
./vsfg c++_supps c++
