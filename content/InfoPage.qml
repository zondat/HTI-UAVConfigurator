import QtQuick 2.15
import QtQuick.Controls 2.15
import UavConfigurator 1.0
import QtQuick.Layouts 2.15

Page {
    id: systemStatusPage

    signal sigShowInfo(string sensor)

    readonly property int _SENSOR_TYPE_GPS: 0
    readonly property int _SENSOR_TYPE_GYRO: 1
    readonly property int _SENSOR_TYPE_ACCEL: 2
    readonly property int _SENSOR_TYPE_MAGN: 3
    readonly property int _SENSOR_TYPE_BARO: 4
    readonly property int _SENSOR_TYPE_SPD: 5

    property int headerFontSize: 15
    property int contentFontSize: 10
    property bool enableFlightConfig: false
    property bool enableMapSetting: false
    property bool enablePlanning: false
    property bool enableDataAccess: false
    property bool enableModeSetting: false
    property bool enableAnalyzing: false


    Component.onCompleted: {
        addSensor(_SENSOR_TYPE_GPS, "M8N", Constants._SENSOR_WELL)
        addSensor(_SENSOR_TYPE_GYRO, "M8N", Constants._SENSOR_ABS)
        addSensor(_SENSOR_TYPE_ACCEL, "MPU 6050", Constants._SENSOR_BAD)
        addSensor(_SENSOR_TYPE_MAGN, "GY191", Constants._SENSOR_WELL)
        addSensor(_SENSOR_TYPE_BARO, "BMP280", Constants._SENSOR_ABS)
        addSensor(_SENSOR_TYPE_SPD, "ASPD 4525", Constants._SENSOR_BAD)
        enableFlightConfig()
        enableModeSetting()
        enableDataAccess()
        setClientId("vtol_#01")
    }

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
            horizontalCenter: parent.horizontalCenter
        }
        width: parent.width - 100
        height: 450

        GridLayout {
            id: grdUserInfo
            columns: 5
            rows: 9
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
                rightMargin: 30
                leftMargin: 15
                topMargin: 15
            }

            Text {
                id: labUser
                font {
                    bold: true
                    italic: true
                    pixelSize: headerFontSize
                }
                text: qsTr("User")
                Layout.alignment: Qt.AlignLeft | Qt.AlignBaseline
                Layout.column: 0
                Layout.row: 0
                Layout.columnSpan: 1
                Layout.rowSpan: 1
            }

            TextField {
                id: txtUserName
                font.pointSize: contentFontSize
                text: "Admin"
                readOnly: btnEdit.enabled
                enabled: true
                Layout.column: 3
                Layout.row: 0
                Layout.columnSpan: 2
                Layout.rowSpan: 1
                Layout.preferredHeight: 35
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignRight | Qt.AlignBaseline
            }

            Text {
                id: labName
                font {
                    bold: true
                    italic: true
                    pixelSize: headerFontSize
                }
                text: qsTr("Name")
                Layout.alignment: Qt.AlignLeft | Qt.AlignBaseline
                Layout.column: 0
                Layout.row: 1
                Layout.columnSpan: 1
                Layout.rowSpan: 1
            }

            TextField {
                id: txtName
                font.pointSize: contentFontSize
                text: "Admin"
                enabled: true
                readOnly: btnEdit.enabled
                Layout.column: 3
                Layout.row: 1
                Layout.columnSpan: 2
                Layout.rowSpan: 1
                Layout.preferredHeight: 35
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignRight | Qt.AlignBaseline
            }

            Text {
                font {
                    bold: true
                    italic: true
                    pixelSize: headerFontSize
                }
                text: qsTr("Client Id")
                Layout.alignment: Qt.AlignLeft | Qt.AlignBaseline
                Layout.column: 0
                Layout.row: 2
                Layout.columnSpan: 1
                Layout.rowSpan: 1
            }

            TextField {
                id: txtClientId
                font.pointSize: contentFontSize
                text: "32"
                readOnly: true
                enabled: true
                Layout.column: 3
                Layout.row: 2
                Layout.columnSpan: 2
                Layout.rowSpan: 1
                Layout.preferredHeight: 35
                Layout.fillWidth: false
                Layout.alignment: Qt.AlignLeft | Qt.AlignBaseline
            }

            Text {
                font {
                    bold: true
                    italic: true
                    pixelSize: headerFontSize
                }
                text: qsTr("Permissions")
                Layout.alignment: Qt.AlignLeft | Qt.AlignBaseline
                Layout.column: 0
                Layout.row: 3
                Layout.columnSpan: 1
                Layout.rowSpan: 1
            }

            Button {
                checked: false
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.column: 3
                Layout.row: 3
                Layout.columnSpan: 1
                Layout.rowSpan: 1
                Layout.fillWidth: true
                Layout.fillHeight: true

                background: Rectangle {
                    id: rectFlightConfig
                    color: Constants.lightGray
                    radius: 7
                    anchors.fill: parent


                    Text {
                        id: txtFlightConfig
                        text: qsTr("Flight Config")
                        font.pixelSize: headerFontSize
                        color: Constants.gray
                        anchors.centerIn: parent
                    }
                }
                enabled: !btnEdit.enabled
                onClicked: {
                    enableFlightConfig = !enableFlightConfig
                    if (enableFlightConfig) {
                        txtFlightConfig.font.bold = true
                        rectFlightConfig.color = Constants.lightGreen
                    } else {
                        txtFlightConfig.font.bold = false
                        rectFlightConfig.color = Constants.lightGray
                    }
                }
            }

            Button {
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.column: 4
                Layout.row: 3
                Layout.columnSpan: 1
                Layout.rowSpan: 1
                Layout.fillWidth: true
                Layout.fillHeight: true

                background: Rectangle {
                    id: rectMapSetting
                    color: Constants.lightGray
                    anchors.fill: parent
                    radius: 7

                    Text {
                        id: txtMapSetting
                        text: qsTr("Map Setting")
                        font.pixelSize: headerFontSize
                        color: Constants.gray
                        anchors.centerIn: parent
                    }
                }

                enabled: !btnEdit.enabled
                onClicked: {
                    enableMapSetting = !enableMapSetting
                    if (enableMapSetting) {
                        txtMapSetting.font.bold = true
                        rectMapSetting.color = Constants.lightGreen
                    } else {
                        txtMapSetting.font.bold = false
                        rectMapSetting.color = Constants.lightGray
                    }
                }
            }

            Button {
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.column: 3
                Layout.row: 4
                Layout.columnSpan: 1
                Layout.rowSpan: 1
                Layout.fillWidth: true
                Layout.fillHeight: true

                background: Rectangle {
                    id: rectPlanning
                    anchors.fill: parent
                    color: Constants.lightGray
                    radius: 7

                    Text {
                        id: txtPlanning
                        text: qsTr("Planning")
                        font.pixelSize: headerFontSize
                        color: Constants.gray
                        anchors.centerIn: parent
                    }
                }

                enabled: !btnEdit.enabled
                onClicked: {
                    enablePlanning = !enablePlanning
                    if (enablePlanning) {
                        txtPlanning.font.bold = true
                        rectPlanning.color = Constants.lightGreen
                    } else {
                        txtPlanning.font.bold = false
                        rectPlanning.color = Constants.lightGray
                    }
                }
            }

            Button {
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.column: 4
                Layout.row: 4
                Layout.columnSpan: 1
                Layout.rowSpan: 1
                Layout.fillWidth: true
                Layout.fillHeight: true

                background: Rectangle {
                    id: rectDataAccess
                    color: Constants.lightGray
                    anchors.fill: parent
                    radius: 7

                    Text {
                        id: txtDataAccess
                        text: qsTr("Data Access")
                        font.pixelSize: headerFontSize
                        color: Constants.gray
                        anchors.centerIn: parent
                    }
                }

                enabled: !btnEdit.enabled
                onClicked: {
                    enableDataAccess = !enableDataAccess
                    if (enableDataAccess) {
                        txtDataAccess.font.bold = true
                        rectDataAccess.color = Constants.lightGreen
                    } else {
                        txtDataAccess.font.bold = false
                        rectDataAccess.color = Constants.lightGray
                    }
                }
            }


            Button {
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.column: 3
                Layout.row: 5
                Layout.columnSpan: 1
                Layout.rowSpan: 1
                Layout.fillWidth: true
                Layout.fillHeight: true

                background: Rectangle {
                    id: rectModeSetting
                    color: Constants.lightGray
                    anchors.fill: parent
                    radius: 7

                    Text {
                        id: txtModeSetting
                        text: qsTr("Mode Setting")
                        font.pixelSize: headerFontSize
                        color: Constants.gray
                        anchors.centerIn: parent
                    }
                }

                enabled: !btnEdit.enabled
                onClicked: {
                    enableModeSetting = !enableModeSetting
                    if (enableModeSetting) {
                        txtModeSetting.font.bold = true
                        rectModeSetting.color = Constants.lightGreen
                    } else {
                        txtModeSetting.font.bold = false
                        rectModeSetting.color = Constants.lightGray
                    }
                }
            }

            Button {
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.column: 4
                Layout.row: 5
                Layout.columnSpan: 1
                Layout.rowSpan: 1
                Layout.fillWidth: true

                background: Rectangle {
                    id: rectAnalyzing
                    color: Constants.lightGray
                    anchors.fill: parent
                    radius: 7

                    Text {
                        id: txtAnalyzing
                        text: qsTr("Analyzing")
                        font.pixelSize: headerFontSize
                        color: Constants.gray
                        anchors.centerIn: parent
                    }
                }

                enabled: !btnEdit.enabled
                onClicked: {
                    enableAnalyzing = !enableAnalyzing
                    if (enableAnalyzing) {
                        txtAnalyzing.font.bold = true
                        rectAnalyzing.color = Constants.lightGreen
                    } else {
                        txtAnalyzing.font.bold = false
                        rectAnalyzing.color = Constants.lightGray
                    }
                }
            }

            Text {
                id: labOtherInfo
                font {
                    bold: true
                    italic: true
                    pixelSize: headerFontSize
                }
                text: qsTr("Other Info")
                Layout.alignment: Qt.AlignLeft | Qt.AlignBaseline
                Layout.column: 0
                Layout.row: 6
                Layout.columnSpan: 1
                Layout.rowSpan: 1
            }


            ScrollView {
                Layout.column: 3
                Layout.row: 6
                Layout.columnSpan: 2
                Layout.rowSpan: 1
                Layout.preferredHeight: 70
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignRight | Qt.AlignBaseline

                TextArea {
                    id: txtOtherInfo
                    text: "VTOL Cessna 182 \nFlight Speed: 30 m/s \nEndurance: 2h"
                    wrapMode: Text.WrapAnywhere
                    readOnly: true
                    font.pointSize: contentFontSize
                    anchors {
                        top: parent.top
                        left: parent.left
                        topMargin: -10
                        leftMargin: -10
                    }
                    width: parent.width - 10
                    height: contentHeight // Make the height match the content
                }
            }

            Button {
                id: btnEdit
                text: qsTr("Edit")
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                Layout.column: 3
                Layout.row: 7
                Layout.columnSpan: 1
                Layout.rowSpan: 1
                onClicked:  {
                    btnEdit.enabled = false
                    btnSave.enabled = true

                }
            }

            Button {
                id: btnSave
                text: qsTr("Save")
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                Layout.column: 4
                Layout.row: 7
                Layout.columnSpan: 1
                Layout.rowSpan: 1
                enabled: false
                onClicked: {
                    btnEdit.enabled = true
                    btnSave.enabled = false
                }
            }
        }
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

    Rectangle {
        id: rectSystemInfo
        anchors {
            top: hdSystemInfo.bottom
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
        }
        width: parent.width - 100

        GridLayout {
            id: grdSystemInfo
            columns: 3
            rows: 7
            columnSpacing: 20
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
                rightMargin: 30
                leftMargin: 15
                topMargin: 15
            }

            Text {
                id: labModelId
                font {
                    bold: true
                    italic: true
                    pixelSize: headerFontSize
                }
                text: "Model Id"
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                Layout.column: 0
                Layout.row: 0
                Layout.columnSpan: 1
                Layout.rowSpan: 1
            }

            Text {
                id: txtModelId
                text: "#000001"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                enabled: true
                font {
                    bold: true
                    italic: true
                    underline: true
                    pointSize: contentFontSize
                }
                Layout.column: 1
                Layout.row: 0
                Layout.columnSpan: 2
                Layout.rowSpan: 1
                Layout.preferredHeight: 35
//                Layout.fillWidth: true
                Layout.alignment: Qt.AlignLeft | Qt.AlignBaseline
            }

            Text {
                id: labGPS
                text: qsTr("GPS")
                font {
                    bold: true
                    italic: true
                    pixelSize: headerFontSize
                }
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                Layout.column: 0
                Layout.row: 1
                Layout.columnSpan: 1
                Layout.rowSpan: 1
            }

            Text {
                id: labGyro
                text: qsTr("Gyro")
                font {
                    bold: true
                    italic: true
                    pixelSize: headerFontSize
                }
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                Layout.column: 0
                Layout.row: 2
                Layout.columnSpan: 1
                Layout.rowSpan: 1
            }

            Text {
                id: labAccel
                text: qsTr("Accelerometer")
                font {
                    bold: true
                    italic: true
                    pixelSize: headerFontSize
                }
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                Layout.column: 0
                Layout.row: 3
                Layout.columnSpan: 1
                Layout.rowSpan: 1
            }

            Text {
                id: labMagn
                text: qsTr("Magnetometer")
                font {
                    bold: true
                    italic: true
                    pixelSize: headerFontSize
                }
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                Layout.column: 0
                Layout.row: 4
                Layout.columnSpan: 1
                Layout.rowSpan: 1
            }

            Text {
                id: labBaro
                text: qsTr("Barometer")
                font {
                    bold: true
                    italic: true
                    pixelSize: headerFontSize
                }
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                Layout.column: 0
                Layout.row: 5
                Layout.columnSpan: 1
                Layout.rowSpan: 1
            }

            Text {
                id: labSpeed
                text: qsTr("Speed")
                font {
                    bold: true
                    italic: true
                    pixelSize: headerFontSize
                }
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                Layout.column: 0
                Layout.row: 6
                Layout.columnSpan: 1
                Layout.rowSpan: 1
            }
        }
    }

    function setModelId(id) {
        txtModelId = id
    }

