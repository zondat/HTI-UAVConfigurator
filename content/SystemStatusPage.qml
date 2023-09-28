import QtQuick 2.15
import QtQuick.Controls 2.15
import UavConfigurator 1.0
import QtQuick.Layouts 2.15

Page {
    property int sensorNum: 6
    property int headerFontSize: 17
    property int contentFontSize: 15

    id: systemStatusPage
    background: Rectangle {
        anchors.fill: parent
        color: Constants.veryLightGray
    }
    Component.onCompleted: {
        addSensor("barometer", "GY191", Constants._SENSOR_WELL)
        addSensor("accelerometer", "GY191", Constants._SENSOR_ABS)
        addSensor("accelerometer", "GY191", Constants._SENSOR_BAD)
    }

    GridLayout {
        id: gridLayout
        anchors.rightMargin: 30
        anchors.leftMargin: 15
        anchors.topMargin: 15
        columns: 3
        rows: sensorNum + 1
        anchors {
//            fill: parent
            top: parent.top
            left: parent.left
            right: parent.right
        }

        Text {
            font {
                bold: true
                italic: true
                pixelSize: headerFontSize
            }
            text: "Sensor"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }


        Text {
            font {
                bold: true
                italic: true
                pixelSize: headerFontSize
            }
            text: "Name"
            Layout.columnSpan: 1
            Layout.rowSpan: 1
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }

        Text {
            font {
                bold: true
                italic: true
                pixelSize: headerFontSize
            }
            text: "Status"
            Layout.columnSpan: 1
            Layout.rowSpan: 1
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }

        Item {
            Layout.column: 0
            Layout.row: 1
            Layout.columnSpan: 3
            Layout.rowSpan: 1
            implicitHeight: 10
        }
    }

    function addSensor(sensorType, sensorName, status) {
        var importHeader = '  import QtQuick 2.15; import QtQuick.Layouts 2.15; '
        var fontSetting = '   font {
                                pixelSize: contentFontSize;
                                italic: true;
                            }'
        var alignment = 'Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter;'
        var sensorTypeElement = Qt.createQmlObject(importHeader +
                                                'Text { text: "' + sensorType + '";'
                                                + fontSetting + alignment + '}', gridLayout);
        var sensorNameElement = Qt.createQmlObject(importHeader +
                                                   'Text { text: "' + sensorName + '";'
                                                + fontSetting + alignment + '}', gridLayout);

        var statusIcon
        if (status === Constants._SENSOR_WELL) {
            statusIcon = Qt.createQmlObject(importHeader +
                                        'Image {
                                            source: "' + '../images/icons/pass.svg";' +
                                            'fillMode: Image.PreserveAspectFit; ' + alignment+
                                        '}', gridLayout);
        } else if (status === Constants._SENSOR_ABS) {
            statusIcon = Qt.createQmlObject(importHeader +
                                        'Image {
                                            source: "' + '../images/icons/cross2.svg";' +
                                            'fillMode: Image.PreserveAspectFit; ' + alignment+
                                        '}', gridLayout);
        } else {
            statusIcon = Qt.createQmlObject(importHeader +
                                        'Image {
                                            source: "' + '../images/icons/nopass.svg";' +
                                            'fillMode: Image.PreserveAspectFit;' + alignment+

                                        '}', gridLayout);
        }

        // Add the element to the grid
        gridLayout.children.push(sensorTypeElement);
        gridLayout.children.push(sensorNameElement);
        gridLayout.children.push(statusIcon);
    }
}
