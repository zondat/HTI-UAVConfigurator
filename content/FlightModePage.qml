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

        HeaderStrip {
            id: hdFailSafe
            headerName:"Failsafe"
            hotFont: true
            anchors {
                top: scrvFlightModes.bottom
                left: parent.left
                right:parent.right
                topMargin: Constants.globalVerticalSpacing
            }
        }

        Rectangle {
            id: rectFailsafe
            border.color: gray
            width: parent.width
            height: 175

            anchors {
                top: hdFailSafe.bottom
            }

            GridLayout {
                anchors.fill: rectFailsafe
                columns: 2
                rows: 2

                Rectangle {
                    id: rectOptionDrop
                    Layout.column: 0
                    Layout.row: 0

                    Row {
                        RadioButton {
                            id: btnDrop
                            text: "Drop"
                        }

                        Image {
                            source: "../images/icons/cf_failsafe_procedure5.svg"
                            scale: 1
                            fillMode: Image.PreserveAspectFit;
                        }
                    }
                }

                Rectangle {
                    id: rectOptionLand
                    Layout.column: 0
                    Layout.row: 1

                    Row {

                        RadioButton {
                            id: btnLand
                            text: "Land"
                        }

                        Image {
                            source: "../images/icons/cf_failsafe_procedure6.svg"
                            scale: 1
                            fillMode: Image.PreserveAspectFit;
                        }
                    }
                }

                Rectangle {
                    id: rectOptionHover
                    Layout.column: 1
                    Layout.row: 0

                    Row {

                        RadioButton {
                            id: btnHover
                            text: "Hover"
                        }

                        Image {
                            source: "../images/icons/cf_failsafe_procedure7.svg"
                            scale: 1
                            fillMode: Image.PreserveAspectFit;
                        }
                    }
                }

                Rectangle {
                    id: rectOptionRTH
                    Layout.column: 1
                    Layout.row: 1

                    Row {

                        RadioButton {
                            id: btnRTH
                            text: "Return to Home"
                        }

                        Image {
                            source: "../images/icons/cf_failsafe_procedure8.svg"
                            scale: 1
                            fillMode: Image.PreserveAspectFit;
                        }
                    }
                }
            }
        }
    }
}
