// Copyright (c) 2019 Ultimaker B.V.
// Cura is released under the terms of the LGPLv3 or higher.

import QtQuick 2.4
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.1

import UM 1.2 as UM
import Cura 1.0 as Cura


Rectangle
{
    anchors.fill: parent

    Button{
		id: logo_1
		objectName: "logo_1"
		x: Math.floor(0 * screenScaleFactor)
		y: Math.floor(2 * screenScaleFactor)
		width: Math.floor(60 * screenScaleFactor)
		height: Math.floor(62 * screenScaleFactor)
		style: ButtonStyle {
			background:Rectangle{
				implicitHeight: img_edit_printer_name.height
				implicitWidth:  img_edit_printer_name.width
				color: "transparent" 
				BorderImage{
					anchors.fill: parent
					source: "logo1.png";
				}
			}
		}
	} 

    Label {
        id: jz_ts
        objectName: "JZ-TS"
        x: 4 * screenScaleFactor
        y: 65 * screenScaleFactor
        text: "Loading..."
    }    
}