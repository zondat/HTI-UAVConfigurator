import QtQuick 2.15
import QtQuick.Controls 2.15
import UavConfigurator 1.0

ScrollView {
//    anchors.fill: paren
    id: flightModeView
    anchors.fill: parent
    Column {
        width: flightModeView.width

        // Arming setting
        HeaderStrip {
            id: hdArm
            headerName:"ARMING"
            anchors {
                top: parent.top
            }
        }

        ChannelPanel {
            id: pnArm
            channelFunctionName: "ARM"
            anchors {
                top: hdArm.bottom
                topMargin: Constants.globalVerticalSpacing
                left: parent.left
                right: parent.right
            }
        }

        ChannelPanel {
            id: pnPrearm
            channelFunctionName: "PREARM"
            anchors {
                top: pnArm.bottom
                topMargin: Constants.globalVerticalSpacing
                left: parent.left
                right: parent.right
            }
        }

        // Flight modes setting
        HeaderStrip {
            id: hdFlightMode
            headerName:"Flight Modes"
            anchors {
                top: pnPrearm.bottom
                topMargin: Constants.globalVerticalSpacing * 2
            }
        }

        ChannelPanel {
            id: pnAngle
            channelFunctionName: "ANGLE"
            anchors {
                top: hdFlightMode.bottom
                topMargin: Constants.globalVerticalSpacing
                left: parent.left
                right: parent.right
            }
        }

        ChannelPanel {
            id: pnHorizontal
            channelFunctionName: "HORIZONTAL"
            anchors {
                top: pnAngle.bottom
                topMargin: Constants.globalVerticalSpacing
                left: parent.left
                right: parent.right
            }
        }

        ChannelPanel {
            id: pnManual
            channelFunctionName: "MANUAL"
            anchors {
                top: pnHorizontal.bottom
                topMargin: Constants.globalVerticalSpacing
                left: parent.left
                right: parent.right
            }
        }

        // Flight modes setting
        HeaderStrip {
            id: hdAssistanceMode
            headerName:"Assistance Modes"
            anchors {
                top: pnManual.bottom
                topMargin: Constants.globalVerticalSpacing * 2
            }
        }

        ChannelPanel {
            id: pnAltHold
            channelFunctionName: "ALTITUDE HOLD"
            anchors {
                top: hdAssistanceMode.bottom
                topMargin: Constants.globalVerticalSpacing
                left: parent.left
                right: parent.right
            }
        }

        ChannelPanel {
            id: pnHeadingHold
            channelFunctionName: "HEADING HOLD"
            anchors {
                top: pnAltHold.bottom
                topMargin: Constants.globalVerticalSpacing
                left: parent.left
                right: parent.right
            }
        }

        ChannelPanel {
            id: pnAssistTurn
            channelFunctionName: "TURN ASSIST"
            anchors {
                top: pnHeadingHold.bottom
                topMargin: Constants.globalVerticalSpacing
                left: parent.left
                right: parent.right
            }
        }

        ChannelPanel {
            id: pnAutoLevel
            channelFunctionName: "AUTO LEVEL"
            anchors {
                top: pnAssistTurn.bottom
                topMargin: Constants.globalVerticalSpacing
                left: parent.left
                right: parent.right
            }
        }
    }
}
