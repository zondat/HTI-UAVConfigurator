import QtQuick 2.15
import QtQuick.Controls 2.15
import UavConfigurator 1.0
import QtQuick.Layouts 2.15

Page {
    id: flightModePage
    rightPadding: 20

    readonly property int _FAILSAFE_DO_NOTHING : 0
    readonly property int _FAILSAFE_DROP : 1
    readonly property int _FAILSAFE_HOVER : 2
    readonly property int _FAILSAFE_LAND : 3
    readonly property int _FAILSAFE_RTL : 4

    Column {
        id: column
        anchors.fill: parent

        ScrollView {
            id: scrvFlightModes
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
            }
            height: 550
            contentWidth: availableWidth

            Column {
                width: parent.width

                SectionHeader {
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
                SectionHeader {
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
                SectionHeader {
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

        SectionHeader {
            id: hdFailSafe
            headerName:"Failsafe"
            hotFont: false
            anchors {
                top: scrvFlightModes.bottom
                left: parent.left
                right:parent.right
//                topMargin: Constants.globalVerticalSpacing
            }
        }

        ScrollView {
            id: scrvFailsafe
            anchors {
                top: hdFailSafe.bottom
                left: parent.left
                right: parent.right
            }
            contentWidth: availableWidth
            height: 225

            Column {
                id: colFailsafe
                spacing: Constants.globalVerticalSpacing
                width: parent.width

                Rectangle {
                    id: rectBound1
                    width: parent.width
                    height: 100
                    anchors {
                        top: hdFailSafe.bottom
                        left: parent.left
                        right: parent.right
                    }

                    Rectangle {
                        id: rectOptionDrop
                        anchors.left: parent.left
                        width: parent.width / 2
                        height: rectBound1.width

                        Row {
                            RadioButton {
                                id: btnDrop
                                property bool currentState: false
                                text: "Drop"
                                onClicked: {
                                    btnLand.checked = false
                                    btnHover.checked = false
                                    btnRTH.checked = false
                                    btnLand.currentState = false
                                    btnHover.currentState = false
                                    btnRTH.currentState = false

                                    currentState = !currentState
                                    if (!currentState) {
                                        btnDrop.checked = false
                                    }
                                }
                            }

                            Image {
                                source: "../images/icons/cf_failsafe_procedure5.svg"
                                scale: 1
                                fillMode: Image.PreserveAspectFit;
                            }
                        }
                    }

                    Rectangle {
                        id: rectOptionHover
                        anchors {
                            left: rectOptionDrop.right
                            right: parent.right
                        }
                        height: rectBound1.width

                        Row {
                            RadioButton {
                                id: btnHover
                                property bool currentState: false
                                text: "Hover"
                                onClicked: {
                                    btnLand.checked = false
                                    btnDrop.checked = false
                                    btnRTH.checked = false
                                    btnDrop.currentState = false
                                    btnLand.currentState = false
                                    btnRTH.currentState = false

                                    currentState = !currentState
                                    if (!currentState) {
                                        btnHover.checked = false
                                    }
                                }
                            }

                            Image {
                                source: "../images/icons/cf_failsafe_procedure7.svg"
                                scale: 1
                                fillMode: Image.PreserveAspectFit;
                            }
                        }
                    }
                }


                Rectangle {
                    id: rectBound2
                    width: parent.width
                    height: 100
                    anchors {
                        top: rectBound2.top
                        left: parent.left
                        right: parent.right
                    }

                    Rectangle {
                        id: rectOptionLand
                        width: parent.width / 2
                        height: rectBound2.height
                        anchors {
                            left: rectBound2.left
                        }

                        Row {
                            RadioButton {
                                id: btnLand
                                property bool currentState: false
                                text: "Land"
                                onClicked: {
                                    btnHover.checked = false
                                    btnDrop.checked = false
                                    btnRTH.checked = false
                                    btnDrop.currentState = false
                                    btnHover.currentState = false
                                    btnRTH.currentState = false

                                    currentState = !currentState
                                    if (!currentState) {
                                        btnLand.checked = false
                                    }
                                }
                            }

                            Image {
                                source: "../images/icons/cf_failsafe_procedure6.svg"
                                scale: 1
                                fillMode: Image.PreserveAspectFit;
                            }
                        }
                    }

                    Rectangle {
                        id: rectOptionRTH
                        height: rectBound2.height
                        anchors {
                            left: rectOptionLand.right
                            right: rectBound2.right
                        }

                        Row {
                            RadioButton {
                                id: btnRTH
                                property bool currentState : false
                                text: "RTL"
                                onClicked: {
                                    btnHover.checked = false
                                    btnDrop.checked = false
                                    btnLand.checked = false
                                    btnDrop.currentState = false
                                    btnHover.currentState = false
                                    btnLand.currentState = false

                                    currentState = !currentState
                                    if (!currentState) {
                                        btnRTH.checked = false
                                    }
                                }
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

        SectionHeader {
            headerName:""
            hotFont: false
            anchors {
                top: scrvFailsafe.bottom
                left: parent.left
                right:parent.right
            }
            defaultHeight: 3
        }

        Row {
            layoutDirection: Qt.RightToLeft
            spacing: Constants.globalHorizontalSpacing
            anchors {
                top: scrvFailsafe.bottom
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }

            Button {
                text: "Write to FC"
            }

            Button {
                text: "Discard changes"
            }
        }
    }

    function getFailsafeOption() {
        if (btnDrop.checked) {
            return _FAILSAFE_DROP
        }
        else if (btnHover.checked) {
            return _FAILSAFE_HOVER
        }
        else if (btnLand.checked) {
            return _FAILSAFE_LAND
        }
        else if (btnRTH.checked) {
            return _FAILSAFE_RTL
        }
        else {
            return _FAILSAFE_DO_NOTHING
        }
    }
}
