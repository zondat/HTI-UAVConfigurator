import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import UavConfigurator 1.0

Page {
    property string uname: ""
    property string pword: ""

    id: registerPage
    width: 425
    height: 650
    background: Rectangle {
        color: Constants.veryLightGray
    }

    Column {
        anchors.fill: parent
//        anchors.topMargin: 30
        spacing: 25

        Text {
            id: signupText
            text: qsTr("Sign Up")
            font.bold: true
            font.pointSize: 24
            anchors.horizontalCenter: parent.horizontalCenter
        }

        TextField {
            id: registerUsername
            placeholderText: qsTr("User name")
            width: parent.width - 20
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
            id: registerPassword
            placeholderText: qsTr("Password")
            width: parent.width - 20
            font.pointSize: 14
            font.family: "fontawesome"
            anchors.horizontalCenter: parent.horizontalCenter
            leftPadding: 30
            echoMode: TextField.PasswordEchoOnEdit
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

        TextField {
            id: registerPassword2
            placeholderText: qsTr("Confirm Password")
            width: parent.width - 20
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 14
            font.family: "fontawesome"
            leftPadding: 45
            echoMode: TextField.PasswordEchoOnEdit
            background: Rectangle {
                implicitWidth: 200
                implicitHeight: 50
                radius: implicitHeight / 2
                color: "transparent"
                Image {
                    id: iconConfirmPassword
                    source: "../images/icons/icon_confirmpassword.svg"
                    fillMode: Image.PreserveAspectFit
                    anchors {
                        left: parent.left
                        verticalCenter: parent.verticalCenter
                    }
                }
            }
        }

        TextField {
            id: passwordHint
            placeholderText: qsTr("Password Hint")
            width: parent.width - 20
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 14
            font.family: "fontawesome"
            leftPadding: 45
            background: Rectangle {
                implicitWidth: 200
                implicitHeight: 50
                radius: implicitHeight / 2
                color: "transparent"
                Image {
                    id: iconPasswordHint
                    source: "../images/icons/icon_lightbulb.svg"
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
            width: parent.width - 20
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Sign Up"
            onClicked: registerNewUser(registerUsername.text, registerPassword.text, registerPassword2.text, passwordHint.text)
        }

        Button{
            height: 50
            text: "Cancel"
            width: parent.width - 20
            anchors.horizontalCenter: parent.horizontalCenter

            onClicked: stackView.pop()
        }
    }
}
