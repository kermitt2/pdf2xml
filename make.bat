
set DIRSRC=.\src
set DIREXE=.\exe

set DIRXPDF= ..\pdf2xml\xpdf_3.01\xpdf
set DIRGOO=..\pdf2xml\xpdf_3.01\goo
set DIRFOFI=..\pdf2xml\xpdf_3.01\fofi
set DIRLIBXML=..\pdf2xml\libxml2-2.6.19+.win32
set DIRICONV=..\pdf2xml\iconv-1.9.1.win32
set CC=c:\mingw\bin\gcc.exe
set CFLAGS=-g -O2 -I %DIRSRC% -I %DIRFOFI% -I %DIRGOO%
set CXX=c:\mingw\bin\g++.exe
set CXXFLAGS=%CFLAGS%
set LIBPROG=c:\mingw\bin\ar.exe

copy ..\pdf2xml\xpdf_3.01\aconf-dj.h %DIRSRC%\aconf.h

%CXX% %CXXFLAGS% -I%DIRXPDF% -I%DIRLIBXML%\include -I%DIRICONV%\include -c %DIRSRC%\ConstantsUtils.cc
%CXX% %CXXFLAGS% -I%DIRXPDF% -I%DIRLIBXML%\include -I%DIRICONV%\include -c %DIRSRC%\ConstantsXML.cc
%CXX% %CXXFLAGS% -I%DIRXPDF% -I%DIRLIBXML%\include -I%DIRICONV%\include -c %DIRSRC%\Parameters.cc
%CXX% %CXXFLAGS% -I%DIRXPDF% -I%DIRLIBXML%\include -I%DIRICONV%\include -c %DIRSRC%\AnnotsXrce.cc
%CXX% %CXXFLAGS% -I%DIRXPDF% -I%DIRLIBXML%\include -I%DIRICONV%\include -c %DIRSRC%\PDFDocXrce.cc
%CXX% %CXXFLAGS% -I%DIRXPDF% -I%DIRLIBXML%\include -I%DIRICONV%\include -c %DIRSRC%\XmlOutputdev.cc
del %DIRSRC%\libsrc.a
%LIBPROG% -rc %DIRSRC%\libsrc.a *.o

%CXX% %CXXFLAGS% -o %DIREXE%\pdftoxml.exe %DIRSRC%\pdftoxml.cc  -I%DIRXPDF% -I%DIRLIBXML%\include -I%DIRICONV%\include %DIRLIBXML%\bin\libxml2.dll %DIRSRC%\libsrc.a %DIRXPDF%\libxpdf.a %DIRFOFI%\libfofi.a %DIRGOO%\libGoo.a


