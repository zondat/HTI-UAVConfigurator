import QtQuick 2.15
import QtQuick.Controls 2.15
import UavConfigurator 1.0

Rectangle {
    id: infoFlowBound
    width:  Constants.width * (1 - Constants.globalContentViewWidthFactor)
    height: Constants.height - Constants.globalToolBarHeight
//    border.width: 1
//    border.color: Constants.darkGreen
    color: Constants.veryLightYellow

    Column {
        id: infoFlow
        anchors{
            fill: parent
        }
        spacing: 2

        Flickable {
            id: illustrationImage
            anchors.top: parent.top
            height: parent.height * 0.5

            Image {
                id: illustratedImage
                width: 91
                height: 91
                source: "../images/icons/peset_wing.svg"
            }
        }

        TextArea {
            id: sysInfo
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.top: illustrationImage.bottom
            //                anchors.bottom: parent.bottom
            wrapMode: Text.Wrap
            readOnly: true
            selectedTextColor: "#000000"
            selectionColor: "#2c3692"
            placeholderText: qsTr("Information")
        }
    }
}
