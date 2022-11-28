import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle{
    id: custButtonRect
    width: 100
    height: 50
    color: custButtonMA.pressed ? "grey" : "white"
    radius: 5
    anchors.margins: 5
    property string buttonText: "Text"
    signal buttonClicked()

    Text {
        id: custButtonText
        text: buttonText
        anchors.centerIn: parent
    }

    MouseArea{
        id: custButtonMA
        anchors.fill: parent
        onClicked:{
            buttonClicked()
        }
    }
}
