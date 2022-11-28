import QtQuick 2.15

Rectangle {
    id:mainWindowAnimations
    color:"blue"
    anchors.centerIn: mainwindow
    radius:mainWindowAnimations.width/2

    Rectangle{
        id: innerRect
        width: mainWindowAnimations.width*0.9
        height:mainWindowAnimations.height*0.9
        radius: innerRect.width/2
        anchors.centerIn: parent
        color: mainwindow.color
    }

    gradient: Gradient{
        id: borderGradient
        GradientStop {
            position: 0.000
            color: "red"
        }
        GradientStop {
            position: 0.167
            color: "orange"
        }
        GradientStop {
            position: 0.333
            color: "yellow"
        }
        GradientStop {
            position: 0.500
            color: "green"
        }
        GradientStop {
            position: 0.667
            color: "blue"
        }
        GradientStop {
            position: 0.833
            color: "pink"
        }
        GradientStop {
            position: 1.000
            color: "violet"
        }
    }


    RotationAnimation on rotation{
        from : 0
        to: 360
        duration: 10000
        loops: Animation.Infinite
    }

    ParallelAnimation {

        running: true
        NumberAnimation{
            property: "x"
            from:0
            to: mainwindow.width-mainWindowAnimations.width
            duration: 5000
            loops: Animation.Infinite
            target: animationsView
        }
        NumberAnimation{
            property: "y"
            from:0
            to: mainwindow.height-mainWindowAnimations.height
            duration: 5000
            loops: Animation.Infinite
            target: animationsView
        }

    }

    //    gradient: Gradient{
    //        GradientStop{
    //            position:0.0
    //            SequentialAnimation on color {
    //                loops: Animation.Infinite
    //                ColorAnimation { from: "DeepSkyBlue"; to: "#0E1533"; duration: 5000 }
    //                ColorAnimation { from: "#0E1533"; to: "DeepSkyBlue"; duration: 5000 }
    //            }
    //        }
    //        GradientStop {
    //            position: 1.0
    //            SequentialAnimation on color {
    //                loops: Animation.Infinite
    //                ColorAnimation { from: "SkyBlue"; to: "#437284"; duration: 5000 }
    //                ColorAnimation { from: "#437284"; to: "SkyBlue"; duration: 5000 }
    //            }
    //        }

    //    }



    //    SequentialAnimation {
    //        running: true
    //        NumberAnimation{
    //            property: "x"
    //            from:0
    //            to: mainwindow.width-mainWindowAnimations.width
    //            duration: 5000
    //            loops: Animation.Infinite
    //            target: animationsView
    //        }
    //        NumberAnimation{
    //            property: "y"
    //            from:0
    //            to: mainwindow.height-mainWindowAnimations.height
    //            duration: 5000
    //            loops: Animation.Infinite
    //            target: animationsView
    //        }
    //    }

}
