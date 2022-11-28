import QtQuick 2.15
import QtQml 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15


Rectangle{

    property int a: 0           //Timer property for milliseconds stopwatch
    property int b: 0           //Timer property for seconds stopwatch
    property int c: 0           //Timer property for minute stopwatch
    property int time: 0

    id:mainwindowStopwatch
//    anchors.fill: stopwatchView
    color: "#E7E7E7"

    gradient: Gradient{
        GradientStop {position:0.0 ; color:"#5bccf6"}
        GradientStop {position:1.0 ; color:"white"}
    }

    Rectangle{
        id:stopwatchwindow
        width: 300
        height: 100
        color:"black"
        radius:10
        anchors{
            left: mainwindowStopwatch.left
            leftMargin: 20
            verticalCenter: mainwindowStopwatch.verticalCenter
        }

        Timer{
            id:stopwatchtimer_milliseconds
            interval: 10
            repeat:true
            running: false
            triggeredOnStart: false
            onTriggered: {
                a++
                stopwatchtime_milliseconds.text=a
                if(a==99){
                    a=0
                }
            }
        }

        Timer{
            id:stopwatchtimer_seconds
            interval: 1000
            repeat:true
            running: false
            triggeredOnStart: false
            onTriggered: {
                b++
                stopwatchtime_seconds.text=b
                if(b==59){
                    b=0
                }
            }
        }

        Timer{
            id:stopwatchtimer_minute
            interval: 60000
            repeat:true
            running: false
            triggeredOnStart: false
            onTriggered: {
                c++
                stopwatchtime_minute.text=c
            }
        }


        Rectangle{
            id:stopwatchminute_label
            width:50
            height:50
            color:"white"
            radius:5
            anchors{
                left: stopwatchwindow.left
                verticalCenter: stopwatchwindow.verticalCenter
                leftMargin: 25
            }

            Text {
                id: stopwatchtime_minute
                text: "0"
                color: "black"
                anchors.centerIn: stopwatchminute_label
            }
        }

        Rectangle{
            id:stopwatchminutename_label
            anchors{
                top: stopwatchminute_label.bottom
                topMargin: 5
                left: stopwatchwindow.left
                leftMargin: 50
            }

            Text {
                id: stopwatchminute_name
                text: qsTr("mm")
                color: "white"
                anchors.centerIn: stopwatchminutename_label
            }
        }

        Rectangle{
            id:stopwatchseconds_label
            width:50
            height:50
            color:"white"
            radius:5
            anchors{
                left: stopwatchminute_label.right
                verticalCenter: stopwatchwindow.verticalCenter
                leftMargin: 50
            }

            Text {
                id: stopwatchtime_seconds
                text: "00"
                color: "black"
                anchors.centerIn: stopwatchseconds_label
            }
        }

        Rectangle{
            id:stopwatchsecondsname_label
            anchors{
                top: stopwatchseconds_label.bottom
                topMargin: 5
                left: stopwatchminutename_label.right
                leftMargin: 100
            }

            Text {
                id: stopwatchseconds_name
                text: qsTr("ss")
                color: "white"
                anchors.centerIn: stopwatchsecondsname_label
            }
        }

        Rectangle{
            id:stopwatchmilliseconds_label
            width:50
            height:50
            color:"white"
            radius:5
            anchors{
                left: stopwatchseconds_label.right
                verticalCenter: stopwatchwindow.verticalCenter
                leftMargin: 50
            }

            Text {
                id: stopwatchtime_milliseconds
                text: "00"
                color: "black"
                anchors.centerIn: stopwatchmilliseconds_label
            }
        }

        Rectangle{
            id:stopwatchmillisecondsname_label
            anchors{
                top: stopwatchseconds_label.bottom
                topMargin: 5
                left: stopwatchsecondsname_label.right
                leftMargin: 100
            }

            Text {
                id: stopwatchmilliseconds_name
                text: qsTr("ms")
                color: "white"
                anchors.centerIn: stopwatchmillisecondsname_label
            }
        }

        RoundButton{
            id:stopwatchplaybutton
            text: "Play"
            width:60
            height:60
            anchors{
                left: stopwatchwindow.right
                verticalCenter: stopwatchwindow.verticalCenter
                leftMargin: 20
            }
            onClicked: {
                stopwatchtimer_milliseconds.running=true
                stopwatchtimer_minute.running=true
                stopwatchtimer_seconds.running=true
            }
            palette.button: "light green"
        }

        RoundButton{
            id:stopwatchpausebutton
            text: "Pause"
            width:60
            height:60
            anchors{
                left: stopwatchplaybutton.right
                verticalCenter: stopwatchwindow.verticalCenter
                leftMargin: 20
            }
            onClicked: {
                stopwatchtimer_milliseconds.running=false
                stopwatchtimer_minute.running=false
                stopwatchtimer_seconds.running=false
            }
            palette.button: "yellow"

        }

        RoundButton{
            id:stopwatchresetbutton
            text: "reset"
            width:60
            height:60
            anchors{
                left: stopwatchpausebutton.right
                verticalCenter: stopwatchwindow.verticalCenter
                leftMargin: 20
            }
            onClicked: {
                stopwatchtimer_milliseconds.running=false
                stopwatchtimer_minute.running=false
                stopwatchtimer_seconds.running=false
                a=0
                b=0
                c=0
                stopwatchtime_minute.text="0"
                stopwatchtime_seconds.text="00"
                stopwatchtime_milliseconds.text="00"
            }
            palette.button: "red"
        }

        Rectangle{
            id: stopwatchlaptime_label
            width:350
            height:150
            anchors{
                top: stopwatchwindow.bottom
                topMargin: 50
                left: parent.left
                leftMargin: 200
            }
            color: "black"

            Component{
                id: laptimeDelegate
                Column{
                    width: 350
                    Text {
                        id: laptimetext
                        font.pointSize: 10
                        color:"white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: lap
                    }
                }

            }

            ListModel{
                id:stopwatchListModel
                anchors.horizontalCenter: parent.horizontalCenter
                ListElement{ lap:"" }
            }

            ListView{
                id:laptimeLV
                clip:true
                model:stopwatchListModel
                delegate: laptimeDelegate
                anchors.fill: parent
                anchors.horizontalCenter: parent.horizontalCenter
                interactive: true
                focus: true
            }
        }

        Column{

            id: columnButtons
            width:100
            height:120
            spacing: 30
            anchors{
                left: stopwatchresetbutton.right
                verticalCenter: stopwatchwindow.verticalCenter
                leftMargin: 20
            }

            RoundButton{
                id:stopwatchlapbutton
                width:100
                height:50
                text: "Lap Time"
                font.pointSize: 10
                onClicked: {
                    time++
                    stopwatchListModel.append({"lap":time+":   "+stopwatchtime_minute.text+":"+stopwatchtime_seconds.text+":"+stopwatchtime_milliseconds.text})
                }

            }

            RoundButton{
                id:laptimeClear
                text: "Clear"
                width:100
                height:50
                font.pointSize: 10
                onClicked: {
                    time=0
                    stopwatchListModel.clear()
                }

            }

        }
    }

}
