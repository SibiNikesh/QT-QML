import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15

Rectangle{

    id:chkBoxRect
    anchors.fill:parent

    gradient: Gradient{
        GradientStop {position:0.0 ; color:"#5bccf6"}
        GradientStop {position:1.0 ; color:"white"}
    }

    Text {
        id: checkBoxTxt
        text: qsTr("Check Box")
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

            CheckBox{
                id:checkBox1
                text: modelData
                checked: (modelData === backend.str.sCheckBoxValue) ? true : false

                onClicked: {
                    if(checkBox1.checked === true){
                        chbLM.append({"clr":modelData})
                    }
                }
            }
        }
    }

    ListModel{
        id:chbLM
        ListElement{clr:""}
    }

    Component{
        id: chbComponent

        Text{
            id:chbTextValue
            text: clr
        }
    }

    Rectangle{
        width: 300
        height: 50
        anchors.bottom: confirmBtnChk.top
        anchors.bottomMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        Text{
            id: txt
            text: ""
        }
    }

    RoundButton{

        id:confirmBtnChk
        width: 100
        height: 40
        text: "Submit"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter

        onClicked: {
            txt.text=""
            for(var i=0; i<chbLM.count;i++){
                backend.chkbox = backend.chkbox+ chbLM.get(i).clr+" "
            }

            backend.getCheckBoxValueUI(backend.chkbox)
            chbLM.clear()
            txt.text = backend.chkbox
            backend.chkbox=""
        }

    }

}
