import QtQuick 2.15
import QtQuick.Controls 2.15
import UavConfigurator 1.0

Rectangle {
    property bool commonBorder : true
    property int lBorderwidth : 1
    property int rBorderwidth : 1
    property int tBorderwidth : 1
    property int bBorderwidth : 1
    property int commonBorderWidth : 1
    property int roundedRadius: 10
    property string borderColor : "white"

    z : -1
    color: borderColor

    anchors
    {
        left: parent.left
        right: parent.right
        top: parent.top
        bottom: parent.bottom

        topMargin    : commonBorder ? -commonBorderWidth : -tBorderwidth
        bottomMargin : commonBorder ? -commonBorderWidth : -bBorderwidth
        leftMargin   : commonBorder ? -commonBorderWidth : -lBorderwidth
        rightMargin  : commonBorder ? -commonBorderWidth : -rBorderwidth
    }
}