//    function setGPS()

    function setUserName(userName) {
        txtUserName.text = userName
    }

    function setName(name) {
        txtName.text = name
    }

    function setClientId(clientId) {
        txtClientId.text = clientId
    }

    function setOtherInfo(info) {
        txtOtherInfo.text = info
    }

    function nameToId(str) {
        return Constants.removeSpaces(Constants.lowerFirstCase(str))
    }

    function addSensor(sensorType, sensorName, status) {

        var importHeader = '  import QtQuick 2.15; import QtQuick.Layouts 2.15; import QtQuick.Controls 2.15;'
        var fontSetting = '   font.pixelSize: 15;
                              font.italic: true;'
        var generalAlignment = ' Layout.alignment: Qt.AlignHCenter | Qt.AlignBaseline;'
        var sensorNameAlignment = generalAlignment + 'Layout.preferredHeight: 35;
                                                      Layout.column: 1; Layout.row: ' + (sensorType + 1).toString() +';'
        var statusIconAlignment = generalAlignment + 'Layout.fillWidth: true;
                                                      Layout.column: 2; Layout.row: ' + (sensorType + 1).toString() +';'

        var sensorId = nameToId(sensorName)
        var clickEvent = '  MouseArea {
                                anchors.fill: parent;
                                onClicked: sigShowInfo("' + sensorId +'");
                            }'

        var sensorNameElement = Qt.createQmlObject(importHeader +
                                                'Text { '
                                                + 'id: ' + sensorId +';'
                                                + 'text: "' + sensorName + '";'
//                                                + 'font {
//                                                    underline: true;
//                                                   }'
                                                + fontSetting
                                                + clickEvent
                                                + sensorNameAlignment
                                                + '}', grdSystemInfo);

        var statusIcon
        if (status === Constants._SENSOR_WELL) {
            statusIcon = Qt.createQmlObject(importHeader +
                                        'Image {
                                            source: "' + '../images/icons/pass.svg";' +
                                            'scale: 0.85;' +
                                            'fillMode: Image.PreserveAspectFit; ' + statusIconAlignment +
                                        '}', grdSystemInfo);
        } else if (status === Constants._SENSOR_ABS) {
            statusIcon = Qt.createQmlObject(importHeader +
                                        'Image {
                                            source: "' + '../images/icons/cross2.svg";' +
                                            'scale: 0.8;' +
                                            'fillMode: Image.PreserveAspectFit; ' + statusIconAlignment +
                                        '}', grdSystemInfo);
        } else {
            statusIcon = Qt.createQmlObject(importHeader +
                                        'Image {
                                            source: "' + '../images/icons/nopass.svg";' +
                                            'scale: 0.85;' +
                                            'fillMode: Image.PreserveAspectFit;' + statusIconAlignment +
                                        '}', grdSystemInfo);
        }

        // Add the element to the grid
        grdSystemInfo.children.push(sensorNameElement);
        grdSystemInfo.children.push(statusIcon);
    }
}
