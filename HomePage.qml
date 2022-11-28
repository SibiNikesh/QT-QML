import QtQuick 2.15

Rectangle {
    id:homePage
    anchors.fill: parent

    gradient: Gradient{
        GradientStop {position:0.0 ; color:"#5bccf6"}
        GradientStop {position:1.0 ; color:"white"}
    }

    Text {
        id: homePageTxt
        text: qsTr("HomePage")
        anchors.centerIn: parent
        font.pointSize: 25
        font.bold: true
    }

}
