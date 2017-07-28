
set DIRSRC=.\src
set DIREXE=.\exe

set XPDF=..\xpdf-3.04
set DIRLIBXML=..\libxml2-2.7.6.win32
set DIRICONV=..\libiconv-1.15
set DIRPNG=.\image\png
set DIRZLIB=.\image\zlib

set DIRXPDF=%XPDF%\xpdf
set DIRGOO=%XPDF%\goo
set DIRFOFI=%XPDF%\fofi
set CC=c:\mingw\bin\gcc.exe
set CFLAGS=-g -O2 -I %DIRSRC% -I %DIRFOFI% -I %DIRGOO%
set CXX=c:\mingw\bin\g++.exe
set CXXFLAGS=%CFLAGS% -DHAVE_CONFIG_H
set LIBPROG=c:\mingw\bin\ar.exe

%CXX% %CXXFLAGS% -I%DIRXPDF% -I%DIRLIBXML%\include -I%DIRICONV%\include -c %DIRSRC%\ConstantsUtils.cc
%CXX% %CXXFLAGS% -I%DIRXPDF% -I%DIRLIBXML%\include -I%DIRICONV%\include -c %DIRSRC%\ConstantsXML.cc
%CXX% %CXXFLAGS% -I%DIRXPDF% -I%DIRLIBXML%\include -I%DIRICONV%\include -c %DIRSRC%\Parameters.cc
%CXX% %CXXFLAGS% -I%DIRXPDF% -I%DIRLIBXML%\include -I%DIRICONV%\include -c %DIRSRC%\AnnotsXrce.cc
%CXX% %CXXFLAGS% -I%DIRXPDF% -I%DIRLIBXML%\include -I%DIRICONV%\include -c %DIRSRC%\PDFDocXrce.cc
%CXX% %CXXFLAGS% -I%DIRXPDF% -I%DIRPNG%  -I%DIRZLIB% -I%DIRLIBXML%\include -I%DIRICONV%\include -c %DIRSRC%\XmlOutputdev.cc

del %DIRSRC%\libsrc.a
%LIBPROG% -rc %DIRSRC%\libsrc.a *.o

%CXX% %CXXFLAGS% -o %DIREXE%\pdftoxml.exe %DIRSRC%\pdftoxml.cc -I%DIRPNG%  -I%DIRZLIB% -I%DIRXPDF% -I%XPDF% -I%DIRLIBXML%\include -I%DIRICONV%\include %DIRLIBXML%\bin\libxml2.dll %DIRSRC%\libsrc.a %DIRXPDF%\libxpdf.a %DIRFOFI%\libfofi.a %DIRGOO%\libGoo.a %DIRPNG%\libpng.a 

