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
        id: comboBoxTxt
        text: qsTr("Combo Box")
        anchors.top: parent.top
        anchors.topMargin: 25
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 25
        font.bold: true
    }

    ComboBox{
        id: cmbBox
        anchors.centerIn: parent
        model:["red","blue","green","yellow","cyan"]
        currentIndex: backend.str.sComboBoxIndex
    }

    Rectangle{
        width: 300
        height: 50
        anchors.bottom: confirmBtnCmb.top
        anchors.bottomMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        Text{
            id: txt
            text: ""
        }
    }

    RoundButton{

        id:confirmBtnCmb
        width: 100
        height: 40
        text: "Submit"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter

        onClicked: {
            backend.getComboBoxValueUI(cmbBox.currentValue)
            backend.cmbBox = cmbBox.currentValue
            txt.text=backend.cmbBox
        }

    }
}
