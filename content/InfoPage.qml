import QtQuick 2.15
import QtQuick.Controls 2.15
import UavConfigurator 1.0
import QtQuick.Layouts 2.15

Page {
    id: systemStatusPage

    signal sigShowInfo(string sensor)

    property int sensorNum: 6
    property int headerFontSize: 17
    property int contentFontSize: 15

//    background: Rectangle {
//        anchors.fill: parent
//        color: Constants.veryLightGray
//    }


//    Component.onCompleted: {
//        addSensor("Gyro", "GY191", Constants._SENSOR_WELL)
//        addSensor("GPS", "M8N", Constants._SENSOR_ABS)
//        addSensor("Accel", "MPU 6050", Constants._SENSOR_BAD)
//        addSensor("Magneto", "GY191", Constants._SENSOR_WELL)
//        addSensor("Baro", "GY191", Constants._SENSOR_ABS)
//        addSensor("Speed", "ASPD 4525", Constants._SENSOR_BAD)
//    }

    SectionHeader {
        id: hdAccount
        headerName: "ACCOUNT"
        isItalic: false
        isBold: true
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
    }

    Rectangle {
        id: rectUserInfo
        anchors {
            top: hdAccount.bottom
            left: parent.left
            right: parent.right
        }
        height: 300
    }

    SectionHeader {
        id: hdSystemInfo
        headerName: "SYSTEM INFO"
        isItalic: false
        isBold: true
        anchors {
            top: rectUserInfo.bottom
            left: parent.left
            right: parent.right
        }
    }

    ListView {
        anchors {
            top: hdSystemInfo.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        model: 20 // Number of rows

        delegate: Item {
            width: parent.width
            height: 50

            Rectangle {
                width: parent.width
                height: 50
                color: index % 2 === 0 ? "lightgray" : "lightblue" // Alternate row colors

                Text {
                    anchors.centerIn: parent
                    text: "Row " + (index + 1) + ", Col 1"
                }

                Text {
                    anchors {
                        left: parent.left
                        verticalCenter: parent.verticalCenter
                        leftMargin: 10
                    }
                    text: "Row " + (index + 1) + ", Col 2"
                }

                Text {
                    anchors {
                        left: parent.left
                        verticalCenter: parent.verticalCenter
                        leftMargin: 150
                    }
                    text: "Row " + (index + 1) + ", Col 3"
                }
            }
        }
    }

//    Column {
//        id: column
//        anchors.fill: parent

//        ScrollView {
//            id: scrvSystemInfo
//            anchors {
//                top: parent.top
//                topMargin: 15
//                horizontalCenter: parent.horizontalCenter
//            }


//            Rectangle {
//                width: 450
//                height: 300

//                GridLayout {
//                    id: gridLayout
//                    columns: 3
//                    rows: sensorNum + 1
//                    anchors.fill: rectSystemInfo

//                    Text {
//                        font {
//                            bold: true
//                            italic: true
//                            pixelSize: headerFontSize
//                        }
//                        text: "Sensor"
//                        horizontalAlignment: Text.AlignHCenter
//                        verticalAlignment: Text.AlignVCenter
//                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
//                    }


//                    Text {
//                        font {
//                            bold: true
//                            italic: true
//                            pixelSize: headerFontSize
//                        }
//                        text: "Name"
//                        Layout.columnSpan: 1
//                        Layout.rowSpan: 1
//                        horizontalAlignment: Text.AlignHCenter
//                        verticalAlignment: Text.AlignVCenter
//                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
//                    }

//                    Text {
//                        font {
//                            bold: true
//                            italic: true
//                            pixelSize: headerFontSize
//                        }
//                        text: "Status"
//                        Layout.columnSpan: 1
//                        Layout.rowSpan: 1
//                        horizontalAlignment: Text.AlignHCenter
//                        verticalAlignment: Text.AlignVCenter
//                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
//                    }

//                    Item {
//                        Layout.column: 0
//                        Layout.row: 1
//                        Layout.columnSpan: 3
//                        Layout.rowSpan: 1
//                        implicitHeight: 10
//                    }
//                }
//            }
//        }
//    }



//    function onClickSensor(sensor) {
//        console.log("send signal emitted with notice: " + sensor)
//    }

//    function nameToId(str) {
//        return Constants.removeSpaces(Constants.lowerFirstCase(str))
//    }

//    function addSensor(sensorType, sensorName, status) {
//        var importHeader = '  import QtQuick 2.15; import QtQuick.Layouts 2.15; '
//        var fontSetting = '   font.pixelSize: contentFontSize;
//                              font.italic: true; '
//        var alignment = 'Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter;'
//        var sensorId = nameToId(sensorName)
//        var clickEvent = '  MouseArea {
//                                anchors.fill: parent;
//                                onClicked: sigShowInfo("' + sensorId +'");
//                            }'

//        var sensorTypeElement = Qt.createQmlObject(importHeader +
//                                                'Text { text: "' + sensorType + '";'
//                                                + fontSetting
//                                                + alignment
//                                                + '}', gridLayout);

//        var sensorNameElement = Qt.createQmlObject(importHeader +
//                                                'Text { '
//                                                + 'id: ' + sensorId +';'
//                                                + 'text: "' + sensorName + '";'
//                                                + 'font.underline: true;'
//                                                + fontSetting
//                                                + clickEvent
//                                                + alignment
//                                                + '}', gridLayout);

//        var statusIcon
//        if (status === Constants._SENSOR_WELL) {
//            statusIcon = Qt.createQmlObject(importHeader +
//                                        'Image {
//                                            source: "' + '../images/icons/pass.svg";' +
//                                            'scale: 0.85;' +
//                                            'fillMode: Image.PreserveAspectFit; ' + alignment +
//                                        '}', gridLayout);
//        } else if (status === Constants._SENSOR_ABS) {
//            statusIcon = Qt.createQmlObject(importHeader +
//                                        'Image {
//                                            source: "' + '../images/icons/cross2.svg";' +
//                                            'scale: 0.8;' +
//                                            'fillMode: Image.PreserveAspectFit; ' + alignment +
//                                        '}', gridLayout);
//        } else {
//            statusIcon = Qt.createQmlObject(importHeader +
//                                        'Image {
//                                            source: "' + '../images/icons/nopass.svg";' +
//                                            'scale: 0.85;' +
//                                            'fillMode: Image.PreserveAspectFit;' + alignment +
//                                        '}', gridLayout);
//        }

//        // Add the element to the grid
//        gridLayout.children.push(sensorTypeElement);
//        gridLayout.children.push(sensorNameElement);
//        gridLayout.children.push(statusIcon);
//    }
}
