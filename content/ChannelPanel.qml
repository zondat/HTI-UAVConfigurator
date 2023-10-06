import QtQuick 2.15
import QtQuick.Controls 2.15
import UavConfigurator 1.0

Item {
    id: channelPanel
    width: 700; //Constants.channelPanelWidth
    height: 150; //Constants.channelPanelHeight

    property string channelFunctionName: "ARM"
    property string channelName: "CH5"

    ChannelHeader {
        id: chnHeader
        functionName: channelFunctionName
        anchors {
            top: channelPanel.top
            left: channelPanel.left
            bottom: channelPanel.bottom
        }
    }

    Rectangle {
        id: boundingRect
        width: Constants.comboboxWidth
        color: Constants.lightGray

        anchors {
            left: chnHeader.right
            top: channelPanel.top
            bottom: channelPanel.bottom
            leftMargin: 5
            topMargin: 10
            bottomMargin: 10
        }

        ComboBox {
            id: cbbChannel
            font.pointSize: 10
            model: ListModel {}
            height: Constants.comboboxHeight
            anchors {
                top: boundingRect.top
                left: boundingRect.left
                right: boundingRect.right
            }
        }

        Row {
            id: rowMinVal
            anchors {
                top: cbbChannel.bottom
                topMargin: 5
                left: boundingRect.left
                leftMargin: 5
                right: boundingRect.right
            }

            Label {
                text: "Min: "
            }

            TextField {
                id: txtMinValue
                width: 70
                height: 25
                font.pixelSize: 10

                anchors {
                    rightMargin: 5
                    right: rowMinVal.right
                }
            }
        }

        Row {
            id: rowMaxVal
            anchors {
                top: rowMinVal.bottom
                topMargin: 30
                left: boundingRect.left
                leftMargin: 5
                right: boundingRect.right
            }

            Label {
                text: "Max: "
            }

            TextField {
                id: txtMaxValue
                width: 70
                height: 25
                font.pixelSize: 10
                anchors {
                    rightMargin: 5
                    right: rowMaxVal.right
                }
            }
        }
    }

    RangeSliderPanel {
        id: rangeSlider
        preferedWidth: channelPanel.width - chnHeader.width - boundingRect.width
        preferedHeight: channelPanel.height

        anchors {
            top: channelPanel.top
            right: channelPanel.right
            left: boundingRect.right
        }
    }

    Connections {
        target: rangeSlider
        onMinValueChange: {
            console.log("New min value: " + value)
        }

//        onMaxValueChanged {
//            txtMaxValue.text: "" + newMaxValue
//        }
    }
}
