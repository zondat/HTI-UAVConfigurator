

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

Row {
    id: globalToolbar
    height: Constants.globalToolBarHeight
    width: Constants.width
    property int iconHeight: 100
    property int iconWidth: 100
    property int barHeight: 100
    layoutDirection: Qt.LeftToRight

    Row {
        id: mainToolbar
        //        anchors.top: parent.top
        anchors.left: parent.left
        //        anchors.bottom: parent.bottom
        width: Constants.mainToolbarWidth
        height: barHeight

        ToolButton {
            id: buttonDisconnect
            text: qsTr("Disconnect")
            //            anchors.top: parent.top
            //            anchors.bottom: parent.bottom
            //            anchors.left: parent.left
            autoExclusive: true
            checked: true
            checkable: true
            display: AbstractButton.TextUnderIcon
            icon.source: "../images/icons/cf_icon_usb1_white.svg"
            width: iconWidth
            height: iconHeight
        }

        ToolButton {
            id: buttonConnect
            text: qsTr("Connect")
            //            anchors.top: parent.top
            //            anchors.bottom: parent.bottom
            //            anchors.left: buttonDisconnect.right
            autoExclusive: true
            checkable: true
            display: AbstractButton.TextUnderIcon
            icon.source: "../images/icons/cf_icon_setup_white.svg"
            width: iconWidth
            height: iconHeight
        }

        ToolButton {
            id: buttonAppSetting
            text: qsTr("App Setting")
            //            anchors.top: parent.top
            //            anchors.bottom: parent.bottom
            //            anchors.left: buttonConnect.right
            autoExclusive: false
            checkable: true
            display: AbstractButton.TextUnderIcon
            icon.source: "../images/icons/cf_icon_settings_white.svg"
            width: iconWidth
            height: iconHeight
        }
    }

    Row {
        id: statusBar
        anchors.left: mainToolbar.right
        width: Constants.statusbarWidth
        anchors.top: globalToolbar.top
        anchors.bottom: globalToolbar.bottom

        ToolButton {
            id: buttonBattery
            text: qsTr("Battery")
            //            icon.color: "#dde21111"
            //            anchors.top: parent.top
            //            anchors.left: parent.left
            //            anchors.bottom: parent.bottom
            checkable: false
            highlighted: false
            display: AbstractButton.TextUnderIcon
            icon.source: "../images/icons/cf_icon_bat_grey.svg"
            //            flat: true
            width: iconWidth
            height: iconHeight

//            onClicked: setBatteryState(1)

            function setBatteryState(batteryHealth) {
                if (batteryHealth === Constants._BAT_WELL) {
                    icon.color = Constants.green
                } else if (batteryHealth === Constants._BAT_NORM) {
                    icon.color = Constants.lightYellow
                } else {
                    icon.color = Constants.lightRed
                }
            }
        }

        ToolButton {
            id: buttonGyro
            text: qsTr("Gyro")
            //            anchors.top: parent.top
            //            anchors.left: buttonBatteryStatus.right
            //            anchors.bottom: parent.bottom
            icon.source: "../images/icons/sensor_gyro_on.png"
            display: AbstractButton.TextUnderIcon
            width: iconWidth
            height: iconHeight
        }

        ToolButton {
            id: buttonGPS
            text: qsTr("GPS")
            //            anchors.top: parent.top
            //            anchors.left: buttonGyro.right
            //            anchors.bottom: parent.bottom
            icon.source: "../images/icons/sensor_sat_on.png"
            display: AbstractButton.TextUnderIcon
            width: iconWidth
            height: iconHeight
        }

        ToolButton {
            id: buttonAccelerator
            text: qsTr("Accelerator")
            //            anchors.top: parent.top
            //            anchors.left: buttonGPS.right
            //            anchors.bottom: parent.bottom
            icon.source: "../images/icons/sensor_acc_on.png"
            display: AbstractButton.TextUnderIcon
            width: iconWidth
            height: iconHeight
        }

        ToolButton {
            id: buttonMagnetometer
            text: qsTr("Magneto")
            //            anchors.top: parent.top
            //            anchors.left: buttonAccelerator.right
            //            anchors.bottom: parent.bottom
            icon.source: "../images/icons/sensor_mag_on.png"
            display: AbstractButton.TextUnderIcon
            width: iconWidth
            height: iconHeight
        }

        ToolButton {
            id: buttonBarometer
            text: qsTr("Barometer")
            //            anchors.top: parent.top
            //            anchors.left: buttonMagnetometer.right
            //            anchors.bottom: parent.bottom
            icon.source: "../images/icons/sensor_baro_on.png"
            display: AbstractButton.TextUnderIcon
            width: iconWidth
            height: iconHeight
        }

        ToolButton {
            id: buttonSpeed
            text: qsTr("Speed")
            //            anchors.top: parent.top
            //            anchors.left: buttonBarometer.right
            //            anchors.bottom: parent.bottom
            icon.source: "../images/icons/sensor_airspeed_on.png"
            display: AbstractButton.TextUnderIcon
            width: iconWidth
            height: iconHeight
        }
    }

    Row {
        id: logoBar
        anchors.top: globalToolbar.top
        anchors.left: statusBar.right
        anchors.right: globalToolbar.right
        anchors.bottom: globalToolbar.bottom
        layoutDirection: Qt.RightToLeft

        Image {
            id: inavLogo
            x: 570
            y: 0
            width: 100
            height: 100
            source: "../images/inav_icon_128.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: ardupilot
            color: Constants.blue
            width: 100
            height: 100
            radius: 10

            Image {
                id: ardupilotLogo
                width: 100
                height: 100
                source: "../images/ardupilot_logo.svg"
                fillMode: Image.PreserveAspectFit
            }
        }

        Rectangle {
            id: hti
            color: Constants.lightGray
            width: 175
            height: 100
            radius: 10

            Image {
                id: sciskyLogo
                height: 100
                source: "../images/scisky-logo.svg"
                fillMode: Image.PreserveAspectFit
            }
        }
    }
}
