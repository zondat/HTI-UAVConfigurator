import QtQuick 2.15
import QtQuick.Controls 2.15
import UavConfigurator 1.0

Item {
    id: channelFunctionalSetting
    width: 145
    height: Constants.channelPanelHeight

    property string functionName: "ARM"

    Rectangle {
        id: functionRect
        width: channelFunctionalSetting.width
        height: channelFunctionalSetting.height
        color: btnEnable.isChecked()? Constants.darkBlue : Constants.lightGray

        Text {
            id: txtLabel
            font {
                bold: true
                italic: false
                pixelSize: 15
            }
            text: functionName
            horizontalAlignment: Text.AlignHCenter
            anchors{
                top: functionRect.top
                topMargin: 10
                left: functionRect.left
                right: functionRect.right
            }
            color: btnEnable.isChecked()? Constants.lightGray : Constants.darkGray
        }

        SwitchButton {
            id: btnEnable
            anchors{
                top: txtLabel.top
                left: functionRect.left
                right: functionRect.right
                bottom: functionRect.bottom
            }
            label: "Enable"
            fontSize: 15
        }
    }
}
