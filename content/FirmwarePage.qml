import UavConfigurator 1.0
import QtQuick.Layouts
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import QtQuick.Dialogs

Page {
    id: firmwarePage
    background: Rectangle {
        anchors.fill: parent
        color: Constants.veryLightGray
    }

    property var versionMap: {
        "Ardupilot" : ["1.0.0", "1.0.1", "1.0.2"],
        "Inav": ["1.0.0", "1.0.1", "1.0.2"],
        "Px4": ["1.0.0", "1.0.1", "1.0.2"]
    }

    property var firmwares : Object.keys(versionMap);
    property int comboboxHeight: 42;

    Component.onCompleted:  {
        // Firmware combobox
        for (var i = 0; i < firmwares.length; i++) {
            addFirmwareOption(firmwares[i]);
        }
        cbbFirmware.currentIndex = 0
    }

    Rectangle {
        y: 24
        color: Constants.veryLightYellow
        radius: 15
        border.color: Constants.orange
        border.width: 1
        anchors.horizontalCenterOffset: 5
        width: 525
        height: 225
        anchors.horizontalCenter: parent.horizontalCenter

        GridLayout {
            id: gridLayout
            columns: 5
            rows: 4
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
                rightMargin: 30
                leftMargin: 15
                topMargin: 15
            }

            Text {
                font {
                    bold: true
                    italic: true
                    pixelSize: 15
                }
                text: "Select firmware"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                Layout.alignment: Qt.AlignLeft | Qt.AlignBaseline
                Layout.column: 1
                Layout.row: 1
                Layout.columnSpan: 2
                Layout.rowSpan: 1
            }

            Text {     
                font {
                    bold: true
                    italic: true
                    pixelSize: 15
                }
                text: "Select version"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                Layout.alignment: Qt.AlignLeft | Qt.AlignBaseline
                Layout.column: 1
                Layout.row: 2
                Layout.columnSpan: 2
                Layout.rowSpan: 1
            }

            Text {
                font {
                    bold: true
                    italic: true
                    pixelSize: 15
                }
                text: "Local firmware"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                Layout.alignment: Qt.AlignLeft | Qt.AlignBaseline
                Layout.column: 1
                Layout.row: 3
                Layout.columnSpan: 2
                Layout.rowSpan: 1
            }

            ComboBox {
                id: cbbFirmware
                font.pointSize: 10
                model: ListModel {}
                Layout.alignment: Qt.AlignRight | Qt.AlignBaseline
                Layout.preferredHeight: comboboxHeight
                Layout.column: 3
                Layout.row: 1
                Layout.columnSpan: 3
                Layout.rowSpan: 1
                height: 25

                onCurrentIndexChanged: {
                    removeAllVersionOptions();
                    var currentFirmware = firmwares[currentIndex];
                    var availableVersions = versionMap[currentFirmware];

                    for (var i=0; i<availableVersions.length; i++) {
                        addVersionOption(availableVersions[i]);
                    }
                    cbbVersion.currentIndex = 0
                }
            }

            ComboBox {
                id: cbbVersion
                font.pointSize: 10
                model: ListModel {}
                Layout.preferredHeight: comboboxHeight
                Layout.alignment: Qt.AlignRight | Qt.AlignBaseline
                Layout.column: 3
                Layout.row: 2
                Layout.columnSpan: 3
                Layout.rowSpan: 1
                height: 25
            }

            TextField {
                id: localFirmwarePath
                font.pointSize: 10
                placeholderText: qsTr("Local firmware path")
                Layout.column: 3
                Layout.row: 3
                Layout.columnSpan: 3
                Layout.rowSpan: 1
                Layout.preferredHeight: 35
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignRight | Qt.AlignBaseline

            }

            FileDialog {
                id: fileDialog
                title: "Choose firmware file"
                currentFolder: "D:/Workspaces/Autopilot/firmware/ardupilot/durandal/4.4.0"
//                currentFile: "D:/Workspaces/Autopilot/firmware/ardupilot/durandal/4.4.0/arduplane.hex"
                nameFilters: ["*.hex"]
                onAccepted: {
                    var absolutePath = currentFile.toString().substring(8);
                    localFirmwarePath.text = absolutePath
                }
//                {
//                    if (fileDialog.fileUrls.length > 0) {
//                        var selectedFile = fileDialog.fileUrls[0].toString();
//                        if (selectedFile.endsWith(".bin", Qt.CaseInsensitive)) {
//                            // Set the selected file path in the TextArea
//                            localFirmwarePath.text = selectedFile;
//                        } else {
//                            // Display an error message or handle invalid selection
//                            console.log("Invalid file selected. Please choose a *.bin file.");
//                        }
//                    }
//                }
            }

            Button {
                text: "Flash"
                Layout.fillWidth: false
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.column: 1
                Layout.row: 4
                Layout.columnSpan: 1
                Layout.rowSpan: 1
                enabled: cbbFirmware.currentIndex!==-1 && cbbVersion.currentIndex!==-1 || localFirmwarePath.length > 0
//                onClicked:
            }

            Button {
                text: "Load online"
                Layout.fillWidth: false
                Layout.rightMargin: -49
                Layout.leftMargin: 25
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                Layout.column: 2
                Layout.row: 4
                Layout.columnSpan: 2
                Layout.rowSpan: 1
                onClicked: {
                    // Disable offline options
                    localFirmwarePath.enabled = false
                    cbbFirmware.enabled = true
                    cbbVersion.enabled = true
                }
            }

            Button {
                text: "Load offline"
                Layout.fillWidth: false
                Layout.rightMargin: 0
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                Layout.column: 4
                Layout.row: 4
                Layout.columnSpan: 2
                Layout.rowSpan: 1
                onClicked: {
                    localFirmwarePath.enabled = true
                    cbbFirmware.enabled = false
                    cbbVersion.enabled = false
                    fileDialog.open()
                }
            }

        }
    }

    footer: ProgressBar {
        indeterminate: true
        anchors.bottom: parent.bottom
//        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 50
        rightPadding: 30
        leftPadding: 30
        value: 0.5
    }

    function addFirmwareOption(firmware) {
        cbbFirmware.model.append({ "text": firmware })
    }

    function removeFirmwareOption(firmware) {
        // Find the index of the option to remove
        for (var i = 0; i < cbbFirmware.model.count; i++) {
            if (cbbFirmware.model.get(i).text === firmware) {
                // Remove the option from the model
                cbbFirmware.model.remove(i);
                break;
            }
        }
    }

    function removeAllFirmwareOptions() {
        cbbFirmware.model.clear()
    }

    function addVersionOption(version) {
        cbbVersion.model.append({ "text": version })
    }

    function removeVersionOption(version) {
        // Find the index of the option to remove
        for (var i = 0; i < cbbVersion.model.count; i++) {
            if (cbbVersion.model.get(i).text === version) {
                // Remove the option from the model
                cbbVersion.model.remove(i);
                break;
            }
        }
    }

    function removeAllVersionOptions() {
        cbbVersion.model.clear()
    }
}
