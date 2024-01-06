

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import UavConfigurator 1.0

Page {
    id: loginPage
//    signal registerClicked()
    width: 375
    height: 650
    background: Rectangle {
        color: Constants.veryLightGray
    }

    StackLayout{
        id: stackView
        focus: true
        anchors.fill: parent
        currentIndex: 1
            LoginPage {}
            RegisterPage {}
    }
}
