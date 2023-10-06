import QtQuick 2.15
import QtQuick.Controls 2.15
import UavConfigurator 1.0
import QtQuick.Layouts 2.15

Rectangle {
    id: row
    visible: true
    anchors {
        left: parent.left;
        right: parent.right;
    }
    height: 45
//    layoutDirection: Qt.LeftToRight
//    spacing: 5

    ComboBox {
        id: cbbChannel
        font.pointSize: 10
        model: ListModel {}
        anchors {
            left: parent.left
            leftMargin: 10
            verticalCenter: parent.verticalCenter
        }
        Layout {
            preferredHeight: Constants.comboboxHeight
            preferredWidth: Constants.comboboxWidth
            alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }
    }

    RangeSlider {
        id: control
        first.value: 0.25
        second.value: 0.75
        anchors.right: parent.right
        rightPadding: 5
        height: Constants.comboboxHeight
        width: parent.width - Constants.comboboxWidth - 20

//        readonly property int tickWidth: 1

//        background: Rectangle {
//            x: control.leftPadding
//            y: control.topPadding + control.availableHeight / 2 - height / 2
//            implicitWidth: 200
//            implicitHeight: 4
//            width: control.availableWidth
//            height: implicitHeight
//            radius: 2
//            color: Constants.gray

//            Rectangle {
//                x: control.first.visualPosition * parent.width
//                width: control.second.visualPosition * parent.width - x
//                height: parent.height
//                color: Constants.blue
//                radius: 2
//            }
//        }

//        first.handle: Rectangle {
//            x: control.leftPadding + control.first.visualPosition * (control.availableWidth - width)
//            y: control.topPadding + control.availableHeight / 2 - height / 2
//            implicitWidth: 26
//            implicitHeight: 26
//            radius: 13
//            color: control.first.pressed ? "#f0f0f0" : "#f6f6f6"
//            border.color: Constants.lightGray
//        }

//        second.handle: Rectangle {
//            x: control.leftPadding + control.second.visualPosition * (control.availableWidth - width)
//            y: control.topPadding + control.availableHeight / 2 - height / 2
//            implicitWidth: 26
//            implicitHeight: 26
//            radius: 13
//            color: control.second.pressed ? "#f0f0f0" : "#f6f6f6"
//            border.color: Constants.lightGray
//        }

        readonly property int tickWidth: 1

        Item {
            id: rowLayout
            parent: control.background
            width: parent.width
            height: 8
            anchors.top: parent.bottom
            anchors.topMargin: 12

            property int spacing: 1

            Repeater {
                model: rangeSlider.background.width / (parent.spacing + rangeSlider.tickWidth) + 1
                delegate: Rectangle {
                    x: index * (rowLayout.spacing + rangeSlider.tickWidth)
                    y: parent.height - height
                    implicitWidth: major ? rangeSlider.tickWidth + 1 : rangeSlider.tickWidth
                    implicitHeight: major ? 8 : 6
                    color: "#444"

                    readonly property bool major: index % 5 == 0
                }
            }
        }
    }


}
