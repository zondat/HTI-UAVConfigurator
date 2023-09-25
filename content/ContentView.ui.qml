

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 2.15
import QtQuick.Controls 2.15
import UavConfigurator 1.0
import FlowView 1.0

Rectangle {
    id: contentViewBound
    width: Constants.width
    height: Constants.height - Constants.globalToolBarHeight
    color: Constants.lightYellow

    Row {
        id: contentView
        anchors.fill: parent

        MainContent {
            id: mainContent
        }

        InfoView {
            id: infoView
        }
    }

    //    TabButton {
    //        id: buttonMenu
    //        anchors.top: parent.top
    //        autoExclusive: false
    //        font.pointSize: 13
    //        font.weight: Font.Bold
    //        font.bold: true
    //        checked: false
    //        checkable: false
    //        anchors.left: parent.left
    //        width: Constants.tabButtonWidth
    //        height: Constants.tabButtonHeight
    //        text: qsTr("Menu")
    //    }

    //    TabButton {
    //        id: buttonSystemStatus
    //        anchors.top: buttonMenu.bottom
    //        anchors.left: parent.left
    //        width: Constants.tabButtonWidth
    //        height: Constants.tabButtonHeight
    //        text: qsTr("System Status")
    //    }

    //    TabButton {
    //        id: buttonFirmware
    //        anchors.top: buttonSystemStatus.bottom
    //        anchors.left: parent.left
    //        width: Constants.tabButtonWidth
    //        height: Constants.tabButtonHeight
    //        text: qsTr("Firmware")
    //    }

    //    TabButton {
    //        id: buttonHardware
    //        anchors.top: buttonFirmware.bottom
    //        anchors.left: parent.left
    //        width: Constants.tabButtonWidth
    //        height: Constants.tabButtonHeight
    //        text: qsTr("Hardware")
    //    }

    //    TabButton {
    //        id: buttonFlightMode
    //        anchors.top: buttonHardware.bottom
    //        anchors.left: parent.left
    //        width: Constants.tabButtonWidth
    //        height: Constants.tabButtonHeight
    //        text: qsTr("Flight Mode")
    //    }

    //    TabButton {
    //        id: buttonFlightPlane
    //        anchors.top: buttonFlightMode.bottom
    //        anchors.left: parent.left
    //        width: Constants.tabButtonWidth
    //        height: Constants.tabButtonHeight
    //        text: qsTr("Flight Plan")
    //    }

    //    TabButton {
    //        id: buttonAnalysis
    //        anchors.top: buttonFlightPlane.bottom
    //        font.family: "Segoe UI"
    //        anchors.left: parent.left
    //        width: Constants.tabButtonWidth
    //        height: Constants.tabButtonHeight
    //        text: qsTr("Analysis")
    //    }

    //    TabButton {
    //        id: buttonDataAccess
    //        anchors.top: buttonAnalysis.bottom
    //        font.family: "Segoe UI"
    //        anchors.left: parent.left
    //        width: Constants.tabButtonWidth
    //        height: Constants.tabButtonHeight
    //        text: qsTr("Data Access")
    //    }

    //    TabButton {
    //        id: buttonCommandlineInterface
    //        anchors.top: buttonDataAccess.bottom
    //        anchors.left: parent.left
    //        width: Constants.tabButtonWidth
    //        height: Constants.tabButtonHeight
    //        text: qsTr("CLI")
    //    }
}
