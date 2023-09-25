import QtQuick 2.15
import QtQuick.Controls 2.15
import UavConfigurator 1.0
//import QtQuick.Layouts 5.15


Rectangle {
    id: mainContentBound
    width: Constants.width * Constants.globalContentViewWidthFactor
    height: Constants.height - Constants.globalToolBarHeight

    Row {
        id: mainContent
        anchors.fill: parent
        layoutDirection: Qt.LeftToRight

        TabBar {
            id: tabBar
            spacing: 3
            anchors {
                top: parent.top
                bottom: parent.bottom
            }

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

//        StackView {
//            id: stackView
//            anchors.fill: parent
//            initialItem: firstPage

//            Rectangle {
//                id: firstPage
//                color: "red"
//                anchors.fill: parent
//            }

//            Rectangle {
//                id: secondPage
//                color: "blue"
//                anchors.fill: parent
//            }

//            Rectangle {
//                id: thirdPage
//                color: "orange"
//                anchors.fill: parent
//            }
//        }


    }





}

