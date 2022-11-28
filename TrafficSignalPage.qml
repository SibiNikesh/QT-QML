import QtQuick 2.15
import QtQuick.Window 2.15
import QtQml 2.15
import QtQuick.Controls 2.15

Rectangle{

    property int t: 0           //Timer property for Traffic Signal

    id:mainwindowtraffic
    anchors.fill: parent

    gradient: Gradient{
        GradientStop {position:0.0 ; color:"#5bccf6"}
        GradientStop {position:1.0 ; color:"white"}
    }

    Rectangle{

        id:trafficwindow
        width:310
        height:120
        color:"black"
        anchors{
            left: countTimer.right
            leftMargin: 50
            verticalCenter: mainwindowtraffic.verticalCenter
        }
        radius: 10

        Rectangle{                             //Red Button Signal Button
            id:redbuttonsignal
            width: 75
            height: 75
            anchors{
                left: trafficwindow.left
                verticalCenter: trafficwindow.verticalCenter
                leftMargin: 30
            }
            radius: width*0.5
            color:"red"
        }

        Rectangle{                          //Yellow Button Signal Button
            id:yellowbuttonsignal
            width: 75
            height: 75
            anchors{
                left: redbuttonsignal.right
                verticalCenter: trafficwindow.verticalCenter
                leftMargin: 15
            }
            radius: width*0.5
            color:"yellow"
        }

        Rectangle{                         //Green Button Signal Button
            id:greenbuttonsignal
            width: 75
            height:75
            anchors{
                left: yellowbuttonsignal.right
                verticalCenter: trafficwindow.verticalCenter
                leftMargin: 15
            }
            radius: width*0.5
            color:"green"
        }

    }

        RoundButton{
            id:trafficsignalplay         //Traffic Signal Play Button
            text: "Play"
            width: 100
            height: 50
            anchors{
                left: trafficwindow.right
                leftMargin: 50
                verticalCenter: mainwindowtraffic.verticalCenter
            }
            onClicked: {
                trafficSignalTimer.triggered()
                trafficSignalTimer.running=true
                trafficsignalplay.opacity=0.2
            }
        }

        RoundButton{
            id:trafficsignalstop         //Traffic Signal stop Button
            text: "Stop"
            width: 100
            height: 50
            anchors{
                left: trafficsignalplay.right
                leftMargin: 50
                verticalCenter: mainwindowtraffic.verticalCenter
            }
            onClicked: {
                trafficSignalTimer.running=false
                redbuttonsignal.opacity=0.2
                yellowbuttonsignal.opacity=0.2
                greenbuttonsignal.opacity=0.2
                timertext.text="sec"
                trafficsignalplay.opacity=1
                t=0
            }
        }

        Timer{
            id:trafficSignalTimer
            interval: 1000
            repeat:true
            running: false
            triggeredOnStart: false
            onTriggered: {
                t++
                if(t<=120){
                    redbuttonsignal.opacity=1
                    yellowbuttonsignal.opacity=0.2
                    greenbuttonsignal.opacity=0.2
                    timertext.text=120-t
                }
                else if(t>120 && t<=125){
                    redbuttonsignal.opacity=0.2
                    yellowbuttonsignal.opacity=1
                    timertext.text=125-t
                }
                else if(t>125 && t<200){
                    yellowbuttonsignal.opacity=0.2
                    greenbuttonsignal.opacity=1
                    timertext.text=200-t
                }
                else if(t>=200 && t<205){
                    greenbuttonsignal.opacity=0.2
                    yellowbuttonsignal.opacity=1
                    timertext.text=205-t
                }
                else{
                    t=0
                    redbuttonsignal.opacity=1
                    greenbuttonsignal.opacity=0.2
                    yellowbuttonsignal.opacity=0.2
                }

            }

        }
    Rectangle{
        id:countTimer
        width:75
        height: 75
        anchors{
            left: mainwindowtraffic.left
            leftMargin: 50
            verticalCenter: mainwindowtraffic.verticalCenter
        }
        color: "black"
        radius: width*0.5
        Text {
            id: timertext
            text: qsTr("sec")
            anchors.centerIn: countTimer
            color: "red"
            font.pointSize: 12
        }
    }

}
