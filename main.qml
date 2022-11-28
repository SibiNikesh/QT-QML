import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15


ApplicationWindow {

    width: 800
    height: 800
    visible:true
    property bool homePageLoaded: false

    header: Header{

        onCurrentPageClicked: {

            if (id=="Home Page"){
                loader1.source="HomePage.qml"
            }
            else if(id=="Check Box"){
                loader1.source="CheckBoxPage.qml"
            }
            else if(id=="Combo Box"){
                loader1.source="ComboBoxPage.qml"
            }
            else if(id=="Radio Button"){
                loader1.source="RadioButtonPage.qml"
            }
            else if(id=="Text Field"){
                loader1.source="TextFieldPage.qml"
            }
            else if(id=="Toggle Switch"){
                loader1.source="ToggleSwitchPage.qml"
            }
            else if(id=="Traffic Signal"){
                loader1.source="TrafficSignalPage.qml"
            }
            else if(id=="Stopwatch"){
                loader1.source="StopwatchPage.qml"
            }
        }
    }

    Loader{
        id: loader1
        anchors.fill: parent
        source: "HomePage.qml"

    }

    footer: FooterPage{

    }

    Component.onCompleted:{
        homePageLoaded=true
    }



}
