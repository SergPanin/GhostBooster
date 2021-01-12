import UM 1.2 as UM
import Cura 1.0 as Cura
import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import QtQuick.Window 2.1

UM.Dialog
{
    id: base

    width: 500 * screenScaleFactor
    height: 160 * screenScaleFactor
    minimumWidth: 500 * screenScaleFactor
    minimumHeight: 150 * screenScaleFactor
    title: "Uploading"
    onClosing: {manager.on_uploading_window_close();}

    Rectangle{
        width: Math.floor(483 * screenScaleFactor)
        anchors.top: parent.top
        anchors.topMargin: 100 * screenScaleFactor
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        color: "#d0d0d0"
                }
    
    
    Label {
        id: lb_uploading_filename
        objectName: "lb_uploading_filename"
        x: Math.floor(11 * screenScaleFactor)
        y: Math.floor(23 * screenScaleFactor)
        height: Math.floor(16 * screenScaleFactor)
        text: "printing_filename.gcode"
        font: UM.Theme.getFont("medium")
    }

    ProgressBar {
        id: pgb_progress
        objectName: "pgb_progress"
        x: Math.floor(11 * screenScaleFactor)
        y: Math.floor(44 * screenScaleFactor)
        width: Math.floor(365 * screenScaleFactor)
        height:Math.floor(6 * screenScaleFactor)
        value: 0
    }

    Button {
        id: btn_cancel
        objectName: "btn_cancel"
        x: Math.floor(394 * screenScaleFactor)
        y: Math.floor(32 * screenScaleFactor)
        width: Math.floor(80 * screenScaleFactor)
        height: Math.floor(30 * screenScaleFactor)
        text: "Cancel"
        onClicked: {manager.cancel_upload();}
    }

    Label {
        id: lb_speed
        objectName: "lb_speed"
        x: Math.floor(11 * screenScaleFactor)
        y: Math.floor(56 * screenScaleFactor)
        height: Math.floor(16 * screenScaleFactor)
        text: "Speed:"
        font: UM.Theme.getFont("medium")
    }

    Label {
        id: lb_remain_time
        objectName: "lb_remain_time"
        x: Math.floor(202 * screenScaleFactor)
        y: Math.floor(56 * screenScaleFactor)
        text: "Remain Time: "
        horizontalAlignment: Text.AlignRight
        font: UM.Theme.getFont("medium")
    }

    CheckBox {
        id: ck_auto_start_print
        objectName: "ck_auto_start_print"
        x: Math.floor(20 * screenScaleFactor)
        y: Math.floor(109 * screenScaleFactor)
        text: "Don't start print after uploading"
    }
}
