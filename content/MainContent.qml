import QtQuick 2.15
import QtQuick.Controls 2.15
import UavConfigurator 1.0
import QtQuick.Layouts 2.15


Rectangle {
    id: mainContentBound
    width: Constants.width * Constants.globalContentViewWidthFactor
    height: Constants.height - Constants.globalToolBarHeight
    color: Constants.veryLightYellow

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

            background: Rectangle {
                color: Constants.lightYellow
            }
        }

        TabButton {
            id: buttonSystemStatus
            anchors.top: buttonMenu.bottom
            anchors.left: parent.left
            width: Constants.tabButtonWidth
            height: Constants.tabButtonHeight
            text: qsTr("System Status")
            enabled: true

            background: Rectangle {
                color: menuBar.currentIndex === 1 ? Constants.lightYellow : Constants.veryLightYellow
            }
        }

        TabButton {
            id: buttonFirmware
            anchors.top: buttonSystemStatus.bottom
            anchors.left: parent.left
            width: Constants.tabButtonWidth
            height: Constants.tabButtonHeight
            text: qsTr("Firmware")
            enabled: true

            background: Rectangle {
                color: menuBar.currentIndex === 2 ? Constants.lightYellow : Constants.veryLightYellow
            }
        }

        TabButton {
            id: buttonHardware
            anchors.top: buttonFirmware.bottom
            anchors.left: parent.left
            width: Constants.tabButtonWidth
            height: Constants.tabButtonHeight
            text: qsTr("Hardware")
            enabled: true

            background: Rectangle {
                color: menuBar.currentIndex === 3 ? Constants.lightYellow : Constants.veryLightYellow
            }
        }

        TabButton {
            id: buttonFlightMode
            anchors.top: buttonHardware.bottom
            anchors.left: parent.left
            width: Constants.tabButtonWidth
            height: Constants.tabButtonHeight
            text: qsTr("Flight Mode")
            enabled: true

            background: Rectangle {
                color: menuBar.currentIndex === 4 ? Constants.lightYellow : Constants.veryLightYellow
            }
        }

        TabButton {
            id: buttonFlightPlane
            anchors.top: buttonFlightMode.bottom
            anchors.left: parent.left
            width: Constants.tabButtonWidth
            height: Constants.tabButtonHeight
            text: qsTr("Flight Plan")
            enabled: true

            background: Rectangle {
                color: menuBar.currentIndex === 5 ? Constants.lightYellow : Constants.veryLightYellow
            }
        }

        TabButton {
            id: buttonAnalysis
            anchors.top: buttonFlightPlane.bottom
            font.family: "Segoe UI"
            anchors.left: parent.left
            width: Constants.tabButtonWidth
            height: Constants.tabButtonHeight
            text: qsTr("Analysis")
            enabled: true

            background: Rectangle {
                color: {
//                    console.log(this)
                    menuBar.currentIndex === 6 ? Constants.lightYellow : Constants.veryLightYellow
                }
            }
        }

        TabButton {
            id: buttonDataAccess
            anchors.top: buttonAnalysis.bottom
            font.family: "Segoe UI"
            anchors.left: parent.left
            width: Constants.tabButtonWidth
            height: Constants.tabButtonHeight
            text: qsTr("Data Access")
            enabled: true

            background: Rectangle {
                color: menuBar.currentIndex === 7 ? Constants.lightYellow : Constants.veryLightYellow
            }
        }

        TabButton {
            id: buttonCommandlineInterface
            anchors.top: buttonDataAccess.bottom
            anchors.left: parent.left
            width: Constants.tabButtonWidth
            height: Constants.tabButtonHeight
            text: qsTr("CLI")
            enabled: true

            background: Rectangle {
                color: menuBar.currentIndex === 8 ? Constants.lightYellow : Constants.veryLightYellow
            }
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
            color: Constants.veryLightBlue
            anchors.fill: parent
        }

        SystemStatusPage {
            id: systemStatusPage
        }

        FirmwarePage {
            id: firmwarePage
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

