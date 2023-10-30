import QtQuick 2.15
import QtQuick.Controls 2.15
import UavConfigurator 1.0
import QtQuick.Layouts 2.15

Page {
    id: hardwarePage
    property int sensorNum: 7
    property int rowHeight: 45
    property real scaleFactor: 0.4

    signal sigShowInfo(string sensor)

    Component.onCompleted: {
        addAccelerometer("No Selection");
        addAccelerometer("MPU6000");
        addAccelerometer("MPU6500");
        addAccelerometer("MPU9250");
        addAccelerometer("BMI270");
        addAccelerometer("BMI160");
        cbbAccel.currentIndex = 0;

        addMagneto("No Selection");
        addMagneto("HMC5883");
        addMagneto("AK8975");
        addMagneto("MAG3110");
        addMagneto("MPU9250");
        addMagneto("DPS310");
        cbbMagneto.currentIndex = 0;

        addBarometer("No Selection");
        addBarometer("SPL06");
        addBarometer("BMP280");
        addBarometer("BMP388");
        addBarometer("MS5611");
        cbbBaro.currentIndex = 0;

        addAirspeed("No Selection");
        addAirspeed("MS4525");
        cbbAirspeed.currentIndex = 0;

        addGPS("No Selection");
        addGPS("UBLOX");
        addGPS("UBLOX7");
        addGPS("MSP");
        cbbGPS.currentIndex = 0;
    }

    background: Rectangle {
        id: rectangle
        anchors.fill : parent
        color: Constants.veryLightGray
    }

    GridLayout {
        id: gridLayout
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            topMargin: 10
        }
        flow: GridLayout.LeftToRight
        layoutDirection: Qt.LeftToRight
        columns: 3
        rows: 8

        Text {
            font {
                bold: true
                italic: true
                pixelSize: Constants.headerFontSize
            }
            Layout.column: 0
            Layout.row: 0
            Layout.columnSpan: 1
            Layout.rowSpan: 1
            text: "Sensor"
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
            Layout.preferredWidth: parent.width / 3
        }

        Text {
            font {
                bold: true
                italic: true
                pixelSize: Constants.headerFontSize
            }
            Layout.column: 1
            Layout.row: 0
            text: "Name"
            horizontalAlignment: Text.AlignHCenter
            Layout.preferredWidth: parent.width / 3
        }


        Text {
            font {
                bold: true
                italic: true
                pixelSize: Constants.headerFontSize
            }
            Layout.column: 2
            Layout.row: 0
            Layout.columnSpan: 1
            Layout.rowSpan: 1
            text: "Icon"
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
            Layout.preferredWidth: parent.width / 3
        }

        Item {
            Layout.column: 0
            Layout.row: 1
            Layout.columnSpan: 3
            Layout.rowSpan: 1
            implicitHeight: 5
        }

        // Accelerometer
        Text {
            font {
                bold: false
                italic: true
                pixelSize: Constants.contentFontSize
            }
            Layout.column: 0
            Layout.row: 2
            Layout.columnSpan: 1
            Layout.rowSpan: 1
            text: "Accelerometer"
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
            Layout.preferredWidth: parent.width / 3
        }

        ComboBox {
            id: cbbAccel
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            font.pointSize: 10
            model: ListModel {}
            Layout.preferredHeight: Constants.comboboxHeight
            Layout.preferredWidth: Constants.comboboxWidth
        }

        Image {
            source: "../images/icons/sensor_acc_on.png"
            scale: scaleFactor
            fillMode: Image.PreserveAspectFit;
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter;
        }

        // Gyroscope
//        Text {
//            font {
//                bold: false
//                italic: true
//                pixelSize: Constants.contentFontSize
//            }
//            Layout.column: 0
//            Layout.row: 3
//            text: "Gyroscope"
//            horizontalAlignment: Text.AlignHCenter
//            Layout.fillWidth: true
//            Layout.preferredWidth: parent.width / 3
//        }

//        ComboBox {
//            id: cbbGyro
//            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
//            font.pointSize: 10
//            model: ListModel {}
//            Layout.preferredHeight: comboboxHeight
//            Layout.preferredWidth: comboboxWidth

//        }

//        Image {
//            source: "../images/icons/sensor_gyro_on.png"
//            scale: scaleFactor
//            fillMode: Image.PreserveAspectFit;
//            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter;
//        }

        // Magnetometer
        Text {
            font {
                bold: false
                italic: true
                pixelSize: Constants.contentFontSize
            }
            Layout.column: 0
            Layout.row: 3
            text: "Magnetometer"
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
            Layout.preferredWidth: parent.width / 3
        }

        ComboBox {
            id: cbbMagneto
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            font.pointSize: 10
            model: ListModel {}
            Layout.preferredHeight: Constants.comboboxHeight
            Layout.preferredWidth: Constants.comboboxWidth
        }

        Image {
            source: "../images/icons/sensor_mag_on.png"
            scale: scaleFactor
            fillMode: Image.PreserveAspectFit;
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter;
        }

        // Barometer
        Text {
            font {
                bold: false
                italic: true
                pixelSize: Constants.contentFontSize
            }
            Layout.column: 0
            Layout.row: 4
            text: "Barometer"
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
            Layout.preferredWidth: parent.width / 3
        }

        ComboBox {
            id: cbbBaro
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            font.pointSize: 10
            model: ListModel {}
            Layout.preferredHeight: Constants.comboboxHeight
            Layout.preferredWidth: Constants.comboboxWidth
        }

        Image {
            source: "../images/icons/sensor_baro_on.png"
            scale: scaleFactor
            fillMode: Image.PreserveAspectFit;
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter;
        }

        // Airspeed
        Text {
            font {
                bold: false
                italic: true
                pixelSize: Constants.contentFontSize
            }
            Layout.column: 0
            Layout.row: 5
            text: "Airspeed"
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
            Layout.preferredWidth: parent.width / 3
        }

        ComboBox {
            id: cbbAirspeed
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            font.pointSize: 10
            model: ListModel {}
            Layout.preferredHeight: Constants.comboboxHeight
            Layout.preferredWidth: Constants.comboboxWidth
        }

        Image {
            source: "../images/icons/sensor_airspeed_on.png"
            scale: scaleFactor
            fillMode: Image.PreserveAspectFit;
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter;
        }

        // GPS
        Text {
            font {
                bold: false
                italic: true
                pixelSize: Constants.contentFontSize
            }
            Layout.column: 0
            Layout.row: 6
            text: "GPS"
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
            Layout.preferredWidth: parent.width / 3
        }

        ComboBox {
            id: cbbGPS
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            font.pointSize: 10
            model: ListModel {}
            Layout.preferredHeight: Constants.comboboxHeight
            Layout.preferredWidth: Constants.comboboxWidth
        }

        Image {
            source: "../images/icons/sensor_sat_on.png"
            scale: scaleFactor
            fillMode: Image.PreserveAspectFit;
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter;
        }

        Row {
            Layout.column: 2
            Layout.row: 8
            layoutDirection: Qt.RightToLeft
            spacing: 10

            Button {
                id: btnSave;
                text: "Save";
            }

            Button {
                id: btnDiscard;
                text: "Discard";
            }
        }
    }


    function addAccelerometer(sensor) {
        cbbAccel.model.append({ "text": sensor })
    }

    function addGyroscope(sensor) {
        cbbGyro.model.append({ "text": sensor })
    }

    function addMagneto(sensor) {
        cbbMagneto.model.append({ "text": sensor })
    }

    function addBarometer(sensor) {
        cbbBaro.model.append({ "text": sensor })
    }

    function addAirspeed(sensor) {
        cbbAirspeed.model.append({ "text": sensor })
    }

    function addGPS(sensor) {
        cbbGPS.model.append({ "text": sensor })
    }


}
