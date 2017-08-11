cmake_minimum_required(VERSION 3.5+)
project(pdf2xml)

set(CMAKE_CXX_STANDARD 98)

set(SOURCE_FILES
        src/AnnotsXrce.cc
        src/AnnotsXrce.h
        src/ConstantsUtils.cc
        src/ConstantsUtils.h
        src/ConstantsXML.cc
        src/ConstantsXML.h
        src/Parameters.cc
        src/Parameters.h
        src/PDFDocXrce.cc
        src/PDFDocXrce.h
        src/pdftoxml.cc
        src/XmlOutputDev.cc
        src/XmlOutputDev.h
        )

include(ExternalProject)
ExternalProject_Add(xpdf
        SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/xpdf
        CONFIGURE_COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/xpdf/configure --prefix=<INSTALL_DIR>
        BUILD_COMMAND ${MAKE})

set(XPDF_BUILD_DIR ${CMAKE_CURRENT_SOURCE_DIR}/xpdf-prefix/src/xpdf-build)

add_executable(pdf2xml ${SOURCE_FILES})
add_dependencies(pdf2xml xpdf)

target_link_libraries(pdf2xml png zlib xml2 ${XPDF_BUILD_DIR}/xpdf/libXpdf.a ${XPDF_BUILD_DIR}/fofi/libfofi.a ${XPDF_BUILD_DIR}/goo/libGoo.a)
target_include_directories(pdf2xml
        PUBLIC /usr/include/libxml2
        PUBLIC image/png
        PUBLIC xpdf
        PUBLIC xpdf/goo
        PUBLIC xpdf/fofi
        PUBLIC xpdf/xpdf
        PUBLIC ${XPDF_BUILD_DIR}
        )

add_subdirectory(image/png)
add_subdirectory(image/zlib)
