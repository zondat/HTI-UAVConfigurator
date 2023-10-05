import QtQuick 2.15
import QtQuick.Controls 2.15
import UavConfigurator 1.0
import QtQuick.Layouts 2.15

Item {
    id: column
    visible: true
    height: 75
    property string channelName: "Channel 1";

    GridLayout {
        anchors {
            top: parent.top;
            left: parent.left;
            right: parent.right;
        }

        flow: GridLayout.LeftToRight
        layoutDirection: Qt.LeftToRight
        columns: 5
        rows: 2

        ComboBox {
            id: cbbChannel
            model: ListElement {text: channelName}
            Layout.preferredHeight: 35
            Layout.fillHeight: false
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.column: 0
            Layout.row: 0
            Layout.columnSpan: 1
            Layout.rowSpan: 2
        }

        Slider {
            id: lowerSlider
            Layout.fillWidth: true
//            width: parent.width * 0.8
            Layout.column: 1
            Layout.row: 0
            Layout.columnSpan: 4
            Layout.rowSpan: 2
        }

        Slider {
            id: upperSlider
            Layout.fillWidth: true
//            width: parent.width * 0.8
            Layout.column: 1
            Layout.row: 1
            Layout.columnSpan: 4
            Layout.rowSpan: 2
        }
    }


}
