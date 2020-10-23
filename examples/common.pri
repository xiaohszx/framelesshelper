DESTDIR = $$OUT_PWD/../../bin
CONFIG += c++17 strict_c++ utf8_source warn_on
DEFINES += \
    QT_NO_CAST_FROM_ASCII \
    QT_NO_CAST_TO_ASCII
RESOURCES += $$PWD/images.qrc
win32 {
    DEFINES += \
        WIN32_LEAN_AND_MEAN \
        _CRT_SECURE_NO_WARNINGS \
        WNEF_LINK_SYSLIB
    CONFIG += windeployqt
    CONFIG -= embed_manifest_exe
    LIBS += -luser32 -lshell32 -lgdi32 -ldwmapi -lshcore -ld2d1
    RC_FILE = $$PWD/windows.rc
    OTHER_FILES += $$PWD/windows.manifest
}
CONFIG(debug, debug|release) {
    LIBS += -L$$OUT_PWD/../../debug
    win32: LIBS += -lFramelessHelperd
    else: unix: LIBS += -lFramelessHelper_debug
} else: CONFIG(release, debug|release) {
    LIBS += -L$$OUT_PWD/../../release -lFramelessHelper
}
