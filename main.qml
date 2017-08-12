import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    MouseArea{
        id: marea
        anchors.fill: parent

        onPressed: {
            marea.drag.target = null;
            if(!marea.childAt(marea.mouseX, marea.mouseY).isLocked)
            {
                marea.drag.target = marea.childAt(marea.mouseX, marea.mouseY);
            }
        }

        onMouseXChanged: {
            van.checkPosition();
            tire_front.checkPosition();
            tire_back.checkPosition();
        }

        onMouseYChanged: {
            van.checkPosition();
            tire_front.checkPosition();
            tire_back.checkPosition();
        }

        onReleased: {

//            console.log("van: "+van.x+" : "+van.y)
//            console.log("frt: "+tire_front.x+" : "+tire_front.y)
//            console.log("bck: "+tire_back.x+" : "+tire_back.y)

            tire_back.inRightPlace();
            tire_front.inRightPlace();
            if(tire_back.isInPlace){
                tire_back.isLocked = true;                
//                console.log("locked!");
            }
            if(tire_front.isInPlace){
                tire_front.isLocked = true;
//                console.log("locked!");
            }
            tire_front.checkPosition();
            tire_back.checkPosition();
        }

        CarPart {
            id: tire_back
            source: "./asserts/tire - back.png"
            width: 50
            height: 50
            y: 0
            owner: van
            rightX: 10
            rightY: 175
        }

        CarPart {
            id: van
            source: "./asserts/van - carcass.png"
            y: 150
            width: 200
            height: 200
        }

        CarPart {
            id: tire_front
            source: "./asserts/tire - back.png"
            width: 50
            height: 50
            y: 75
            owner: van
            rightX: 127
            rightY: 175
        }
    }
}
