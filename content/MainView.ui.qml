

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 2.15
import QtQuick.Controls 2.15
import UavConfigurator 1.0

Page {
    id: mainViewPage
    width: Constants.width
    height: Constants.height

    Column {
        id: mainViewLayout
        anchors.fill: mainViewPage

        GlobalToolbarView {
            id: globalToolbar
            anchors.top: parent.top
            height: Constants.globalToolBarHeight
        }

        ContentView {
            id: globalContent
            anchors.top: globalToolbar.bottom
            anchors.bottom: parent.bottom
        }
    }
}
