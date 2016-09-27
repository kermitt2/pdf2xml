
set DIRSRC=.\src
set DIREXE=.\exe

set DIRXPDF= ..\xpdf-3.03\xpdf
set DIRGOO=..\xpdf-3.03\goo
set DIRFOFI=..\xpdf-3.03\fofi
set DIRPNG=.\image\png
set DIRZLIB=.\image\zlib
set DIRLIBXML=.\libxml2-2.6.19+.win32
set DIRICONV=.\iconv-1.9.1.win32
set CC=c:\mingw\bin\gcc.exe
set CFLAGS=-g -O2 -I %DIRSRC% -I %DIRFOFI% -I %DIRGOO%
set CXX=c:\mingw\bin\g++.exe
set CXXFLAGS=%CFLAGS%
set LIBPROG=c:\mingw\bin\ar.exe

copy ..\xpdf\aconf-dj.h %DIRSRC%\aconf.h

%CXX% %CXXFLAGS% -I%DIRXPDF% -I%DIRLIBXML%\include -I%DIRICONV%\include -c %DIRSRC%\ConstantsUtils.cc
%CXX% %CXXFLAGS% -I%DIRXPDF% -I%DIRLIBXML%\include -I%DIRICONV%\include -c %DIRSRC%\ConstantsXML.cc
%CXX% %CXXFLAGS% -I%DIRXPDF% -I%DIRLIBXML%\include -I%DIRICONV%\include -c %DIRSRC%\Parameters.cc
%CXX% %CXXFLAGS% -I%DIRXPDF% -I%DIRLIBXML%\include -I%DIRICONV%\include -c %DIRSRC%\AnnotsXrce.cc
%CXX% %CXXFLAGS% -I%DIRXPDF% -I%DIRLIBXML%\include -I%DIRICONV%\include -c %DIRSRC%\PDFDocXrce.cc
%CXX% %CXXFLAGS% -I%DIRXPDF% -I%DIRPNG%  -I%DIRZLIB% -I%DIRLIBXML%\include -I%DIRICONV%\include -c %DIRSRC%\XmlOutputdev.cc
del %DIRSRC%\libsrc.a
%LIBPROG% -rc %DIRSRC%\libsrc.a *.o

%CXX% %CXXFLAGS% --static  -o %DIREXE%\pdftoxml.exe %DIRSRC%\pdftoxml.cc -I%DIRPNG%  -I%DIRZLIB%  -I%DIRXPDF% -I%DIRLIBXML%\include -I%DIRICONV%\include %DIRLIBXML%\bin\libxml2.dll %DIRSRC%\libsrc.a %DIRXPDF%\libxpdf.a %DIRFOFI%\libfofi.a %DIRGOO%\libGoo.a %DIRPNG%\libpng.a 

