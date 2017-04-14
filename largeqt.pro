QWT_ROOT = /usr/local/qwt-6.1.3
include( $${QWT_ROOT}/qwtconfig.pri )
include( $${QWT_ROOT}/qwtbuild.pri )
include( $${QWT_ROOT}/qwtfunctions.pri )

QWT_OUT_ROOT = $${PWD}

TEMPLATE     = app

INCLUDEPATH += $${QWT_ROOT}/src
DEPENDPATH  += $${QWT_ROOT}/src

!debug_and_release {

    DESTDIR      = $${QWT_OUT_ROOT}/bin
}
else {
    CONFIG(debug, debug|release) {

        DESTDIR      = $${QWT_OUT_ROOT}/bin_debug
    }
    else {

        DESTDIR      = $${QWT_OUT_ROOT}/bin
    }
}

QMAKE_RPATHDIR *= $${QWT_OUT_ROOT}/lib
qwtAddLibrary($${QWT_OUT_ROOT}/lib, qwt)

greaterThan(QT_MAJOR_VERSION, 4) {

    QT += printsupport
    QT += concurrent
}

contains(QWT_CONFIG, QwtOpenGL ) {

    QT += opengl
}
else {

    DEFINES += QWT_NO_OPENGL
}

contains(QWT_CONFIG, QwtSvg) {

    QT += svg
}
else {

    DEFINES += QWT_NO_SVG
}


win32 {
    contains(QWT_CONFIG, QwtDll) {
        DEFINES    += QT_DLL QWT_DLL
    }
}
CONFIG += qwt

TARGET       = scatterplot

HEADERS = \
    mainwindow.h \
    plot.h

SOURCES = \
    main.cpp \
    mainwindow.cpp \
    plot.cpp
