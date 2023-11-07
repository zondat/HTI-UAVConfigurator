

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

    readonly property int _DEVICE_TYPE_BAT: 0
    readonly property int _DEVICE_TYPE_GYRO: 1
    readonly property int _DEVICE_TYPE_GPS: 2
    readonly property int _DEVICE_TYPE_ACCEL: 3
    readonly property int _DEVICE_TYPE_MAGN: 4
    readonly property int _DEVICE_TYPE_BARO: 5
    readonly property int _DEVICE_TYPE_SPD: 6

    layoutDirection: Qt.LeftToRight

    Component.onCompleted: {
        setDeviceState(_DEVICE_TYPE_BAT, Constants._BAT_NORM)
    }

    Row {
        id: mainToolbar
        anchors.left: parent.left
        //        anchors.top: parent.top
        //        anchors.bottom: parent.bottom
        width: Constants.mainToolbarWidth
        height: barHeight

        ToolButton {
            id: buttonDisconnect
            text: qsTr("Disconnect")
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
            checkable: false
            highlighted: false
            display: AbstractButton.TextUnderIcon
            icon.source: "../images/icons/cf_icon_bat_full.svg"
            width: iconWidth
            height: iconHeight
        }

        ToolButton {
            id: buttonGyro
            text: qsTr("Gyro")
            icon.source: "../images/icons/sensor_gyro_on.png"
            display: AbstractButton.TextUnderIcon
            width: iconWidth
            height: iconHeight
        }

        ToolButton {
            id: buttonGPS
            text: qsTr("GPS")
            icon.source: "../images/icons/sensor_sat_on.png"
            display: AbstractButton.TextUnderIcon
            width: iconWidth
            height: iconHeight
        }

        ToolButton {
            id: buttonAccelerator
            text: qsTr("Accelerator")
            icon.source: "../images/icons/sensor_acc_on.png"
            display: AbstractButton.TextUnderIcon
            width: iconWidth
            height: iconHeight
        }

        ToolButton {
            id: buttonMagnetometer
            text: qsTr("Magneto")
            icon.source: "../images/icons/sensor_mag_on.png"
            display: AbstractButton.TextUnderIcon
            width: iconWidth
            height: iconHeight

            onClicked: setMagnetoState(1)

            function setMagnetoState(state) {
                if (state === Constants._SENSOR_WELL) {
                    icon.color = Constants.blue
                } else if (state === Constants._SENSOR_ABS) {
                    icon.color = Constants.gray
                } else {
                    icon.color = Constants.lightRed
                }
            }
        }

        ToolButton {
            id: buttonBarometer
            text: qsTr("Barometer")
            icon.source: "../images/icons/sensor_baro_on.png"
            display: AbstractButton.TextUnderIcon
            width: iconWidth
            height: iconHeight

            onClicked: setBaroState(-1)

            function setBaroState(state) {
                if (state === Constants._SENSOR_WELL) {
                    icon.color = Constants.blue
                } else if (state === Constants._SENSOR_ABS) {
                    icon.color = Constants.gray
                } else {
                    icon.color = Constants.lightRed
                }
            }
        }

        ToolButton {
            id: buttonSpeed
            text: qsTr("Speed")
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

        Rectangle {
            id: ardupilot
            color: Constants.darkGray
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

        Image {
            id: inavLogo
            x: 570
            y: 0
            width: 100
            height: 100
            source: "../images/inav_icon_128.png"
            fillMode: Image.PreserveAspectFit
        }

    }

    function setDeviceState(deviceType, deviceHealth) {
        if (deviceType === _DEVICE_TYPE_BAT) {
            if (deviceHealth === Constants._BAT_WELL) {
                buttonBattery.icon.source= "../images/icons/cf_icon_bat_full.svg"
                buttonBattery.icon.color = Constants.green
            } else if (deviceHealth === Constants._BAT_NORM) {
                buttonBattery.icon.source= "../images/icons/cf_icon_bat_half.svg"
                buttonBattery.icon.color = Constants.orange
            } else {
                buttonBattery.icon.source= "../images/icons/cf_icon_bat_low.svg"
                buttonBattery.icon.color = Constants.lightRed
            }
        }
//        else if (deviceType === _DEVICE_TYPE_ACCEL) {
//            if (deviceHealth === Constants._SENSOR_WELL) {
//                icon.color = Constants.blue
//            } else if (deviceHealth === Constants._SENSOR_ABS) {
//                icon.color = Constants.gray
//            } else {
//                icon.color = Constants.lightRed
//            }
//        }
//        else if (deviceType === _DEVICE_TYPE_BARO) {
//            if (deviceHealth === Constants._SENSOR_WELL) {
//                icon.color = Constants.blue
//            } else if (deviceHealth === Constants._SENSOR_ABS) {
//                icon.color = Constants.gray
//            } else {
//                icon.color = Constants.lightRed
//            }
//        }
//        else if (deviceType === _DEVICE_TYPE_GPS) {
//            if (deviceHealth === Constants._SENSOR_WELL) {
//                icon.color = Constants.blue
//            } else if (deviceHealth === Constants._SENSOR_ABS) {
//                icon.color = Constants.gray
//            } else {
//                icon.color = Constants.lightRed
//            }
//        }
//        else if (deviceType === _DEVICE_TYPE_GYRO) {
//            if (deviceHealth === Constants._SENSOR_WELL) {
//                icon.color = Constants.blue
//            } else if (deviceHealth === Constants._SENSOR_ABS) {
//                icon.color = Constants.gray
//            } else {
//                icon.color = Constants.lightRed
//            }
//        }
//        else if (deviceType === _DEVICE_TYPE_MAGN) {
//            if (deviceHealth === Constants._SENSOR_WELL) {
//                icon.color = Constants.blue
//            } else if (deviceHealth === Constants._SENSOR_ABS) {
//                icon.color = Constants.gray
//            } else {
//                icon.color = Constants.lightRed
//            }
//        }
//        else if (deviceType === _DEVICE_TYPE_SPD) {
//            if (deviceHealth === Constants._SENSOR_WELL) {
//                icon.color = Constants.blue
//            } else if (deviceHealth === Constants._SENSOR_ABS) {
//                icon.color = Constants.gray
//            } else {
//                icon.color = Constants.lightRed
//            }
//        }
        else {
            if (deviceHealth === Constants._SENSOR_WELL) {
                icon.color = Constants.blue
            } else if (deviceHealth === Constants._SENSOR_ABS) {
                icon.color = Constants.gray
            } else {
                icon.color = Constants.lightRed
            }
        }
    }
}
