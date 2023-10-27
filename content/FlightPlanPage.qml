import QtQuick 2.15
import QtQuick.Controls 2.15
import UavConfigurator 1.0
import QtLocation 5.12
import QtPositioning 5.12

Window {
    visible: true
    width: 800
    height: 600
    title: "Interactive Map with Google Maps and Flickable"

    Plugin {
        id: mapPlugin
        name: "osm"
    }

    Flickable {
        anchors.fill: parent

        contentWidth: map.width
        contentHeight: map.height

        Map {
            id: map

            plugin: mapPlugin
            center: QtPositioning.coordinate(37.7749, -122.4194)
            zoomLevel: 12
            rotation: 0

            MapQuickItem {
                coordinate: QtPositioning.coordinate(37.7749, -122.4194)
                anchorPoint.x: image.width / 2
                anchorPoint.y: image.height
                sourceItem: Item {
                    width: 50
                    height: 50
                    Image {
                        id: image
                        source: "../images/icons/cf_icon_advanced_white.svg"
                        anchors.fill: parent
                    }
                }
            }
        }
    }
}
