import QtQuick 2.15
import QtQuick.Controls 2.15
import SddmComponents 2.0

Rectangle {
    id: root
    width: 1920
    height: 1080
    color: "#1e1e2e"

    // Background
    Image {
        anchors.fill: parent
        source: config.background
        fillMode: Image.PreserveAspectCrop
    }

    // Overlay sombre
    Rectangle {
        anchors.fill: parent
        color: "#1e1e2e"
        opacity: 0.7
    }

    // Container principal
    Rectangle {
        anchors.centerIn: parent
        width: 400
        height: 500
        color: "#11111b"
        radius: 20
        opacity: 0.9

        Column {
            anchors.centerIn: parent
            spacing: 30

            // Titre
            Text {
                text: "Bienvenue"
                color: "#cba6f7"
                font.pixelSize: 40
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
            }

            // Horloge
            Text {
                id: clock
                color: "#f5c2e7"
                font.pixelSize: 24
                anchors.horizontalCenter: parent.horizontalCenter
                
                function updateTime() {
                    text = new Date().toLocaleTimeString(Qt.locale("fr_FR"), "hh:mm");
                }
            }

            Timer {
                interval: 1000
                running: true
                repeat: true
                onTriggered: clock.updateTime()
            }

            // Username
            TextField {
                id: username
                width: 350
                height: 50
                placeholderText: "Nom d'utilisateur"
                color: "#cdd6f4"
                font.pixelSize: 16
                anchors.horizontalCenter: parent.horizontalCenter
                
                background: Rectangle {
                    color: "#313244"
                    radius: 10
                }
            }

            // Password
            TextField {
                id: password
                width: 350
                height: 50
                placeholderText: "Mot de passe"
                echoMode: TextInput.Password
                color: "#cdd6f4"
                font.pixelSize: 16
                anchors.horizontalCenter: parent.horizontalCenter
                
                background: Rectangle {
                    color: "#313244"
                    radius: 10
                }
                
                onAccepted: sddm.login(username.text, password.text, sessionModel.lastIndex)
            }

            // Login button
            Button {
                width: 350
                height: 50
                text: "Se connecter"
                anchors.horizontalCenter: parent.horizontalCenter
                
                background: Rectangle {
                    color: parent.down ? "#b4befe" : "#cba6f7"
                    radius: 10
                }
                
                contentItem: Text {
                    text: parent.text
                    color: "#11111b"
                    font.pixelSize: 18
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                
                onClicked: sddm.login(username.text, password.text, sessionModel.lastIndex)
            }
        }
    }

    Component.onCompleted: {
        username.forceActiveFocus()
    }
}
