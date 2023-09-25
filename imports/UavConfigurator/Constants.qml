pragma Singleton
import QtQuick 2.15

QtObject {
    readonly property int width: 1920
    readonly property int height: 1080

    property string relativeFontDirectory: "fonts"

    /* Edit this comment to add your custom font */
    readonly property font font: Qt.font({
                                             family: Qt.application.font.family,
                                             pixelSize: Qt.application.font.pixelSize
//                                             color: "red"
                                         })
    readonly property font largeFont: Qt.font({
                                                  family: Qt.application.font.family,
                                                  pixelSize: Qt.application.font.pixelSize * 1.6
                                              })


    /* Color Setting */
    readonly property color lightRed: "#ff2600"
    readonly property color darkRed: "#c51605"

    readonly property color green: "#50C166"
    readonly property color lightGreen: "#a8df8e"
    readonly property color veryLightGreen: "#F3FDE8"
    readonly property color darkGreen: "#1C8001"

    readonly property color veryLightGray: "#F6F1E9"
    readonly property color lightGray: "#F6F7F9"
    readonly property color gray: "#606161"
    readonly property color darkGray: "#262731"

    readonly property color veryLightYellow: "#FDFFE3"
    readonly property color lightYellow: "#F7E987"
    readonly property color yellow: "#F8DE22"
    readonly property color orange: "#FF9201"

    readonly property color veryLightBlue: "#D3E2F3"
    readonly property color lightBlue: "#86E5FF"
    readonly property color darkBlue: "#1C4472"
    readonly property color blue: "#4382CA"

    readonly property color backgroundColor: lightGray

    /*************************/
    /*** Dimension Setting ***/
    /*************************/
    readonly property int globalToolBarHeight: 100
    readonly property int globalVerticalSpacing: 3
    readonly property int globalHorizontalSpacing: 2

    readonly property int statusbarWidth: 750
    readonly property int mainToolbarWidth: 500

    readonly property double tabButtonWidth: 150
    readonly property double tabButtonHeight: 50

    readonly property double globalContentViewWidthFactor: 5/6
    readonly property double globalToolbarWidthFactor: 1/3
    readonly property double infoFlowDivideFactor: 0.5


    /*******************/
    /*** Enumeration ***/
    /*******************/
    readonly property int _BAT_WELL: 1
    readonly property int _BAT_NORM: 0
    readonly property int _BAT_ALERT: -1

    property DirectoryFontLoader directoryFontLoader: DirectoryFontLoader {
        id: directoryFontLoader
    }
}
