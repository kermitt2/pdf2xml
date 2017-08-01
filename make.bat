
set DIRSRC=.\src
set DIREXE=.\exe
set DIRPNG=.\image\png
set DIRZLIB=.\image\zlib

set DIRLIBXML=..\libxml2-2.7.8.win32
set DIRICONV=..\libiconv-1.9.1

set DIRXPDF_ROOT=..\xpdf-3.04
set DIRXPDF=%XPDF%\xpdf
set DIRGOO=%XPDF%\goo
set DIRFOFI=%XPDF%\fofi

set CC=vc.exe
set CFLAGS=/O2 /I%DIRSRC% /I%DIRFOFI% /I%DIRGOO% /DHAVE_CONFIG_H
set CXX=cl.exe
set CXXFLAGS=%CFLAGS% 
set LIBPROG=lib.exe

%CXX% %CXXFLAGS% /I%DIRXPDF% /I%DIRLIBXML%\include /I%DIRICONV%\include -c %DIRSRC%\ConstantsUtils.cc
%CXX% %CXXFLAGS% /I%DIRXPDF% /I%DIRLIBXML%\include /I%DIRICONV%\include -c %DIRSRC%\ConstantsXML.cc
%CXX% %CXXFLAGS% /I%DIRXPDF% /I%DIRLIBXML%\include /I%DIRICONV%\include -c %DIRSRC%\Parameters.cc
%CXX% %CXXFLAGS% /I%DIRXPDF_ROOT% /I%DIRXPDF% /I%DIRLIBXML%\include /I%DIRICONV%\include -c %DIRSRC%\AnnotsXrce.cc
%CXX% %CXXFLAGS% /I%DIRXPDF_ROOT% /I%DIRXPDF% /I%DIRLIBXML%\include /I%DIRICONV%\include -c %DIRSRC%\PDFDocXrce.cc
%CXX% %CXXFLAGS% /EHsc /I%DIRXPDF_ROOT% /I%DIRXPDF% /I%DIRPNG%  /I%DIRZLIB% /I%DIRLIBXML%\include /I%DIRICONV%\include -c %DIRSRC%\XmlOutputdev.cc

del %DIRSRC%\libsrc.lib
%LIBPROG% /OUT:%DIRSRC%\libsrc.lib *.obj

del *.obj

%CXX% %CXXFLAGS% -o %DIREXE%\pdftoxml.exe %DIRSRC%\pdftoxml.cc /EHsc /I..\dirent\include /I%DIRPNG%  /I%DIRZLIB% /I%DIRXPDF% /I%DIRXPDF_ROOT% /I%DIRLIBXML%\include /I%DIRICONV%\include %DIRLIBXML%\lib\libxml2.lib %DIRSRC%\libsrc.lib %DIRXPDF%\libxpdf.lib %DIRFOFI%\fofi.lib %DIRGOO%\Goo.lib %DIRPNG%\libpng.lib advapi32.lib
