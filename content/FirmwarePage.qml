import QtQuick 2.15
import QtQuick.Controls 2.15
import UavConfigurator 1.0
import QtQuick.Layouts 2.15
//import QtQuick.Dialogs 2.15

Page {
    id: firmwarePage
    background: Rectangle {
        anchors.fill: parent
        color: Constants.veryLightGray
    }

    Rectangle {
        y: 24
        color: Constants.veryLightYellow
        radius: 15
        border.color: Constants.orange
        border.width: 1
        anchors.horizontalCenterOffset: 5
        width: 500
        height: 350
        anchors {
            horizontalCenter: parent.horizontalCenter
        }

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
                Layout.columnSpan: 3
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
                Layout.columnSpan: 3
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
                font.pointSize: 10
                model: ["First", "Second", "Third"]
                anchors.right: parent.horizontalCenter
                Layout.alignment: Qt.AlignLeft | Qt.AlignBaseline
                anchors.rightMargin: -228
                Layout.column: 4
                Layout.row: 1
                Layout.columnSpan: 2
                Layout.rowSpan: 1
                height: 30
            }

            ComboBox {
                font.pointSize: 10
                model: ["First", "Second", "Third"]
                anchors.right: parent.horizontalCenter
                Layout.alignment: Qt.AlignLeft | Qt.AlignBaseline
                anchors.rightMargin: -228
                Layout.column: 4
                Layout.row: 2
                Layout.columnSpan: 2
                Layout.rowSpan: 1
                height: 30
            }

            TextField {
                placeholderText: qsTr("Local firmware path")
                Layout.column: 3
                Layout.row: 3
                Layout.columnSpan: 3
                Layout.rowSpan: 1
                height: 30
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignRight | Qt.AlignBaseline

            }

            Button {
                   text: "Load online"
                   Layout.column: 2
                   Layout.row: 4
                   Layout.columnSpan: 2
                   Layout.rowSpan: 1
//                   onClicked: model.submit()
               }
               Button {
                   text: "Load offline"
                   Layout.column: 4
                   Layout.row: 4
                   Layout.columnSpan: 2
                   Layout.rowSpan: 1
//                   onClicked: model.revert()
               }
        }
    }

    footer: ProgressBar {
        anchors.bottom: parent.bottom
        indeterminate: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 50
        rightPadding: 30
        leftPadding: 30
        value: 0.5
    }

}
