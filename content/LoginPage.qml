

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 2.15
import QtQuick.Controls 2.15
import UavConfigurator 1.0

Page {
    id: loginPage
//    signal registerClicked()
    width: 375
    height: 650
    background: Rectangle {
        color: Constants.veryLightGray
    }

    Column {
        width: parent.width
        anchors.top: iconRect.bottom
        spacing: 15

        Image {
            id: iconRect
            width: parent.width
            height: parent.height / 3
            source: "../images/scisky-logo.svg"
            fillMode: Image.PreserveAspectFit
        }

        TextField {
            id: loginUsername
            placeholderText: qsTr("User name")
            width: parent.width - 20
            selectionColor: "#2a1ee9"
//            color: mainTextCOlor
            font.pointSize: 14
            font.family: "fontawesome"
            leftPadding: 30
            anchors.horizontalCenter: parent.horizontalCenter
            background: Rectangle {
                implicitWidth: 200
                implicitHeight: 50
                radius: implicitHeight / 2
                color: "transparent"

                Image {
                    id: iconUser
                    source: "../images/icons/icon_user.svg"
                    fillMode: Image.PreserveAspectFit
                    anchors {
                        left: parent.left
                        verticalCenter: parent.verticalCenter
                    }
                }
            }
        }

        TextField {
            id: loginPassword
            placeholderText: qsTr("Password")
            width: parent.width - 20
//            Layout.alignment: Qt.AlignHCenter
//            color: mainTextCOlor
            font.pointSize: 14
            font.family: "fontawesome"
            leftPadding: 30
            echoMode: TextField.PasswordEchoOnEdit
            anchors.horizontalCenter: parent.horizontalCenter
            background: Rectangle {
                implicitWidth: 200
                implicitHeight: 50
                radius: implicitHeight / 2
                color: "transparent"

                Image {
                    id: iconPassword
                    source: "../images/icons/icon_lock.svg"
                    fillMode: Image.PreserveAspectFit
                    anchors {
                        left: parent.left
                        verticalCenter: parent.verticalCenter
                    }
                }
            }
        }

        Button{
            height: 50
            width: loginPage.width - 20
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Log In"
            onClicked: {
                loginUser(loginUsername.text, loginPassword.text)
            }
        }

        Button{
            height: 50
            width: loginPage.width - 20
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Sign Up"
            onClicked: stackView.push("qrc:/RegisterScreen.qml", {"uname": "arun", "pword": "some"}) //registerClicked()
        }

        // To complete
        function loginUser(userName, password) {

        }


    }
}
