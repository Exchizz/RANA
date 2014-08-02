#-------------------------------------------------
#
# Project created by QtCreator 2014-05-22T10:45:49
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += warn_on
TARGET = Rana_qt
TEMPLATE = app



SOURCES += main.cpp\
        mainwindow.cpp \
    eventqueue.cpp \
    physics/phys.cpp \
    agentengine/agents/nestene.cpp \
    agentengine/agents/auton.cpp \
    agentengine/agents/autonlistener.cpp \
    agentengine/agents/autonLUA.cpp \
    agentengine/agents/autonscreamer.cpp \
    agentengine/agents/doctor.cpp \
    agentengine/agents/master.cpp \
    agentengine/agentdomain.cpp \
    output.cpp \
    physics/maphandler.cpp \
    control.cpp \
    graphics/agentItem.cpp \
    physics/gridmovement.cpp \
    runner.cpp

HEADERS  += mainwindow.h \
    physics/phys.h \
    agentengine/agents/nestene.h \
    agentengine/agents/auton.h \
    agentengine/agents/autonlistener.h \
    agentengine/agents/autonLUA.h \
    agentengine/agents/autonscreamer.h \
    agentengine/agents/doctor.h \
    agentengine/agents/master.h \
    agentengine/agentdomain.h \
    eventqueue.h \
    ID.h \
    utility.h \
    output.h \
    physics/maphandler.h \
    control.h \
    graphics/agentItem.h \
    physics/gridmovement.h \
    runner.h

FORMS    += mainwindow.ui

CONFIG += c++11
QMAKE_CXXFLAGS += -std=c++11 -mmacosx-version-min=10.7

LIBS += -stdlib=libc++ -mmacosx-version-min=10.7
LIBS += -L$$PWD/../lua-5.2_MacOS107_lib/ -llua52

INCLUDEPATH += $$PWD/../lua-5.2_MacOS107_lib/include
DEPENDPATH += $$PWD/../lua-5.2_MacOS107_lib/include

PRE_TARGETDEPS += $$PWD/../lua-5.2_MacOS107_lib/liblua52.a
DYLD_LIBRARY_PATH += $$PWD/../lua-5.2_MacOS107_lib/liblua52.dylib