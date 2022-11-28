import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15

Rectangle{
    anchors.fill:parent

    gradient: Gradient{
        GradientStop {position:0.0 ; color:"#5bccf6"}
        GradientStop {position:1.0 ; color:"white"}
    }

    Text {
        id: radioBtnTxt
        text: qsTr("Radio Button")
        anchors.top: parent.top
        anchors.topMargin: 25
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 25
        font.bold: true
    }

    ColumnLayout{
        anchors.centerIn: parent
        Repeater{
            model: ["blue","red","yellow","green","violet"]

            RadioButton{
                id: rb
                text: modelData
                checked: (modelData === backend.str.sRadioButton) ? true : false
                onClicked: {
                    backend.getRadioButtonValueUI(modelData)
                    backend.radioButton = modelData
                }
            }
        }
    }

    Rectangle{
        width: 300
        height: 50
        anchors.bottom: confirmBtnRb.top
        anchors.bottomMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        Text{
            id: txt
            text: ""
        }
    }


    RoundButton{

        id:confirmBtnRb
        width: 100
        height: 40
        text: "Submit"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter

        onClicked: {
            txt.text = backend.radioButton
        }

    }
}
