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
            marea.drag.target = marea.childAt(marea.mouseX, marea.mouseY)
        }

        CarPart {
            id: tire_back
            source: "./asserts/tire - back.png"
            width: 50
            height: 50
            y: 0
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
        }
    }
}
