## pdf2xml

This is a modified version of pdf2xml available at http://sourceforge.net/projects/pdf2xml

This following modifications have been made:

- encode URI (using ```xmlURIEscape``` from libxml2) for the @href attribute content to avoid blocking XML wellformedness issues. From our experiments, this problem happens in average for 2-3 scholar PDF out of one thousand.

- output coordinates of BLOCK elements when the -block option is selected,

- add a parameter -readingOrder which re-order the blocks in the reading order when the -block option is selected. By default in pdf2xml, the elements follow the PDF content stream (the so called _raw order_). In pdf2txt from xpdf, several order are available including the raw order and the reading order. With this added option, only the blocks are re-ordered.

From our experiments, the raw order can diverge quite radically from the order of elements according to the visual/reading layout in 2-4% of PDF (e.g. title element introduced at the end of the page element, while visually present at the top of the page), and minor changes can be present in up to 100% of PDF for some scientific publishers (e.g. headnote introduce at the end of the page content). This modification is thus quite useful for further information/structure extraction applications. 

- use the latest version of xpdf, version 3.04.

- more to come!

## Contributor

This version has been modified by Patrice Lopez (patrice.lopez@science-miner.com). 

## License

As the original pdf2xml, GPL2. 


## Original readme 


pdftoxml
====

version 1.0.0
July 2007 

The Xpdf software and documentation are
copyright 1996-2007 Glyph & Cog, LLC.

Email: derekn@foolabs.com
WWW: http://www.foolabs.com/xpdf/

The PDF data structures, operators, and specification are
copyright 1985-2006 Adobe Systems Inc.

The libxml2 software and documentation are released under the MIT License. 
See the Copyright file in the distribution for the precise wording.

What is pdftoxml?
-------------

pdftoxml is an open source PDF to XML convertor.  
pdftoxml runs under Linux and on Win32 systems.

pdftoxml is based on xpdf and is essentially a (large) modification 
of pdftotext in order to generate XML instead of plain text. 
The XML generation uses the libxml2 library


Distribution
------------

pdftoxml is licensed under the GNU General Public License (GPL), version 2.  


Compatibility
-------------

pdftoxml is developed and tested on a Linux 2.4 x86 system.
In addition, it has been compiled on a Win32 system. 

Getting pdftoxml
------------

The latest version is available from: https://sourceforge.net/projects/pdf2xml
Source code is available from: http://pdf2xml.cvs.sourceforge.net/pdf2xml/


Running pdftoxml
------------

To run pdftoxml, simply type:

  pdftoxml.exe file.pdf

Command line options and many other details are(should be) described in sourceforge


Compiling pdftoxml
--------------

See the separate file, INSTALL.


Contributors
----

Hervé Déjean   (src) 
Sophie Andrieu (src)
Jean-Yves Vion-Dury (schemas)






