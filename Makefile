#========================================================================
#
# pdftoxml Makefile
#
# author: Sophie Andrieu, Herve Dejean
# Xerox Research Centre Europe
# cpy XRCE 2007
#
#========================================================================

#XPDF =xpdf_3.01
XPDF = ../xpdf-3.04


CC=gcc
CFLAGS=-Wall -I$(XPDF) 
CXX=g++
CXXFLAGS=$(CFLAGS)
CXXFLAGSGOO=-I$(XPDF)\goo
CXXFLAGSFOFI=-I$(XPDF)\fofi
LIBPROG=ar

# Directories

DIRGOO=$(XPDF)/goo
DIRFOFI=$(XPDF)/fofi
DIRXPDF=$(XPDF)/xpdf
DIRSRC=src
DIREXE=exe
DIRLIBXML=../libxml2-2.7.6.win32
ICONVSRC=../libiconv-1.15

# Executable name
PDFTOXMLEXE=pdftoxml.exe
# Main target
all: pdftoxmlEXE

# Copy the file necessary for windows into aconf.h
copy:
	cp $(XPDF)/aconf-win32.h $(XPDF)/aconf.h

# Target to compile files in src directory
compile.src: copy
	$(CXX) $(CXXFLAGS) $(CXXFLAGSGOO) $(CXXFLAGSFOFI) -I$(XPDF) -I$(DIRXPDF) -I$(DIRLIBXML)\lib -I$(DIRLIBXML)\include -I$(ICONVSRC)\include -o $(DIRSRC)\ConstantsUtils.o -c $(DIRSRC)\ConstantsUtils.cc
	$(CXX) $(CXXFLAGS) $(CXXFLAGSGOO) $(CXXFLAGSFOFI) -I$(XPDF) -I$(DIRXPDF) -I$(DIRLIBXML)\lib -I$(DIRLIBXML)\include -I$(ICONVSRC)\include -o $(DIRSRC)\ConstantsXML.o -c $(DIRSRC)\ConstantsXML.cc
	$(CXX) $(CXXFLAGS) $(CXXFLAGSGOO) $(CXXFLAGSFOFI) -I$(XPDF) -I$(DIRXPDF) -I$(DIRLIBXML)\lib -I$(DIRLIBXML)\include -I$(ICONVSRC)\include -o $(DIRSRC)\Parameters.o -c $(DIRSRC)\Parameters.cc
	$(CXX) $(CXXFLAGS) $(CXXFLAGSGOO) $(CXXFLAGSFOFI) -I$(XPDF) -I$(DIRXPDF) -I$(DIRLIBXML)\lib -I$(DIRLIBXML)\include -I$(ICONVSRC)\include -o $(DIRSRC)\AnnotsXrce.o -c $(DIRSRC)\AnnotsXrce.cc
	$(CXX) $(CXXFLAGS) $(CXXFLAGSGOO) $(CXXFLAGSFOFI) -I$(XPDF) -I$(DIRXPDF) -I$(DIRLIBXML)\lib -I$(DIRLIBXML)\include -I$(ICONVSRC)\include -o $(DIRSRC)\PDFDocXrce.o -c $(DIRSRC)\PDFDocXrce.cc
	$(CXX) $(CXXFLAGS) $(CXXFLAGSGOO) $(CXXFLAGSFOFI) -I$(XPDF) -I$(DIRXPDF) -I$(DIRLIBXML)\lib -I$(DIRLIBXML)\include -I$(ICONVSRC)\include -o $(DIRSRC)\XmlOutputdev.o -c $(DIRSRC)\XmlOutputdev.cc
	$(CXX) $(CXXFLAGS) $(CXXFLAGSGOO) $(CXXFLAGSFOFI) -I$(XPDF) -I$(DIRSRC) -I$(DIRXPDF) -I$(DIRLIBXML)\lib -I$(DIRLIBXML)\include -I$(ICONVSRC)\include -o $(DIRSRC)\pdftoxml.o -c $(DIRSRC)\pdftoxml.cc
	$(LIBPROG) -rc $(DIRSRC)\libsrc.a $(DIRSRC)/*.o


# Target to create the executable for pdftoxml (locate in exe directory)
pdftoxmlEXE: compile.src
	$(CXX) $(CXXFLAGS) $(CXXFLAGSGOO) $(CXXFLAGSFOFI) -I$(XPDF) -I$(DIRXPDF) -I$(DIRSRC) -I$(DIRLIBXML)\lib -I$(DIRLIBXML)\bin -I$(DIRLIBXML)\include -Iiconv-1.9.1.win32\include -o $(DIREXE)\$(PDFTOXMLEXE) $(DIRSRC)\pdftoxml.cc $(DIRSRC)\libsrc.a $(DIRXPDF)\libxpdf.a $(DIRGOO)\libGoo.a $(DIRFOFI)\libfofi.a $(DIRLIBXML)\bin\libxml2.dll

# Clean target to delete all .o files, .a files library and .exe files
clean:
	rm $(DIRSRC)/libsrc.a
	rm $(DIRSRC)/*.o
	rm $(DIREXE)/*.exe

