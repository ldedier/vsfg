# vsfg
Valgrind Suppresions File Generator for C or C++

## documentation about valgrind suppressions

* https://valgrind.org/docs/manual/manual-core.html#manual-core.suppress
* https://wiki.wxwidgets.org/Valgrind_Suppression_File_Howto

## requirements

* mktemp
* perl
* valgrind
* gcc or g++

## use

**./vsfg** *[-f/--file outputFileName]* *[-l/--language mainLanguage]* *[-m/--main mainFileName]* *[-h/--help]*

[-l/--language] only valid arguments are:

* c
* c++

### default:

* outputFileName: **valgrind.supp**
* language: **c**
* main: **generated automatically**

## example

* ./vsfg --file valgrind_c.supp
* ./vsfg --language c++ --main main.cpp --file valgrind_cpp.supp
