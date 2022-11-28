import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15


Rectangle{
    anchors.fill:parent

    gradient: Gradient{
        GradientStop {position:0.0 ; color:"#5bccf6"}
        GradientStop {position:1.0 ; color:"white"}
    }

    Text {
        id: toggleSwitchTxt
        text: qsTr("Toggle Switch")
        anchors.top: parent.top
        anchors.topMargin: 25
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 25
        font.bold: true
    }

    Switch{
        id: swt
        anchors.centerIn: parent
        text:"Slide"
        font.pointSize: 15
        checked: backend.str.sToggleEnabled
        onClicked: {
            backend.toggleSwitch = swt.position
            backend.getToggleSwitchValueUI(backend.toggleSwitch)
        }

    }

    Rectangle{
        width: 300
        height: 50
        anchors.bottom: confirmBtnTS.top
        anchors.bottomMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        Text{
            id: txt
            text: ""
        }
    }

    RoundButton{

        id:confirmBtnTS
        width: 100
        height: 40
        text: "Submit"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: {
            backend.toggleSwitch = swt.position
            txt.text=backend.toggleSwitch
        }

    }
}
