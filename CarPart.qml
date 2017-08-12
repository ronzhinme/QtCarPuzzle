import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Image{
    Drag.active: marea.drag.active
    Drag.hotSpot.x: 10
    Drag.hotSpot.y: 10

    signal checkPosition

    property bool isLocked: false
    property Item owner: null
    property int rightX: -1
    property int rightY: -1

    property bool isInPlace
    function inRightPlace(){
        if((x >= owner.x + rightX - 10 && x < owner.x + rightX + 10)&&(y >= owner.y + rightY - 10 && y < owner.y + rightY + 10)){
            isInPlace = true
        }
        else isInPlace = false
    }

    onXChanged: {
        checkPosition()
    }
    onYChanged: {
        checkPosition()
    }

    onCheckPosition: {
        if(isLocked && owner){
            x = owner.x + rightX;
            y = owner.y + rightY;
        }
    }
}
