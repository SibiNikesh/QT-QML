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
        id: txtFieldTxt
        text: qsTr("Text Field")
        anchors.top: parent.top
        anchors.topMargin: 25
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 25
        font.bold: true
    }

    ColumnLayout{

        anchors.centerIn:parent

        RowLayout{
            spacing: 20
            Rectangle{
                width:150
                height: 40
                color:"transparent"
                Text {
                    id: firstName
                    text: qsTr("First Name :")
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    font.pointSize: 15
                }
            }

            Rectangle{
                width:150
                height: 40
                border.color: firstNameTF.text==="" ? "red" : "white"
                TextField{
                    id: firstNameTF
                    anchors.fill: parent
                    validator: RegularExpressionValidator { regularExpression: /[a-z A-Z]+/ }
                    text: backend.str.sTextFieldFN
                    font.pointSize: 12
                }

            }
        }

        RowLayout{
            spacing: 20
            Rectangle{
                width:150
                height: 40
                color:"transparent"
                Text {
                    id: lastName
                    text: qsTr("Last Name :")
                    anchors.right:parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    font.pointSize: 15
                }
            }

            Rectangle{
                width:150
                height: 40
                border.color: lastNameTF.text==="" ? "red" : "white"
                TextField{
                    id: lastNameTF
                    anchors.fill: parent
                    validator: RegularExpressionValidator { regularExpression: /[a-z A-Z]+/ }
                    text: backend.str.sTextFieldLN
                    font.pointSize: 12
                }
            }
        }

        RowLayout{
            spacing: 20
            Rectangle{
                width:150
                height: 40
                color:"transparent"
                Text {
                    id: batchName
                    text: qsTr("Batch ID :")
                    anchors.right:parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    font.pointSize: 15
                }
            }
            Rectangle{
                width:150
                height: 40
                border.color: batchNameTF.text==="" ? "red" : "white"
                TextField{
                    id: batchNameTF
                    validator: IntValidator {bottom:1 ; top: 5}
                    anchors.fill: parent
                    text: backend.str.sTextFieldBatchID
                    font.pointSize: 12
                }
            }
        }

    }

    Rectangle{
        width: 300
        height: 50
        anchors.bottom: confirmBtnTF.top
        anchors.bottomMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        Text{
            id: txt
            text: ""
        }
    }



    RoundButton{

        id:confirmBtnTF
        width: 100
        height: 40
        text: "Submit"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter

        onClicked: {
            backend.textField = "First Name: "+firstNameTF.text+"\n"+"Last Name: "+lastNameTF.text+"\n"+"Batch ID: "+batchNameTF.text
            backend.getTextFieldValueUI(backend.textField)
            txt.text = backend.textField
        }

    }


}
