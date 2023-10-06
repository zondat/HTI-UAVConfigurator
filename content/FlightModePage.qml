import QtQuick 2.15
import QtQuick.Controls 2.15
import UavConfigurator 1.0
import QtQuick.Layouts 2.15

Page {
    id: flightModePage
    ScrollView {
           anchors.fill: parent

           Column {
               width: parent.width

               // Long content to be displayed in the ScrollView
               Repeater {
                   model: 20 // Adjust the number of items as needed
                   Rectangle {
                       width: parent.width
                       height: 50
                       color: index % 2 === 0 ? "lightgray" : "lightblue"
                       Text {
                           anchors.centerIn: parent
                           text: "Item " + (index + 1)
                       }
                   }
               }
           }
       }
}
