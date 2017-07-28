#========================================================================
#
# pdftoxml Makefile using CGWIN
#
# author: Sophie Andrieu, Herve Dejean
# Xerox Research Centre Europe
# cpy XRCE 2007
#
#========================================================================
    
XPDF = ../xpdf-3.04

DIREXE=./exe
CC=gcc
CFLAGS=-Wall -g -O2 -DHAVE_CONFIG_H -I$(XPDF)
CXX=g++
CXXFLAGS=$(CFLAGS)
CXXFLAGSGOO=-I$(XPDF)/goo
CXXFLAGSFOFI=-I$(XPDF)/fofim
LIBPROG=ar

# Directories
DIRGOO=$(XPDF)/goo
DIRFOFI=$(XPDF)/fofi
DIRXPDF=$(XPDF)/xpdf
DIRSRC=src
DIREXE=exe
#DIRLIBXML=libxml2-2.6.19+.win32
DIRLIBXML=/usr/include/libxml2
ICONVSRC=../libiconv-1.15

# Executable name
PDFTOXMLEXE=pdftoxml.exe

# Main target
all: pdftoxmlEXE

# Target to compile files in src directory
compile.src:
	$(CXX) $(CXXFLAGS) $(CXXFLAGSGOO) $(CXXFLAGSFOFI) -I$(DIRXPDF) -I$(DIRLIBXML)/ -o $(DIRSRC)/ConstantsUtils.o -c $(DIRSRC)/ConstantsUtils.cc
	$(CXX) $(CXXFLAGS) $(CXXFLAGSGOO) $(CXXFLAGSFOFI) -I$(DIRXPDF) -I$(DIRLIBXML)/ -o $(DIRSRC)/ConstantsXML.o -c $(DIRSRC)/ConstantsXML.cc
	$(CXX) $(CXXFLAGS) $(CXXFLAGSGOO) $(CXXFLAGSFOFI) -I$(DIRXPDF) -I$(DIRLIBXML)/ -o $(DIRSRC)/Parameters.o -c $(DIRSRC)/Parameters.cc
	$(CXX) $(CXXFLAGS) $(CXXFLAGSGOO) $(CXXFLAGSFOFI) -I$(DIRXPDF) -I$(DIRLIBXML)/ -o $(DIRSRC)/AnnotsXrce.o -c $(DIRSRC)/AnnotsXrce.cc
	$(CXX) $(CXXFLAGS) $(CXXFLAGSGOO) $(CXXFLAGSFOFI) -I$(DIRXPDF) -I$(DIRLIBXML)/ -o $(DIRSRC)/PDFDocXrce.o -c $(DIRSRC)/PDFDocXrce.cc
	$(CXX) $(CXXFLAGS) $(CXXFLAGSGOO) $(CXXFLAGSFOFI) -I$(DIRXPDF) -I$(DIRLIBXML)/ -Iimage/png/ -o $(DIRSRC)/XmlOutputdev.o -c $(DIRSRC)/XmlOutputdev.cc
	$(CXX) $(CXXFLAGS) $(CXXFLAGSGOO) $(CXXFLAGSFOFI) -I$(DIRSRC) -I$(DIRXPDF) -I$(DIRLIBXML)/ -Iiconv-1.9.1.win32/include -o $(DIRSRC)/pdftoxml.o -c $(DIRSRC)/pdftoxml.cc
	$(LIBPROG) -rc $(DIRSRC)/libsrc.a $(DIRSRC)/*.o


# Target to create the executable for pdftoxml (locate in exe directory)
pdftoxmlEXE: compile.src
	$(CXX) $(CXXFLAGS) $(CXXFLAGSGOO) $(CXXFLAGSFOFI) -I$(DIRXPDF) -I$(DIRSRC) -I$(DIRLIBXML)/ -Iiconv-1.9.1.win32/include -o $(DIREXE)/$(PDFTOXMLEXE) $(DIRSRC)/pdftoxml.cc $(DIRSRC)/libsrc.a $(DIRXPDF)/libxpdf.a $(DIRGOO)/libGoo.a $(DIRFOFI)/libfofi.a /lib/libxml2.dll.a image/png/libpng.a

# Clean target to delete all .o files, .a files library and .exe files
clean:
    rm -f $(DIRSRC)\*.o
	rm -f $(DIRSRC)\libsrc.a
	rm -f $(DIREXE)\*.exe

