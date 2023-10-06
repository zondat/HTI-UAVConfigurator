import QtQuick 2.15
import QtQuick.Controls 2.15
import UavConfigurator 1.0
import QtQuick.Layouts 2.15

Rectangle {
    id: rangeSliderPanel  

    property int majorScale: 5
    property int minorScale: 4
    property int preferedWidth: 700
    property int preferedHeight: 50
    property int maxRange: 2000
    property int minRange: 1000

    signal minValueChanged(int value)
    signal maxValueChanged(int value)

    width: preferedWidth
    height: preferedHeight
    visible: true

    RangeSlider {
        id: rangeSlider
        first.value: 0.25
        second.value: 0.75

        anchors {
            left: parent.left;
            right: parent.right;
        }

        readonly property int tickWidth: 1

        Item {
            id: rowLayout
            parent: rangeSlider.background
            width: parent.width
            height: 10
            anchors{
                top: parent.bottom
                left: parent.left
                right: parent.right
                topMargin: 10
                leftMargin: 15
                rightMargin: 15

            }

            Repeater {
                id: repeater
                model: majorScale * minorScale + 1

                delegate: Column {
                    id: column
                    anchors {
                        left: parent.left
                        right: parent.right
                    }

                    Rectangle {
                        id: scaleRect
                        x: index * Math.round((rowLayout.width - 30) / (majorScale * minorScale))
//                        y: parent.height
                        implicitWidth: major ? rangeSlider.tickWidth + 1 : rangeSlider.tickWidth
                        implicitHeight: major ? 10 : 7
                        color: Constants.gray
                        readonly property bool major: index % minorScale == 0 || index === Math.round(majorScale * minorScale / 2)
                    }

                    TextInput {
                        x: index * Math.round((rowLayout.width - 30) / (majorScale * minorScale)) - 6
                        font.pixelSize: 14
                        anchors.top: scaleRect.bottom
                        anchors.topMargin: 3
                        text: "" + Math.round((minRange + index * (maxRange - minRange)/(majorScale * minorScale)))
                        readOnly: true // Make the textbox read-only
                        visible: major
                        readonly property bool major: index % minorScale == 0 || index === Math.round(majorScale * minorScale / 2)
                    }
                }
            }
        }

        // Functions
        function getMinValuePercentage() {
            return first.value
        }

        function getMaxValuePercentage() {
            return second.value
        }

        function getMinValue() {
            return Math.round(minRange + first.value * (maxRange - minRange))
        }

        function getMaxValue() {
            return Math.round(minRange + second.value * (maxRange - minRange))
        }
    }
}



