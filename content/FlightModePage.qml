import QtQuick 2.15
import QtQuick.Controls 2.15
import UavConfigurator 1.0
import QtQuick.Layouts 2.15

Page {
    id: flightModePage

    Column {
        anchors.fill: parent

        ScrollView {
            id: scrvFlightModes
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
            }
            height: 650

            contentWidth: availableWidth

            Column {
                width: parent.width

                HeaderStrip {
                    id: hdArm
                    headerName:"ARMING"
                    width: parent.width
                    anchors {
                        topMargin: Constants.globalVerticalSpacing * 2
                        left: parent.left
                        right: parent.right
                    }
                }

                ChannelPanel {
                    id: pnArm
                    channelFunctionName: "ARM"
                    anchors {
                        topMargin: Constants.globalVerticalSpacing
                        left: parent.left
                        right: parent.right
                        leftMargin: Constants.globalHorizontalSpacing
                        rightMargin: Constants.globalHorizontalSpacing
                    }
                }

                ChannelPanel {
                    id: pnPrearm
                    channelFunctionName: "PREARM"
                    anchors {
                        topMargin: Constants.globalVerticalSpacing
                        left: parent.left
                        right: parent.right
                        leftMargin: Constants.globalHorizontalSpacing
                        rightMargin: Constants.globalHorizontalSpacing
                    }
                }

                // Flight modes setting
                HeaderStrip {
                    id: hdFlightMode
                    headerName:"Flight Modes"
                    anchors {
                        topMargin: Constants.globalVerticalSpacing * 2
                    }
                }

                ChannelPanel {
                    id: pnAngle
                    channelFunctionName: "ANGLE"
                    anchors {
                        topMargin: Constants.globalVerticalSpacing
                        left: parent.left
                        right: parent.right
                        leftMargin: Constants.globalHorizontalSpacing
                        rightMargin: Constants.globalHorizontalSpacing
                    }
                }

                ChannelPanel {
                    id: pnHorizontal
                    channelFunctionName: "HORIZONTAL"
                    anchors {
                        topMargin: Constants.globalVerticalSpacing
                        left: parent.left
                        right: parent.right
                        leftMargin: Constants.globalHorizontalSpacing
                        rightMargin: Constants.globalHorizontalSpacing
                    }
                }

                ChannelPanel {
                    id: pnManual
                    channelFunctionName: "MANUAL"
                    anchors {
                        topMargin: Constants.globalVerticalSpacing
                        left: parent.left
                        right: parent.right
                        leftMargin: Constants.globalHorizontalSpacing
                        rightMargin: Constants.globalHorizontalSpacing
                    }
                }

                // Assistance modes setting
                HeaderStrip {
                    id: hdAssistanceMode
                    headerName:"Assistance Modes"
                    anchors {
                        topMargin: Constants.globalVerticalSpacing * 2
                    }
                }

                ChannelPanel {
                    id: pnAltHold
                    channelFunctionName: "ALTITUDE HOLD"
                    anchors {
                        topMargin: Constants.globalVerticalSpacing
                        left: parent.left
                        right: parent.right
                        leftMargin: Constants.globalHorizontalSpacing
                        rightMargin: Constants.globalHorizontalSpacing
                    }
                }

                ChannelPanel {
                    id: pnHeadingHold
                    channelFunctionName: "HEADING HOLD"
                    anchors {
                        topMargin: Constants.globalVerticalSpacing
                        left: parent.left
                        right: parent.right
                        leftMargin: Constants.globalHorizontalSpacing
                        rightMargin: Constants.globalHorizontalSpacing
                    }
                }

                ChannelPanel {
                    id: pnAssistTurn
                    channelFunctionName: "TURN ASSIST"
                    anchors {
                        topMargin: Constants.globalVerticalSpacing
                        left: parent.left
                        right: parent.right
                        leftMargin: Constants.globalHorizontalSpacing
                        rightMargin: Constants.globalHorizontalSpacing
                    }
                }

                ChannelPanel {
                    id: pnAutoLevel
                    channelFunctionName: "AUTO LEVEL"
                    anchors {
                        topMargin: Constants.globalVerticalSpacing
                        left: parent.left
                        right: parent.right
                        leftMargin: Constants.globalHorizontalSpacing
                        rightMargin: Constants.globalHorizontalSpacing
                    }
                }

                ChannelPanel {
                    id: pnAutoLaunch
                    channelFunctionName: "AUTO LAUNCH"
                    anchors {
                        topMargin: Constants.globalVerticalSpacing
                        left: parent.left
                        right: parent.right
                        leftMargin: Constants.globalHorizontalSpacing
                        rightMargin: Constants.globalHorizontalSpacing
                    }
                }
            }
        }

        Rectangle {
            id: rectFailsafe
            border.color: gray
            color: Constants.lightGray
            radius: 10
            width: parent.width
            height: 500

            anchors {
                top: scrvFlightModes.bottom
                topMargin: Constants.globalVerticalSpacing * 3
                left: parent.left
                right:parent.right
            }

            GridLayout {
                anchors.fill: rectFailsafe
                columns: 3
                rows: 4
                rowSpacing: Constants.globalHorizontalSpacing
                columnSpacing: Constants.globalVerticalSpacing

                // Row 1: Field name
                Text {
                    id: txtFailsafe
                    text: qsTr("Failsafe")
                    Layout.leftMargin: Constants.globalVerticalSpacing
                    Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                    Layout.columnSpan: 3

                    font {
                        pixelSize: 15
                        bold: true
                        italic: true
                    }
                }

                // Row 2: Field name
                RadioButton {
                    text: "Drop"
                    Layout.column: 2
                    Layout.row: 2
                }
                Image {
                    width: 30
                    height: 30
                    source: "../images/icons/cf_icon_failsafe_grey.svg"
                    Layout.column: 3
                    Layout.row: 2
                }
            }
        }
    }


}
