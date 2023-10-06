import QtQuick 2.15
import QtQuick.Controls 2.15
import UavConfigurator 1.0


SwitchDelegate {
    id: control

    property string label: "SwitchDelegate"
    property int fontSize: 15

    font {
        bold: true
        pixelSize: fontSize
    }
    text: qsTr(label)
    checked: true

    contentItem: Text {
        rightPadding: control.indicator.width + control.spacing
        text: control.text
        font: control.font
        opacity: enabled ? 1.0 : 0.3
        color: control.checked ? Constants.lightGray : Constants.gray
        elide: Text.ElideRight
        verticalAlignment: Text.AlignVCenter
    }

    indicator: Rectangle {
        implicitWidth: 48
        implicitHeight: 26
        x: control.width - width - control.rightPadding
        y: parent.height / 2 - height / 2
        radius: 13
        color: control.checked ? Constants.blue : "transparent"
        border.color: control.checked ? Constants.blue : "#cccccc"

        Rectangle {
            x: control.checked ? parent.width - width : 0
            width: 26
            height: 26
            radius: 13
            color: control.down ? "#cccccc" : "#ffffff"
            border.color: control.checked ? (control.down ? Constants.darkBlue : Constants.blue) : "#999999"
        }
    }

    background: Rectangle {
        implicitWidth: 100
        implicitHeight: 40
        visible: control.down || control.highlighted
        color: control.down ? "#bdbebf" : "#eeeeee"
    }

    function isChecked() {
        return control.checked;
    }
}
