import QtQuick 2.15
import QtQuick.Controls 2.15
import UavConfigurator 1.0
import QtQuick.Layouts 2.15


Rectangle {
    id: mainContentBound
    width: Constants.width * Constants.globalContentViewWidthFactor
    height: Constants.height - Constants.globalToolBarHeight

    TabBar {
        id: menuBar
        spacing: 4

        TabButton {
            id: buttonMenu
            anchors.top: parent.top
            autoExclusive: false
            font.pointSize: 13
            font.weight: Font.Bold
            font.bold: true
            checked: false
            checkable: false
            anchors.left: parent.left
            width: Constants.tabButtonWidth
            height: Constants.tabButtonHeight
            text: qsTr("Menu")
        }

        TabButton {
            id: buttonSystemStatus
            anchors.top: buttonMenu.bottom
            anchors.left: parent.left
            width: Constants.tabButtonWidth
            height: Constants.tabButtonHeight
            text: qsTr("System Status")
        }

        TabButton {
            id: buttonFirmware
            anchors.top: buttonSystemStatus.bottom
            anchors.left: parent.left
            width: Constants.tabButtonWidth
            height: Constants.tabButtonHeight
            text: qsTr("Firmware")
        }

        TabButton {
            id: buttonHardware
            anchors.top: buttonFirmware.bottom
            anchors.left: parent.left
            width: Constants.tabButtonWidth
            height: Constants.tabButtonHeight
            text: qsTr("Hardware")
        }

        TabButton {
            id: buttonFlightMode
            anchors.top: buttonHardware.bottom
            anchors.left: parent.left
            width: Constants.tabButtonWidth
            height: Constants.tabButtonHeight
            text: qsTr("Flight Mode")
        }

        TabButton {
            id: buttonFlightPlane
            anchors.top: buttonFlightMode.bottom
            anchors.left: parent.left
            width: Constants.tabButtonWidth
            height: Constants.tabButtonHeight
            text: qsTr("Flight Plan")
        }

        TabButton {
            id: buttonAnalysis
            anchors.top: buttonFlightPlane.bottom
            font.family: "Segoe UI"
            anchors.left: parent.left
            width: Constants.tabButtonWidth
            height: Constants.tabButtonHeight
            text: qsTr("Analysis")
        }

        TabButton {
            id: buttonDataAccess
            anchors.top: buttonAnalysis.bottom
            font.family: "Segoe UI"
            anchors.left: parent.left
            width: Constants.tabButtonWidth
            height: Constants.tabButtonHeight
            text: qsTr("Data Access")
        }

        TabButton {
            id: buttonCommandlineInterface
            anchors.top: buttonDataAccess.bottom
            anchors.left: parent.left
            width: Constants.tabButtonWidth
            height: Constants.tabButtonHeight
            text: qsTr("CLI")
        }
    }

    StackLayout {
        id: contentLayout
        width: parent.width - Constants.tabButtonWidth
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
        }

        currentIndex: menuBar.currentIndex

        Rectangle {
            color: 'teal'
            anchors.fill: parent
        }

        Rectangle {
            color: 'plum'
            anchors.fill: parent
        }

        Rectangle {
            color: 'teal'
            anchors.fill: parent
        }
        Rectangle {
            color: 'plum'
            anchors.fill: parent
        }
        Rectangle {
            color: 'teal'
            anchors.fill: parent
        }
        Rectangle {
            color: 'plum'
            anchors.fill: parent
        }
        Rectangle {
            color: 'teal'
            anchors.fill: parent
        }
        Rectangle {
            color: 'plum'
            anchors.fill: parent
        }
        Rectangle {
            color: 'teal'
            anchors.fill: parent
        }
        Rectangle {
            color: 'plum'
            anchors.fill: parent
        }
    }

}

