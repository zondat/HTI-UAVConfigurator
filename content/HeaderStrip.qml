import QtQuick 2.15
import QtQuick.Controls 2.15
import UavConfigurator 1.0

Rectangle {
    id: headerStrip
    property string headerName: "Label"
    property int defaultHeight: 30
    property int preferredFontSize: 15
    property bool isItalic: true
    property bool isBold: true
//    property bool isSolidBackground: true
//    width: parent.width
    height: defaultHeight
    anchors {
        left: parent.left
        right: parent.right
    }

    gradient:
        Gradient {
        orientation: Gradient.Horizontal
        GradientStop { position: 0.0; color: Constants.darkBlue }
        GradientStop { position: 0.4; color: Constants.blue }
        GradientStop { position: 1.0; color: Constants.veryLightBlue }
    }

    Text {
        id: txtLabel
        text: qsTr(headerName)
        color: Constants.lightGray
        font {
            pixelSize: preferredFontSize
            italic: isItalic
            bold: isBold
        }
        anchors {
            left: headerStrip.left
            verticalCenter: headerStrip.verticalCenter
        }
    }
}
