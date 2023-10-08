import QtQuick 2.15
import QtQuick.Controls 2.15
import UavConfigurator 1.0

Rectangle {
    id: boundingRect
    property int width: 500
    property int height: 400
    property int radius: 10
    color: Constants.veryLightBlue

    ScrollView {
           anchors.fill: boundingRect

           Column {
               width: boundingRect.width

               // Long content to be displayed in the ScrollView
               Repeater {
                   model: 20 // Adjust the number of items as needed
                   Rectangle {
                       width: boundingRect.width
                       height: 50
                       color: index % 2 === 0 ? "lightgray" : "lightblue"
                       Text {
                           anchors.centerIn: boundingRect
                           text: "Item " + (index + 1)
                       }
                   }
               }
           }
       }
}
