// Copyright (c) 2019 Ultimaker B.V.
// Cura is released under the terms of the LGPLv3 or higher.

import QtQuick 2.4
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.1

import UM 1.2 as UM
import Cura 1.0 as Cura



Rectangle{
	id: base
	color: UM.Theme.getColor("viewport_overlay")
	anchors.fill: parent
	// This mouse area is to prevent mouse clicks to be passed onto the scene.
	MouseArea{
		anchors.fill: parent
		acceptedButtons: Qt.AllButtons
		onWheel: wheel.accepted = true
	}

	// Disable dropping files into Cura when the monitor page is active
	DropArea{
		anchors.fill: parent
	}

	BorderImage{
		anchors.fill: parent
		source: "background.jpg";
	}	

	Rectangle{
		id: printersPanel
		property int textMargin: Math.round(UM.Theme.getSize("default_margin").width / 2)
		width: Math.floor(230 * screenScaleFactor)
		anchors.top: parent.top
		anchors.topMargin: 0
		anchors.right: parent.right
		anchors.rightMargin: 0
		anchors.bottom: parent.bottom
		SystemPalette{ id: palette }
		SystemPalette{ id: disabledPalette; colorGroup: SystemPalette.Disabled }

		/*color: UM.Theme.getColor("viewport_overlay")*/
		color: "#e0e0e0"

		Label{
			id: printersHeader
			x: Math.floor(10 * screenScaleFactor)
			y: Math.floor(10 * screenScaleFactor)
			text: "Available printers (IP)"
			font: UM.Theme.getFont("large_bold")
			//elide: Text.ElideRight
		}

		Label {
			id: lb_you_printers2
			objectName: "lb_you_printers2"
			x: Math.floor(10 * screenScaleFactor)
			y: Math.floor(37 * screenScaleFactor)
			text: "Click on IP address to select\n"
			font: UM.Theme.getFont("default")
			}
		
		
		ListView {
			id: lv_ip_list
			objectName: "lv_ip_list"
			x: Math.floor(10 * screenScaleFactor)
			y: Math.floor(10 * screenScaleFactor)
			width: parent.width-15 * screenScaleFactor
			anchors.bottom: parent.bottom
			anchors.top: lb_you_printers2.bottom
			anchors.topMargin: printersPanel.textMargin
			anchors.right: parent.right
			anchors.rightMargin: printersPanel.textMargin
			//color: "#A0A0A0"

			delegate: Item {
				width: parent.width
				height: 24 * screenScaleFactor

				Rectangle{
					width: parent.width
					height: removeButton.height
					color: "#e0e0e0"
				}

				Label {
					width: parent.width
					height: removeButton.height
					text: name
					font: UM.Theme.getFont("medium")
				}

				Button {
					id: removeButton
					objectName: "removeButton"
					text: "x"
					width: 20 * screenScaleFactor
					height: 20 * screenScaleFactor
					anchors.right:parent.right
					anchors.rightMargin: 2
					anchors.verticalCenter: parent.verticalCenter
					visible: ip!=""
					onClicked: {
						manager.remove_ip_click(ip);
					}
					style: ButtonStyle{
						label: Item{
							UM.RecolorImage{
								anchors.verticalCenter: parent.verticalCenter
								anchors.horizontalCenter: parent.horizontalCenter
								width: Math.round(control.width / 2.5)
								height: Math.round(control.height / 2.5)
								sourceSize.height: width
								color: palette.text
								source: UM.Theme.getIcon("cross1")
							}
						}
					}
				}

				MouseArea{
					anchors.fill: parent;
					anchors.rightMargin: removeButton.width;
					onClicked:{
						manager.on_ip_list_click(ip);
					}
				}
			}
			model: ListModel {
				id: ipAddrModel
				ListElement {
					name: ""
					ip:""
				}
				ListElement {
					name: ""
					ip:""
				}
				ListElement {
					name: ""
					ip:""
				}
				ListElement {
					name: ""
					ip:""
				}
				ListElement {
					name: ""
					ip:""
				}
				ListElement {
					name: ""
					ip:""
				}
				ListElement {
					name: ""
					ip:""
				}
				ListElement {
					name: ""
					ip:""
				}
				ListElement {
					name: ""
					ip:""
				}
				ListElement {
					name: ""
					ip:""
				}
				ListElement {
					name: ""
					ip:""
				}
				ListElement {
					name: ""
					ip:""
				}
				ListElement {
					name: ""
					ip:""
				}
				ListElement {
					name: ""
					ip:""
				}
				ListElement {
					name: ""
					ip:""
				}
				ListElement {
					name: ""
					ip:""
				}
				ListElement {
					name: ""
					ip:""
				}
				ListElement {
					name: ""
					ip:""
				}
				ListElement {
					name: ""
					ip:""
				}
				ListElement {
					name: ""
					ip:""
				}
			}
		}	
	}

	Rectangle{
		id: basic_settings
		objectName: "basic_settings"
		width: Math.floor(400 * screenScaleFactor)
		anchors.top: parent.top
		anchors.topMargin: 0
		anchors.left: parent.left
		anchors.leftMargin: 0
		anchors.bottom: parent.bottom
		color: "#e0e0e0"

			Rectangle{
			width: Math.floor(60 * screenScaleFactor)
			anchors.top: parent.top
			anchors.topMargin: Math.floor(2 * screenScaleFactor)
			anchors.left: parent.left
			anchors.leftMargin: 0
			anchors.bottom: parent.bottom
			color: "#404040"
		}
	}

	

	Rectangle{
		id: advanced_settings
		objectName: "advanced_settings"
		width: Math.floor(400 * screenScaleFactor)
		anchors.top: parent.top
		anchors.topMargin: 0
		anchors.left: parent.left
		anchors.leftMargin: Math.floor(410 * screenScaleFactor)
		anchors.bottom: parent.bottom
		color: "#e0e0e0"

			Rectangle{
			width: Math.floor(60 * screenScaleFactor)
			anchors.top: parent.top
			anchors.topMargin: Math.floor(2 * screenScaleFactor)
			anchors.left: parent.left
			anchors.leftMargin: 0
			anchors.bottom: parent.bottom
			color: "#404040"
		}
	}



	Rectangle{
		id: tmc_settings
		objectName: "tmc_settings"
		width: Math.floor(400 * screenScaleFactor)
		anchors.top: parent.top
		anchors.topMargin: 0
		anchors.left: parent.left
		anchors.leftMargin: Math.floor(820 * screenScaleFactor)
		anchors.bottom: parent.bottom
		color: "#e0e0e0"
		
			Rectangle{
			width: Math.floor(60 * screenScaleFactor)
			anchors.top: parent.top
			anchors.topMargin: Math.floor(2 * screenScaleFactor)
			anchors.left: parent.left
			anchors.leftMargin: 0
			anchors.bottom: parent.bottom
			color: "#404040"
		}
	}



	Button {
		id: logo_1
		objectName: "logo_1"
		x: Math.floor(0 * screenScaleFactor)
		y: Math.floor(2 * screenScaleFactor)
		width: Math.floor(60 * screenScaleFactor)
		height: Math.floor(62 * screenScaleFactor)
		tooltip: "Selected printer name"
		style: ButtonStyle {
			background:Rectangle{
				implicitHeight: edit_printer_name.height
				implicitWidth:  edit_printer_name.width
				color: "transparent"
				BorderImage{
					anchors.fill: parent
					source: "logo1.png";
				}
			}
		}
	}

	Label {
		id: lb_printer_name
		objectName: "lb_printer_name"
		x: Math.floor(72 * screenScaleFactor)
		y: Math.floor(10 * screenScaleFactor)
		text: "PrinterN"
		font: UM.Theme.getFont("large_bold")
	}

	Button {
		id: edit_printer_name
		objectName: "edit_printer_name"
		x: Math.floor(72 * screenScaleFactor)
		y: Math.floor(37 * screenScaleFactor)
		width: Math.floor(57 * screenScaleFactor)
		height: Math.floor(12 * screenScaleFactor)
		onClicked: { manager.edit_name(); }
		style: ButtonStyle {
			background:Rectangle{
				implicitHeight: edit_printer_name.height
				implicitWidth:  edit_printer_name.width
				color: "transparent"
					Label {
					text: "Edit name"
					font: UM.Theme.getFont("default")
				}
			}
		}
	} 


	Button {
		id: ip_1
		objectName: "ip_1"
		x: Math.floor(0 * screenScaleFactor)
		y: Math.floor(64 * screenScaleFactor)
		width: Math.floor(60 * screenScaleFactor)
		height: Math.floor(62 * screenScaleFactor)
		style: ButtonStyle {
			background:Rectangle{
				implicitHeight: edit_printer_name.height
				implicitWidth:  edit_printer_name.width
				color: "transparent"
				BorderImage{
					anchors.fill: parent
					source: "ip.png";
				}
			}
		}
	}

	TextField {
		id: txt_printer_ip
		objectName: "txt_printer_ip"
		x: Math.floor(72 * screenScaleFactor)
		y: Math.floor(78 * screenScaleFactor)
		width: Math.floor(155 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: ""
		Keys.onReturnPressed: {manager.connect_printer();}
	}

	Button {
		id: btn_connect
		objectName: "btn_connect"
		x: Math.floor(229 * screenScaleFactor)
		y: Math.floor(78 * screenScaleFactor)
		width: Math.floor(155 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "Connect"
		onClicked: {manager.connect_printer();}
	}

	Button {
		id: btn_disconnect
		objectName: "btn_disconnect"
		x: Math.floor(229 * screenScaleFactor)
		y: Math.floor(78 * screenScaleFactor)
		width: Math.floor(155 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "Disconnect"
		onClicked: {manager.disconnect_printer();}
	}

	Label {
		id: lb_printer_state
		objectName: "lb_printer_state"
		x: Math.floor(72 * screenScaleFactor)
		y: Math.floor(108 * screenScaleFactor)
		text: "Not Connected"
		font: UM.Theme.getFont("default")
	}

	Button {
		id: hotend_1
		objectName: "hotend_1"
		x: Math.floor(0 * screenScaleFactor)
		y: Math.floor(126 * screenScaleFactor)
		width: Math.floor(60 * screenScaleFactor)
		height: Math.floor(62 * screenScaleFactor)
		style: ButtonStyle {
			background:Rectangle{
				implicitHeight: edit_printer_name.height
				implicitWidth:  edit_printer_name.width
				color: "transparent"
				BorderImage{
					anchors.fill: parent
					source: "hotend.png";
				}
			}
		}
	}

	Label {
		id: lb_printer_t0
		objectName: "lb_printer_t0"
		x: Math.floor(68 * screenScaleFactor)
		y: Math.floor(144 * screenScaleFactor)
		text: "T0: 0 / 0"
		font: UM.Theme.getFont("medium_bold")
	}

	Button {
		id: btn0_t0
		objectName: "btn0_t0"
		x: Math.floor(134 * screenScaleFactor)
		y: Math.floor(140 * screenScaleFactor)
		width: Math.floor(34 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "Off"
		onClicked: {manager.send_gcode_str("M104 T0 S0\n");}
	}

	Button {
		id: btn200_t0
		objectName: "btn200_t0"
		x: Math.floor(170 * screenScaleFactor)
		y: Math.floor(140 * screenScaleFactor)
		width: Math.floor(34 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "200"
		onClicked: {manager.send_gcode_str("M104 S200\n");}
	}

	Button {
		id: btn210_t0
		objectName: "btn210_t0"
		x: Math.floor(206 * screenScaleFactor)
		y: Math.floor(140 * screenScaleFactor)
		width: Math.floor(34 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "210"
		onClicked: {manager.send_gcode_str("M104 S210\n");}
	}

	Button {
		id: btn220_t0
		objectName: "btn220_t0"
		x: Math.floor(242 * screenScaleFactor)
		y: Math.floor(140 * screenScaleFactor)
		width: Math.floor(34 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "220"
		onClicked: {manager.send_gcode_str("M104 S220\n");}
	}

	Button {
		id: btn230_t0
		objectName: "btn230_t0"
		x: Math.floor(278 * screenScaleFactor)
		y: Math.floor(140 * screenScaleFactor)
		width: Math.floor(34 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "230"
		onClicked: {manager.send_gcode_str("M104 S230\n");}
	}

	Button {
		id: btn240_t0
		objectName: "btn240_t0"
		x: Math.floor(314 * screenScaleFactor)
		y: Math.floor(140 * screenScaleFactor)
		width: Math.floor(34 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "240"
		onClicked: {manager.send_gcode_str("M104 S240\n");}
	}

	Button {
		id: btn250_t0
		objectName: "btn250_t0"
		x: Math.floor(350 * screenScaleFactor)
		y: Math.floor(140 * screenScaleFactor)
		width: Math.floor(34 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "250"
		onClicked: {manager.send_gcode_str("M104 S250\n");}
	}

// -------------Dual Extruder------------------

	Label {
		id: lb_printer_t01
		objectName: "lb_printer_t01"
		x: Math.floor(68 * screenScaleFactor)
		y: Math.floor(130 * screenScaleFactor)
		text: "T0: 0 / 0"
		font: UM.Theme.getFont("medium_bold")
	}

	Label {
		id: lb_printer_t1
		objectName: "lb_printer_t1"
		x: Math.floor(68 * screenScaleFactor)
		y: Math.floor(160 * screenScaleFactor)
		text: "T1: 0 / 0"
		font: UM.Theme.getFont("medium_bold")
	}

	Button {
		id: btn0_t01
		objectName: "btn0_t01"
		x: Math.floor(155 * screenScaleFactor)
		y: Math.floor(126 * screenScaleFactor)
		width: Math.floor(31 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "Off"
		onClicked: {manager.send_gcode_str("M104 T0 S0\n");}
	}

	Button {
		id: btn200_t01
		objectName: "btn200_t01"
		x: Math.floor(188 * screenScaleFactor)
		y: Math.floor(126 * screenScaleFactor)
		width: Math.floor(31 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "200"
		onClicked: {manager.send_gcode_str("M104 T0 S200\n");}
	}

	Button {
		id: btn210_t01
		objectName: "btn210_t01"
		x: Math.floor(221 * screenScaleFactor)
		y: Math.floor(126 * screenScaleFactor)
		width: Math.floor(31 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "210"
		onClicked: {manager.send_gcode_str("M104 T0 S210\n");}
	}

	Button {
		id: btn220_t01
		objectName: "btn220_t01"
		x: Math.floor(254 * screenScaleFactor)
		y: Math.floor(126 * screenScaleFactor)
		width: Math.floor(31 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "220"
		onClicked: {manager.send_gcode_str("M104 T0 S220\n");}
	}

	Button {
		id: btn230_t01
		objectName: "btn230_t01"
		x: Math.floor(287 * screenScaleFactor)
		y: Math.floor(126 * screenScaleFactor)
		width: Math.floor(31 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "230"
		onClicked: {manager.send_gcode_str("M104 T0 S230\n");}
	}

	Button {
		id: btn240_t01
		objectName: "btn240_t01"
		x: Math.floor(320 * screenScaleFactor)
		y: Math.floor(126 * screenScaleFactor)
		width: Math.floor(31 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "240"
		onClicked: {manager.send_gcode_str("M104 T0 S240\n");}
	}

	Button {
		id: btn250_t01
		objectName: "btn250_t01"
		x: Math.floor(353 * screenScaleFactor)
		y: Math.floor(126 * screenScaleFactor)
		width: Math.floor(31 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "250"
		onClicked: {manager.send_gcode_str("M104 T0 S250\n");}
	}

	Button {
		id: btn0_t0_2
		objectName: "btn0_t2"
		x: Math.floor(155 * screenScaleFactor)
		y: Math.floor(156 * screenScaleFactor)
		width: Math.floor(31 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "Off"
		onClicked: {manager.send_gcode_str("M104 T1 S0\n");}
	}

	Button {
		id: btn200_t2
		objectName: "btn200_t2"
		x: Math.floor(188 * screenScaleFactor)
		y: Math.floor(156 * screenScaleFactor)
		width: Math.floor(31 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "200"
		onClicked: {manager.send_gcode_str("M104 T1 S200\n");}
	}

	Button {
		id: btn210_t2
		objectName: "btn210_t2"
		x: Math.floor(221 * screenScaleFactor)
		y: Math.floor(156 * screenScaleFactor)
		width: Math.floor(31 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "210"
		onClicked: {manager.send_gcode_str("M104 T1 S210\n");}
	}

	Button {
		id: btn220_t2
		objectName: "btn220_t2"
		x: Math.floor(254 * screenScaleFactor)
		y: Math.floor(156 * screenScaleFactor)
		width: Math.floor(31 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "220"
		onClicked: {manager.send_gcode_str("M104 T1 S220\n");}
	}

	Button {
		id: btn230_t2
		objectName: "btn230_t2"
		x: Math.floor(287 * screenScaleFactor)
		y: Math.floor(156 * screenScaleFactor)
		width: Math.floor(31 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "230"
		onClicked: {manager.send_gcode_str("M104 T1 S230\n");}
	}

	Button {
		id: btn240_t2
		objectName: "btn240_t2"
		x: Math.floor(320 * screenScaleFactor)
		y: Math.floor(156 * screenScaleFactor)
		width: Math.floor(31 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "240"
		onClicked: {manager.send_gcode_str("M104 T1 S240\n");}
	}

	Button {
		id: btn250_t2
		objectName: "btn250_t2"
		x: Math.floor(353 * screenScaleFactor)
		y: Math.floor(156 * screenScaleFactor)
		width: Math.floor(31 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "250"
		onClicked: {manager.send_gcode_str("M104 T1 S250\n");}
	}
// -------------Dual Extruder ending------------------



	Button {
		id: hotbed_1
		objectName: "hotbed_1"
		x: Math.floor(0 * screenScaleFactor)
		y: Math.floor(188 * screenScaleFactor)
		width: Math.floor(60 * screenScaleFactor)
		height: Math.floor(62 * screenScaleFactor)
		style: ButtonStyle {
			background:Rectangle{
				implicitHeight: edit_printer_name.height
				implicitWidth:  edit_printer_name.width
				color: "transparent"
				BorderImage{
					anchors.fill: parent
					source: "bed.png";
				}
			}
		}
	}

	Label {
		id: lb_printer_bed
		objectName: "lb_printer_bed"
		x: Math.floor(68 * screenScaleFactor)
		y: Math.floor(206 * screenScaleFactor)
		text: "Bed: 0 / 0"
		font: UM.Theme.getFont("medium_bold")
	}

	Button {
		id: btn0_bed
		objectName: "btn0_bed"
		x: Math.floor(134 * screenScaleFactor)
		y: Math.floor(202 * screenScaleFactor)
		width: Math.floor(34 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "Off"
		onClicked: {manager.send_gcode_str("M140 S0\n");}
	}

	Button {
		id: btn60_bed
		objectName: "btn60_bed"
		x: Math.floor(170 * screenScaleFactor)
		y: Math.floor(202 * screenScaleFactor)
		width: Math.floor(34 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "60"
		onClicked: {manager.send_gcode_str("M140 S60\n");}
	}

	Button {
		id: btn70_bed
		objectName: "btn70_bed"
		x: Math.floor(206 * screenScaleFactor)
		y: Math.floor(202 * screenScaleFactor)
		width: Math.floor(34 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "70"
		onClicked: {manager.send_gcode_str("M140 S70\n");}
	}

	Button {
		id: btn80_bed
		objectName: "btn80_bed"
		x: Math.floor(242 * screenScaleFactor)
		y: Math.floor(202 * screenScaleFactor)
		width: Math.floor(34 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "80"
		onClicked: {manager.send_gcode_str("M140 S80\n");}
	}

	Button {
		id: btn90_bed
		objectName: "btn90_bed"
		x: Math.floor(278 * screenScaleFactor)
		y: Math.floor(202 * screenScaleFactor)
		width: Math.floor(34 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "90"
		onClicked: {manager.send_gcode_str("M140 S90\n");}
	}

	Button {
		id: btn100_bed
		objectName: "btn100_bed"
		x: Math.floor(314 * screenScaleFactor)
		y: Math.floor(202 * screenScaleFactor)
		width: Math.floor(34 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "100"
		onClicked: {manager.send_gcode_str("M140 S100\n");}
	}

	Button {
		id: btn110_bed
		objectName: "btn110_bed"
		x: Math.floor(350 * screenScaleFactor)
		y: Math.floor(202 * screenScaleFactor)
		width: Math.floor(34 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "110"
		onClicked: {manager.send_gcode_str("M140 S110\n");}
	}

	Button {
		id: sd_1
		objectName: "sd_1"
		x: Math.floor(0 * screenScaleFactor)
		y: Math.floor(250 * screenScaleFactor)
		width: Math.floor(60 * screenScaleFactor)
		height: Math.floor(62 * screenScaleFactor)
		style: ButtonStyle {
			background:Rectangle{
				implicitHeight: edit_printer_name.height
				implicitWidth:  edit_printer_name.width
				color: "transparent"
				BorderImage{
					anchors.fill: parent
					source: "sd.png";
				}
			}
		}
	}

	Button {
		id: btn_sd
		objectName: "btn_sd"
		x: Math.floor(72 * screenScaleFactor)
		y: Math.floor(264 * screenScaleFactor)
		width: Math.floor(101 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "Print from media"
		onClicked: {manager.show_sd();}
	}

	Button {
		id: btn_upload_sd
		objectName: "btn_upload_sd"
		x: Math.floor(178 * screenScaleFactor)
		y: Math.floor(264 * screenScaleFactor)
		width: Math.floor(101 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "Upload to SD"
		onClicked: {manager.show_upload_sd();}
	}
	Button {
		id: btn_upload_usb
		objectName: "btn_upload_usb"
		x: Math.floor(284 * screenScaleFactor)
		y: Math.floor(264 * screenScaleFactor)
		width: Math.floor(101 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "Upload to USB"
		onClicked: {manager.show_upload_usb();}
	}
	

	Button {
		id: progress_1
		objectName: "progress_1"
		x: Math.floor(0 * screenScaleFactor)
		y: Math.floor(312 * screenScaleFactor)
		width: Math.floor(60 * screenScaleFactor)
		height: Math.floor(62 * screenScaleFactor)
		style: ButtonStyle {
			background:Rectangle{
				implicitHeight: edit_printer_name.height
				implicitWidth:  edit_printer_name.width
				color: "transparent"
				BorderImage{
					anchors.fill: parent
					source: "progress.png";
				}
			}
		}
	}

	Button {
		id: pid_1
		objectName: "pid_1"
		x: Math.floor(0 * screenScaleFactor)
		y: Math.floor(498 * screenScaleFactor)
		width: Math.floor(60 * screenScaleFactor)
		height: Math.floor(62 * screenScaleFactor)
		style: ButtonStyle {
			background:Rectangle{
				implicitHeight: edit_printer_name.height
				implicitWidth:  edit_printer_name.width
				color: "transparent"
				BorderImage{
					anchors.fill: parent
					source: "pid.png";
				}
			}
		}
	}

	Button {
		id: btn_send_pid_pla_cmd
		objectName: "btn_send_pid_pla_cmd"
		x: Math.floor(72 * screenScaleFactor)
		y: Math.floor(498 * screenScaleFactor)
		width: Math.floor(155 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "Extruder PLA"
		onClicked: {manager.btn_send_pid_pla_cmd();}
	}

	Button {
		id: btn_send_pid_abs_cmd
		objectName: "btn_send_pid_abs_cmd"
		x: Math.floor(72 * screenScaleFactor)
		y: Math.floor(525 * screenScaleFactor)
		width: Math.floor(155 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "Extruder ABS"
		onClicked: {manager.btn_send_pid_abs_cmd();}
	}

	Button {
		id: btn_send_pid_bed_pla_cmd
		objectName: "btn_send_pid_bed_pla_cmd"
		x: Math.floor(229 * screenScaleFactor)
		y: Math.floor(498 * screenScaleFactor)
		width: Math.floor(155 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "Bed PLA"
		onClicked: {manager.btn_send_pid_bed_pla_cmd();}
	}

	Button {
		id: btn_send_pid_bed_abs_cmd
		objectName: "btn_send_pid_bed_abs_cmd"
		x: Math.floor(229 * screenScaleFactor)
		y: Math.floor(525 * screenScaleFactor)
		width: Math.floor(155 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "Bed ABS"
		onClicked: {manager.btn_send_pid_bed_abs_cmd();}
	}

	Label {
		id: lb_pid
		objectName: "lb_pid"
		x: Math.floor(72 * screenScaleFactor)
		y: Math.floor(553 * screenScaleFactor)
		text: "Wait for the printhead to come home (5-7 minutes)"
		font: UM.Theme.getFont("default")
	}

	Button {
		id: replace_1
		objectName: "replace_1"
		x: Math.floor(0 * screenScaleFactor)
		y: Math.floor(374 * screenScaleFactor)
		width: Math.floor(60 * screenScaleFactor)
		height: Math.floor(124 * screenScaleFactor)
		style: ButtonStyle {
			background:Rectangle{
				implicitHeight: edit_printer_name.height
				implicitWidth:  edit_printer_name.width
				color: "transparent"
				BorderImage{
					anchors.fill: parent
					source: "replace.png";
				}
			}
		}
	}

	Button {
		id: btn_send_load_cmd
		objectName: "btn_send_load_cmd"
		x: Math.floor(72 * screenScaleFactor)
		y: Math.floor(384 * screenScaleFactor)
		width: Math.floor(101 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "Load"
		onClicked: {manager.btn_send_load_cmd();}
	}

	Button {
		id: btn_send_pull_cmd
		objectName: "btn_send_pull_cmd"
		x: Math.floor(178 * screenScaleFactor)
		y: Math.floor(384 * screenScaleFactor)
		width: Math.floor(101 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "Unload"
		onClicked: {manager.btn_send_pull_cmd();}
	}

	Button {
		id: btn_send_coldpull_cmd
		objectName: "btn_send_coldpull_cmd"
		x: Math.floor(284 * screenScaleFactor)
		y: Math.floor(384 * screenScaleFactor)
		width: Math.floor(101 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "Cold pull"
		onClicked: {manager.btn_send_coldpull_cmd();}
	}

	Label {
		id: lb_replace
		objectName: "lb_replace"
		x: Math.floor(72 * screenScaleFactor)
		y: Math.floor(416 * screenScaleFactor)
		text: "Wait for the printhead to come home (1-2 minutes) \nUse PLA filament for cold pull cleaning"
		font: UM.Theme.getFont("default")
	}

	Button {
		id: sub300
		objectName: "sub300"
		x: Math.floor(72 * screenScaleFactor)
		y: Math.floor(448 * screenScaleFactor)
		width: Math.floor(37 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "-300"
		onClicked: {manager.send_gcode_str("G92 E0\n G1 E-300 F8000");}
	}

	Button {
		id: sub100
		objectName: "sub100"
		x: Math.floor(110 * screenScaleFactor)
		y: Math.floor(448 * screenScaleFactor)
		width: Math.floor(37 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "-100"
		onClicked: {manager.send_gcode_str("G92 E0\n G1 E-100 F4000");}
	}

	Button {
		id: sub50
		objectName: "sub50"
		x: Math.floor(148 * screenScaleFactor)
		y: Math.floor(448 * screenScaleFactor)
		width: Math.floor(31 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "-50"
		onClicked: {manager.send_gcode_str("G92 E0\n G1 E-50 F1000");}
	}

	Button {
		id: sub10
		objectName: "sub10"
		x: Math.floor(180 * screenScaleFactor)
		y: Math.floor(448 * screenScaleFactor)
		width: Math.floor(31 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "-10"
		onClicked: {manager.send_gcode_str("G92 E0\n G1 E-10 F500");}
	}

	Button {
		id: motor_off
		objectName: "motor_off"
		x: Math.floor(212 * screenScaleFactor)
		y: Math.floor(448 * screenScaleFactor)
		width: Math.floor(31 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		onClicked: {manager.send_gcode_str("M18 E\n");}
		text: "Off"
		tooltip: "Stepper motor off"
	}

	Button {
		id: add10
		objectName: "add10"
		x: Math.floor(245 * screenScaleFactor)
		y: Math.floor(448 * screenScaleFactor)
		width: Math.floor(31 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "+10"
		onClicked: {manager.send_gcode_str("G92 E0\n G1 E10 F500");}
	}

	Button {
		id: add50
		objectName: "add50"
		x: Math.floor(277 * screenScaleFactor)
		y: Math.floor(448 * screenScaleFactor)
		width: Math.floor(31 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "+50"
		onClicked: {manager.send_gcode_str("G92 E0\n G1 E50 F1000");}
	}

	Button {
		id: add100
		objectName: "add100"
		x: Math.floor(309 * screenScaleFactor)
		y: Math.floor(448 * screenScaleFactor)
		width: Math.floor(37 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "+100"
		onClicked: {manager.send_gcode_str("G92 E0\n G1 E100 F4000");}
	}

	Button {
		id: add300
		objectName: "add300"
		x: Math.floor(347 * screenScaleFactor)
		y: Math.floor(448 * screenScaleFactor)
		width: Math.floor(37 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "+300"
		onClicked: {manager.send_gcode_str("G92 E0\n G1 E300 F8000");}
	}

	Label {
		id: lb_extrude
		objectName: "lb_extrude"
		x: Math.floor(72 * screenScaleFactor)
		y: Math.floor(480 * screenScaleFactor)
		text: "Wait for hotend warm-up for use"
		font: UM.Theme.getFont("default")
	}

	Button {
		id: scripts_1
		objectName: "scripts_1"
		x: Math.floor(0 * screenScaleFactor)
		y: Math.floor(560 * screenScaleFactor)
		width: Math.floor(60 * screenScaleFactor)
		height: Math.floor(62 * screenScaleFactor)
		style: ButtonStyle {
			background:Rectangle{
				implicitHeight: edit_printer_name.height
				implicitWidth:  edit_printer_name.width
				color: "transparent"
				BorderImage{
					anchors.fill: parent
					source: "scripts.png";
				}
			}
		}
	}

	Button {
		id:  btn_send_users_1_cmd
		objectName: "btn_send_users_1_cmd"
		x: Math.floor(72 * screenScaleFactor)
		y: Math.floor(574 * screenScaleFactor)
		width: Math.floor(101 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "User's 1"
		onClicked: {manager.btn_send_users_1_cmd();}
	}

	Button {
		id: btn_send_users_2_cmd
		objectName: "btn_send_users_2_cmd"
		x: Math.floor(178 * screenScaleFactor)
		y: Math.floor(574 * screenScaleFactor)
		width: Math.floor(101 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "User's 2"
		onClicked: {manager.btn_send_users_2_cmd();}
	}

	Button {
		id: btn_send_users_3_cmd
		objectName: "btn_send_users_3_cmd"
		x: Math.floor(284 * screenScaleFactor)
		y: Math.floor(574 * screenScaleFactor)
		width: Math.floor(101 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "User's 3"
		onClicked: {manager.btn_send_users_3_cmd();}
	}

	Label {
		id: users_note
		objectName: "users_note"
		x: Math.floor(72 * screenScaleFactor)
		y: Math.floor(606 * screenScaleFactor)
		text: "Use this buttons for your own needs"
		font: UM.Theme.getFont("default")
	}	

	Button {
		id: clear_1
		objectName: "clear_1"
		x: Math.floor(820 * screenScaleFactor)
		y: Math.floor(436 * screenScaleFactor)
		width: Math.floor(60 * screenScaleFactor)
		height: Math.floor(124 * screenScaleFactor)
		style: ButtonStyle {
			background:Rectangle{
				implicitHeight: edit_printer_name.height
				implicitWidth:  edit_printer_name.width
				color: "transparent"
				BorderImage{
					anchors.fill: parent
					source: "clear.png";
				}
			}
		}
	}

	Button {
		id: telegram_1
		objectName: "telegram_1"
		x: Math.floor(820 * screenScaleFactor)
		y: Math.floor(560 * screenScaleFactor)
		width: Math.floor(60 * screenScaleFactor)
		height: Math.floor(62 * screenScaleFactor)
		style: ButtonStyle {
			background:Rectangle{
				implicitHeight: edit_printer_name.height
				implicitWidth:  edit_printer_name.width
				color: "transparent"
				BorderImage{
					anchors.fill: parent
					source: "telegram.png";
				}
			}
		}
	}

	Button {
		id: btn_telegram
		objectName: "btn_telegram"
		x: Math.floor(892 * screenScaleFactor)
		y: Math.floor(574 * screenScaleFactor)
		width: Math.floor(155 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "t.me/ghost4plugin"
		onClicked: {manager.btn_telegram();}
	}

	Label {
		id: lb_telegram2
		objectName: "lb_telegram2"
		x: Math.floor(892 * screenScaleFactor)
		y: Math.floor(606 * screenScaleFactor)
		text: "Communication with the developers"
		font: UM.Theme.getFont("default")
	}

	Label {
		id: lb_release
		objectName: "lb_release"
		x: Math.floor(892 * screenScaleFactor)
		y: Math.floor(634 * screenScaleFactor)
		text: "GhostBooster plugin for Cura v 0.41 \n21.12.2020"
		font: UM.Theme.getFont("default")
	}

	Label {
		id: lb_activate
		objectName: "lb_activate"
		x: Math.floor(482 * screenScaleFactor)
		y: Math.floor(570 * screenScaleFactor)
		text: "To activate all the features (Linear Advance, Junction\nDeviation, PID Bed Autotune, TMC Settings) of the\nprogram you need to make changes in the firmware\nand hardware of your printer.\nPowered by Marlin Gcodes."
		font: UM.Theme.getFont("default")
	}

	Label {
		id: lb_printing
		objectName: "lb_printing"
		x: Math.floor(72 * screenScaleFactor)
		y: Math.floor(310 * screenScaleFactor)
		text: "Printing"
		font: UM.Theme.getFont("medium_bold")
	}

	Label {
		id: lb_printing_filename
		objectName: "lb_printing_filename"
		x: Math.floor(125 * screenScaleFactor)
		y: Math.floor(310 * screenScaleFactor)
		height: Math.floor(16 * screenScaleFactor)
		text: "printing_filename.gcode"
		font: UM.Theme.getFont("medium_bold")
	}

	ProgressBar {
		id: pgb_printing_progress
		objectName: "pgb_printing_progress"
		x: Math.floor(72 * screenScaleFactor)
		y: Math.floor(333 * screenScaleFactor)
		height: Math.floor(6 * screenScaleFactor)
		width: Math.floor(270 * screenScaleFactor)
		value: 0.5
	}

	Label {
		id: lb_printing_progress
		objectName: "lb_printing_progress"
		x: Math.floor(346 * screenScaleFactor)
		y: Math.floor(326 * screenScaleFactor)
		text: "50%"
		font: UM.Theme.getFont("medium_bold")
	}

	Button {
		id: btn_pause
		objectName: "btn_pause"
		x: Math.floor(72 * screenScaleFactor)
		y: Math.floor(343 * screenScaleFactor)
		width: Math.floor(101 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "Pause"
		onClicked: {manager.printing_task_pause();}
	}

	Button {
		id: btn_resume
		objectName: "btn_resume"
		x: Math.floor(72 * screenScaleFactor)
		y: Math.floor(343 * screenScaleFactor)
		width: Math.floor(101 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "Resume"
		onClicked: {manager.printing_task_resume();}
	}

	Button {
		id: btn_stop
		objectName: "btn_stop"
		x: Math.floor(178 * screenScaleFactor)
		y: Math.floor(343 * screenScaleFactor)
		width: Math.floor(101 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "Stop"
		onClicked: {manager.printing_task_stop();}
	}

	Button {
		id: expert_1
		objectName: "expert_1"
		x: Math.floor(410 * screenScaleFactor)
		y: Math.floor(2 * screenScaleFactor)
		width: Math.floor(60 * screenScaleFactor)
		height: Math.floor(62 * screenScaleFactor)
		style: ButtonStyle {
			background:Rectangle{
				implicitHeight: edit_printer_name.height
				implicitWidth:  edit_printer_name.width
				color: "transparent"
				BorderImage{
					anchors.fill: parent
					source: "expert.png";
				}
			}
		}
	}

	Label {
		id: lb_expert_settings
		objectName: "lb_expert_settings"
		x: Math.floor(482 * screenScaleFactor)
		y: Math.floor(10 * screenScaleFactor)
		text: "Expert settings"
		font: UM.Theme.getFont("large_bold")
	}

	Label {
		id: lb_expert_settings2
		objectName: "lb_expert_settings2"
		x: Math.floor(482 * screenScaleFactor)
		y: Math.floor(37 * screenScaleFactor)
		text: "For tuning and bug fixing"
		font: UM.Theme.getFont("default")
	}

	Button {
		id: gcode_1
		objectName: "gcode_1"
		x: Math.floor(410 * screenScaleFactor)
		y: Math.floor(64 * screenScaleFactor)
		width: Math.floor(60 * screenScaleFactor)
		height: Math.floor(62 * screenScaleFactor)
		style: ButtonStyle {
			background:Rectangle{
				implicitHeight: edit_printer_name.height
				implicitWidth:  edit_printer_name.width
				color: "transparent"
				BorderImage{
					anchors.fill: parent
					source: "gcode.png";
				}
			}
		}
	}

	TextField {
		id: txt_gcode
		objectName: "txt_gcode"
		x: Math.floor(482 * screenScaleFactor)
		y: Math.floor(78 * screenScaleFactor)
		width: Math.floor(230 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: ""
		font.capitalization: Font.AllUppercase
		Keys.onReturnPressed: {manager.send_gcode();}
	}

	Button {
		id: btn_send
		objectName: "btn_send"
		x: Math.floor(715 * screenScaleFactor)
		y: Math.floor(78 * screenScaleFactor)
		width: Math.floor(80 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "Send"
		onClicked: {manager.send_gcode();}
	}

	Button {
		id: btn_gcode_help
		objectName: "btn_gcode_help"
		x: Math.floor(482 * screenScaleFactor)
		y: Math.floor(110 * screenScaleFactor)
		width: Math.floor(68 * screenScaleFactor)
		height: Math.floor(12 * screenScaleFactor)
		onClicked: {manager.btn_gcode_help();}
		style: ButtonStyle {
			background:Rectangle{
				implicitHeight: btn_gcode_help.height
				implicitWidth:  btn_gcode_help.width
				color: "transparent"
				Label {
					text: "Learn more..."
					font: UM.Theme.getFont("default_bold")
				}
			}
		}
	}

	Button {
		id: selector_1
		objectName: "selector_1"
		x: Math.floor(410 * screenScaleFactor)
		y: Math.floor(126 * screenScaleFactor)
		width: Math.floor(60 * screenScaleFactor)
		height: Math.floor(62 * screenScaleFactor)
		style: ButtonStyle {
			background:Rectangle{
				implicitHeight: edit_printer_name.height
				implicitWidth:  edit_printer_name.width
				color: "transparent"
				BorderImage{
					anchors.fill: parent
					source: "selector.png";
				}
			}
		}
	}

	Label {
		id: lb_silent
		objectName: "lb_silent"
		x: Math.floor(482 * screenScaleFactor)
		y: Math.floor(167 * screenScaleFactor)
		text: "Silent printing"
		font: UM.Theme.getFont("default")
	}

	Button {
		id: btn_night
		objectName: "btn_night"
		x: Math.floor(482 * screenScaleFactor)
		y: Math.floor(136 * screenScaleFactor)
		width: Math.floor(101 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "Night mode"
		onClicked: {manager.send_gcode_str("M203 X40.00 Y40.00 Z10.00 E60.00\n M201 X500.00 Y500.00 Z100.00 E10000.00\n M205 B20000.00 S0.00 T0.00 X10.00 Y10.00 Z0.30 E5.00\n");}
	}

	Label {
		id: lb_default
		objectName: "lb_default"
		x: Math.floor(588 * screenScaleFactor)
		y: Math.floor(167 * screenScaleFactor)
		text: "Default printing"
		font: UM.Theme.getFont("default")
	}

	Button {
		id: btn_normal
		objectName: "btn_normal"
		x: Math.floor(588 * screenScaleFactor)
		y: Math.floor(136 * screenScaleFactor)
		width: Math.floor(101 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "Normal"
		onClicked: {manager.send_gcode_str("M501\n");}
	}

	Label {
		id: lb_nolimits
		objectName: "lb_nolimits"
		x: Math.floor(694 * screenScaleFactor)
		y: Math.floor(167 * screenScaleFactor)
		text: "Like a rocket"
		font: UM.Theme.getFont("default")
	}

	Button {
		id: btn_boost
		objectName: "btn_boost"
		x: Math.floor(694 * screenScaleFactor)
		y: Math.floor(136 * screenScaleFactor)
		width: Math.floor(101 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "Boost mode"
		onClicked: {manager.send_gcode_str("M203 X200.00 Y200.00 Z10.00 E100.00\n M201 X5000.00 Y5000.00 Z100.00 E10000.00\n M205 B20000.00 S0.00 T0.00 X30.00 Y30.00 Z0.30 E10.00\n");}
	}


	Button {
		id: fun_1
		objectName: "fun_1"
		x: Math.floor(410 * screenScaleFactor)
		y: Math.floor(188 * screenScaleFactor)
		width: Math.floor(60 * screenScaleFactor)
		height: Math.floor(62 * screenScaleFactor)
		style: ButtonStyle {
			background:Rectangle{
				implicitHeight: edit_printer_name.height
				implicitWidth:  edit_printer_name.width
				color: "transparent"
				BorderImage{
					anchors.fill: parent
					source: "fun.png";
				}
			}
		}
	}

	Label {
		id: lb_fun
		objectName: "lb_fun"
		x: Math.floor(482 * screenScaleFactor)
		y: Math.floor(229 * screenScaleFactor)
		text: "The speed at which the print cooling fans spin"
		font: UM.Theme.getFont("default")
	}

	Button {
		id: btn_fun_off
		objectName: "btn_fun_off"
		x: Math.floor(482 * screenScaleFactor)
		y: Math.floor(198 * screenScaleFactor)
		width: Math.floor(34 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "Off"
		onClicked: {manager.send_gcode_str("M106 S0\n");}
	}

	Button {
		id: btn_fun_30
		objectName: "btn_fun_30"
		x: Math.floor(517 * screenScaleFactor)
		y: Math.floor(198 * screenScaleFactor)
		width: Math.floor(34 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "30%"
		onClicked: {manager.send_gcode_str("M106 S77\n");}
	}

	Button {
		id: btn_fun_40
		objectName: "btn_fun_40"
		x: Math.floor(552 * screenScaleFactor)
		y: Math.floor(198 * screenScaleFactor)
		width: Math.floor(34 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "40%"
		onClicked: {manager.send_gcode_str("M106 S102\n");}
	}

	Button {
		id: btn_fun_50
		objectName: "btn_fun_50"
		x: Math.floor(587 * screenScaleFactor)
		y: Math.floor(198 * screenScaleFactor)
		width: Math.floor(34 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "50%"
		onClicked: {manager.send_gcode_str("M106 S128\n");}
	}

	Button {
		id: btn_fun_60
		objectName: "btn_fun_60"
		x: Math.floor(622 * screenScaleFactor)
		y: Math.floor(198 * screenScaleFactor)
		width: Math.floor(34 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "60%"
		tooltip: "Скорость вентилятора \nобдува модели \n____________________\nGcode: M106 S153"
		onClicked: {manager.send_gcode_str("M106 S153\n");}
	}

	Button {
		id: btn_fun_70
		objectName: "btn_fun_70"
		x: Math.floor(657 * screenScaleFactor)
		y: Math.floor(198 * screenScaleFactor)
		width: Math.floor(34 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "70%"
		onClicked: {manager.send_gcode_str("M106 S179\n");}
	}

	Button {
		id: btn_fun_80
		objectName: "btn_fun_80"
		x: Math.floor(692 * screenScaleFactor)
		y: Math.floor(198 * screenScaleFactor)
		width: Math.floor(34 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "80%"
		onClicked: {manager.send_gcode_str("M106 S204\n");}
	}

	Button {
		id: btn_fun_90
		objectName: "btn_fun_90"
		x: Math.floor(727 * screenScaleFactor)
		y: Math.floor(198 * screenScaleFactor)
		width: Math.floor(34 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "90%"
		onClicked: {manager.send_gcode_str("M106 S230\n");}
	}

	Button {
		id: btn_fun_100
		objectName: "btn_fun_100"
		x: Math.floor(762 * screenScaleFactor)
		y: Math.floor(198 * screenScaleFactor)
		width: Math.floor(34 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "100%"
		onClicked: {manager.send_gcode_str("M106 S255\n");}
	}

	Button {
		id: la_1
		objectName: "la_1"
		x: Math.floor(410 * screenScaleFactor)
		y: Math.floor(250 * screenScaleFactor)
		width: Math.floor(60 * screenScaleFactor)
		height: Math.floor(62 * screenScaleFactor)
		style: ButtonStyle {
			background:Rectangle{
				implicitHeight: edit_printer_name.height
				implicitWidth:  edit_printer_name.width
				color: "transparent"
				BorderImage{
					anchors.fill: parent
					source: "la.png";
				}
			}
		}
	}

	Button {
		id: la_off
		objectName: "la_off"
		x: Math.floor(482 * screenScaleFactor)
		y: Math.floor(264 * screenScaleFactor)
		width: Math.floor(33 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "Off"
		onClicked: {manager.send_gcode_str("M900 K0\n");}
	}

	Button {
		id: la_02
		objectName: "la_02"
		x: Math.floor(517 * screenScaleFactor)
		y: Math.floor(264 * screenScaleFactor)
		width: Math.floor(26 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: ".04"
		onClicked: {manager.send_gcode_str("M900 K0.04\n");}
	}

	Button {
		id: la_04
		objectName: "la_04"
		x: Math.floor(545 * screenScaleFactor)
		y: Math.floor(264 * screenScaleFactor)
		width: Math.floor(26 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: ".06"
		onClicked: {manager.send_gcode_str("M900 K0.06\n");}
	}

	Button {
		id: la_06
		objectName: "la_06"
		x: Math.floor(573 * screenScaleFactor)
		y: Math.floor(264 * screenScaleFactor)
		width: Math.floor(26 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: ".08"
		onClicked: {manager.send_gcode_str("M900 K0.08\n");}
	}

	Button {
		id: la_08
		objectName: "la_08"
		x: Math.floor(601 * screenScaleFactor)
		y: Math.floor(264 * screenScaleFactor)
		width: Math.floor(26 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "0.1"
		onClicked: {manager.send_gcode_str("M900 K0.1\n");}
	}

	Button {
		id: la_10
		objectName: "la_10"
		x: Math.floor(629 * screenScaleFactor)
		y: Math.floor(264 * screenScaleFactor)
		width: Math.floor(26 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "0.2"
		onClicked: {manager.send_gcode_str("M900 K0.2\n");}
	}

	Button {
		id: la_12
		objectName: "la_12"
		x: Math.floor(657 * screenScaleFactor)
		y: Math.floor(264 * screenScaleFactor)
		width: Math.floor(26 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "0.3"
		onClicked: {manager.send_gcode_str("M900 K0.3\n");}
	}

	Button {
		id: la_14
		objectName: "la_14"
		x: Math.floor(685 * screenScaleFactor)
		y: Math.floor(264 * screenScaleFactor)
		width: Math.floor(26 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "0.4"
		onClicked: {manager.send_gcode_str("M900 K0.4\n");}
	}

	Button {
		id: la_16
		objectName: "la_16"
		x: Math.floor(713 * screenScaleFactor)
		y: Math.floor(264 * screenScaleFactor)
		width: Math.floor(26 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "0.5"
		onClicked: {manager.send_gcode_str("M900 K0.5\n");}
	}

	Button {
		id: la_18
		objectName: "la_18"
		x: Math.floor(741 * screenScaleFactor)
		y: Math.floor(264 * screenScaleFactor)
		width: Math.floor(26 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "0.6"
		onClicked: {manager.send_gcode_str("M900 K0.6\n");}
	}

	Button {
		id: la_20
		objectName: "la_20"
		x: Math.floor(769 * screenScaleFactor)
		y: Math.floor(264 * screenScaleFactor)
		width: Math.floor(26 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "0.7"
		onClicked: {manager.send_gcode_str("M900 K0.7\n");}
	}

	Button {
		id: btn_linear_help
		objectName: "btn_linear_help"
		x: Math.floor(482 * screenScaleFactor)
		y: Math.floor(296 * screenScaleFactor)
		width: Math.floor(68 * screenScaleFactor)
		height: Math.floor(12 * screenScaleFactor)
		onClicked: {manager.btn_linear_help();}
		style: ButtonStyle {
			background:Rectangle{
				implicitHeight: btn_linear_help.height
				implicitWidth:  btn_linear_help.width
				color: "transparent"
				Label {
					text: "Learn more..."
					font: UM.Theme.getFont("default_bold")
				}
			}
		}
	}

	Button {
		id: speed_1
		objectName: "speed_1"
		x: Math.floor(410 * screenScaleFactor)
		y: Math.floor(312 * screenScaleFactor)
		width: Math.floor(60 * screenScaleFactor)
		height: Math.floor(62 * screenScaleFactor)
		style: ButtonStyle {
			background:Rectangle{
				implicitHeight: edit_printer_name.height
				implicitWidth:  edit_printer_name.width
				color: "transparent"
				BorderImage{
					anchors.fill: parent
					source: "speed.png";
				}
			}
		}
	}

	Label {
		id: lb_speed
		objectName: "lb_speed"
		x: Math.floor(482 * screenScaleFactor)
		y: Math.floor(353 * screenScaleFactor)
		text: "Set XY max feedrate (mm/s)"
		font: UM.Theme.getFont("default")
	}

	Button {
		id: btn_speed_10
		objectName: "btn_speed_10"
		x: Math.floor(482 * screenScaleFactor)
		y: Math.floor(322 * screenScaleFactor)
		width: Math.floor(34 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "10"
		onClicked: {manager.send_gcode_str("M203 X10.00 Y10.00\n");}
	}

	Button {
		id: btn_speed_20
		objectName: "btn_speed_20"
		x: Math.floor(517 * screenScaleFactor)
		y: Math.floor(322 * screenScaleFactor)
		width: Math.floor(34 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "20"
		onClicked: {manager.send_gcode_str("M203 X20.00 Y20.00\n");}
	}

	Button {
		id: btn_speed_40
		objectName: "btn_speed_40"
		x: Math.floor(552 * screenScaleFactor)
		y: Math.floor(322 * screenScaleFactor)
		width: Math.floor(34 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "40"
		onClicked: {manager.send_gcode_str("M203 X40.00 Y40.00\n");}
	}

	Button {
		id: btn_speed_60
		objectName: "btn_speed_60"
		x: Math.floor(587 * screenScaleFactor)
		y: Math.floor(322 * screenScaleFactor)
		width: Math.floor(34 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "60"
		onClicked: {manager.send_gcode_str("M203 X60.00 Y60.00\n");}
	}

	Button {
		id: btn_speed_80
		objectName: "btn_speed_80"
		x: Math.floor(622 * screenScaleFactor)
		y: Math.floor(322 * screenScaleFactor)
		width: Math.floor(34 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "80"
		onClicked: {manager.send_gcode_str("M203 X80.00 Y80.00\n");}
	}

	Button {
		id: btn_speed_100
		objectName: "btn_speed_100"
		x: Math.floor(657 * screenScaleFactor)
		y: Math.floor(322 * screenScaleFactor)
		width: Math.floor(34 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "100"
		onClicked: {manager.send_gcode_str("M203 X100.00 Y100.00\n");}
	}

	Button {
		id: btn_speed_120
		objectName: "btn_speed_120"
		x: Math.floor(692 * screenScaleFactor)
		y: Math.floor(322 * screenScaleFactor)
		width: Math.floor(34 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "120"
		onClicked: {manager.send_gcode_str("M203 X120.00 Y120.00\n");}
	}

	Button {
		id: btn_speed_140
		objectName: "btn_speed_140"
		x: Math.floor(727 * screenScaleFactor)
		y: Math.floor(322 * screenScaleFactor)
		width: Math.floor(34 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "140"
		onClicked: {manager.send_gcode_str("M203 X140.00 Y140.00\n");}
	}

	Button {
		id: btn_speed_160
		objectName: "btn_speed_160"
		x: Math.floor(762 * screenScaleFactor)
		y: Math.floor(322 * screenScaleFactor)
		width: Math.floor(34 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "160"
		onClicked: {manager.send_gcode_str("M203 X160.00 Y160.00\n");}
	}

	Button {
		id: acceleration_1
		objectName: "acceleration_1"
		x: Math.floor(410 * screenScaleFactor)
		y: Math.floor(374 * screenScaleFactor)
		width: Math.floor(60 * screenScaleFactor)
		height: Math.floor(62 * screenScaleFactor)
		style: ButtonStyle {
			background:Rectangle{
				implicitHeight: edit_printer_name.height
				implicitWidth:  edit_printer_name.width
				color: "transparent"
				BorderImage{
					anchors.fill: parent
					source: "acceleration.png";
				}
			}
		}
	}

	Label {
		id: lb_accel_x
		objectName: "lb_accel_x"
		x: Math.floor(482 * screenScaleFactor)
		y: Math.floor(378 * screenScaleFactor)
		text: "X"
		font: UM.Theme.getFont("medium")
	}

	Button {
		id: btn_accel_500
		objectName: "btn_accel_500"
		x: Math.floor(504 * screenScaleFactor)
		y: Math.floor(372 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "500"
		onClicked: {manager.send_gcode_str("M201 X500\n");}
	}

	Button {
		id: btn_accel_750
		objectName: "btn_accel_750"
		x: Math.floor(546 * screenScaleFactor)
		y: Math.floor(372 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "750"
		onClicked: {manager.send_gcode_str("M201 X750\n");}
	}

	Button {
		id: btn_accel_1000
		objectName: "btn_accel_1000"
		x: Math.floor(588 * screenScaleFactor)
		y: Math.floor(372 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "1000"
		onClicked: {manager.send_gcode_str("M201 X1000\n");}
	}

	Button {
		id: btn_accel_1500
		objectName: "btn_accel_1500"
		x: Math.floor(630 * screenScaleFactor)
		y: Math.floor(372 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "1500"
		onClicked: {manager.send_gcode_str("M201 X1500\n");}
	}

	Button {
		id: btn_accel_2000
		objectName: "btn_accel_2000"
		x: Math.floor(672 * screenScaleFactor)
		y: Math.floor(372 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "2000"
		onClicked: {manager.send_gcode_str("M201 X2000\n");}
	}

	Button {
		id: btn_accel_2500
		objectName: "btn_accel_2500"
		x: Math.floor(714 * screenScaleFactor)
		y: Math.floor(372 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "2500"
		onClicked: {manager.send_gcode_str("M201 X2500\n");}
	}

	Button {
		id: btn_accel_3000
		objectName: "btn_accel_3000"
		x: Math.floor(756 * screenScaleFactor)
		y: Math.floor(372 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "3000"
		onClicked: {manager.send_gcode_str("M201 X3000\n");}
	}

	Label {
		id: lb_accel_y
		objectName: "lb_accel_y"
		x: Math.floor(482 * screenScaleFactor)
		y: Math.floor(406 * screenScaleFactor)
		text: "Y"
		font: UM.Theme.getFont("medium")
	}

	Button {
		id: btn_accel_y500
		objectName: "btn_accel_y500"
		x: Math.floor(504 * screenScaleFactor)
		y: Math.floor(401 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "500"
		onClicked: {manager.send_gcode_str("M201 Y500\n");}
	}

	Button {
		id: btn_accel_y750
		objectName: "btn_accel_y750"
		x: Math.floor(546 * screenScaleFactor)
		y: Math.floor(401 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "750"
		onClicked: {manager.send_gcode_str("M201 Y750\n");}
	}

	Button {
		id: btn_accel_y1000
		objectName: "btn_accel_y1000"
		x: Math.floor(588 * screenScaleFactor)
		y: Math.floor(401 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "1000"
		onClicked: {manager.send_gcode_str("M201 Y1000\n");}
	}

	Button {
		id: btn_accel_y1500
		objectName: "btn_accel_y1500"
		x: Math.floor(630 * screenScaleFactor)
		y: Math.floor(401 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "1500"
		onClicked: {manager.send_gcode_str("M201 Y1500\n");}
	}

	Button {
		id: btn_accel_y2000
		objectName: "btn_accel_y2000"
		x: Math.floor(672 * screenScaleFactor)
		y: Math.floor(401 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "2000"
		onClicked: {manager.send_gcode_str("M201 Y2000\n");}
	}

	Button {
		id: btn_accel_y2500
		objectName: "btn_accel_y2500"
		x: Math.floor(714 * screenScaleFactor)
		y: Math.floor(401 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "2500"
		onClicked: {manager.send_gcode_str("M201 Y2500\n");}
	}

	Button {
		id: btn_accel_y3000
		objectName: "btn_accel_y3000"
		x: Math.floor(756 * screenScaleFactor)
		y: Math.floor(401 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "3000"
		onClicked: {manager.send_gcode_str("M201 Y3000\n");}
	}

	Label {
		id: lb_accel
		objectName: "lb_accel"
		x: Math.floor(504 * screenScaleFactor)
		y: Math.floor(428 * screenScaleFactor)
		text: "Set print max acceleration (mm/s2)"
		font: UM.Theme.getFont("default")
	}

	Button {
		id: jerk_1
		objectName: "jerk_1"
		x: Math.floor(410 * screenScaleFactor)
		y: Math.floor(436 * screenScaleFactor)
		width: Math.floor(60 * screenScaleFactor)
		height: Math.floor(62 * screenScaleFactor)
		style: ButtonStyle {
			background:Rectangle{
				implicitHeight: edit_printer_name.height
				implicitWidth:  edit_printer_name.width
				color: "transparent"
				BorderImage{
					anchors.fill: parent
					source: "jerk.png";
				}
			}
		}
	}

	Button {
		id: btn_jerk_10
		objectName: "btn_jerk_10"
		x: Math.floor(482 * screenScaleFactor)
		y: Math.floor(446 * screenScaleFactor)
		width: Math.floor(61 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "10"
		onClicked: {manager.send_gcode_str("M205 X10 Y10\n");}
	}

	Button {
		id: btn_jerk_15
		objectName: "btn_jerk_15"
		x: Math.floor(545 * screenScaleFactor)
		y: Math.floor(446 * screenScaleFactor)
		width: Math.floor(61 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "15"
		onClicked: {manager.send_gcode_str("M205 X15 Y15\n");}
	}

	Button {
		id: btn_jerk_20
		objectName: "btn_jerk_20"
		x: Math.floor(608 * screenScaleFactor)
		y: Math.floor(446 * screenScaleFactor)
		width: Math.floor(61 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "20"
		onClicked: {manager.send_gcode_str("M205 X20 Y20\n");}
	}

	Button {
		id: btn_jerk_25
		objectName: "btn_jerk_25"
		x: Math.floor(671 * screenScaleFactor)
		y: Math.floor(446 * screenScaleFactor)
		width: Math.floor(61 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "25"
		onClicked: {manager.send_gcode_str("M205 X25 Y25\n");}
	}

	Button {
		id: btn_jerk_30
		objectName: "btn_jerk_30"
		x: Math.floor(734 * screenScaleFactor)
		y: Math.floor(446 * screenScaleFactor)
		width: Math.floor(61 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "30"
		onClicked: {manager.send_gcode_str("M205 X30 Y30\n");}
	}

	Label {
		id: lb_jerk
		objectName: "lb_jerk"
		x: Math.floor(482 * screenScaleFactor)
		y: Math.floor(477 * screenScaleFactor)
		text: "Minimum speed change that requires acceleration (mm/s)"
		font: UM.Theme.getFont("default")
	}

	Button {
		id: jd_1
		objectName: "jd_1"
		x: Math.floor(410 * screenScaleFactor)
		y: Math.floor(498 * screenScaleFactor)
		width: Math.floor(60 * screenScaleFactor)
		height: Math.floor(62 * screenScaleFactor)
		style: ButtonStyle {
			background:Rectangle{
				implicitHeight: edit_printer_name.height
				implicitWidth:  edit_printer_name.width
				color: "transparent"
				BorderImage{
					anchors.fill: parent
					source: "jd.png";
				}
			}
		}
	}

	Button {
		id: btn_jd_13
		objectName: "btn_jd_13"
		x: Math.floor(482 * screenScaleFactor)
		y: Math.floor(508 * screenScaleFactor)
		width: Math.floor(42 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "0.013"
		onClicked: {manager.send_gcode_str("M205 J0.013\n");}
	}

	Button {
		id: btn_jd_50
		objectName: "btn_jd_50"
		x: Math.floor(527 * screenScaleFactor)
		y: Math.floor(508 * screenScaleFactor)
		width: Math.floor(42 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "0.05"
		onClicked: {manager.send_gcode_str("M205 J0.050\n");}
	}

	Button {
		id: btn_jd_100
		objectName: "btn_jd_100"
		x: Math.floor(572 * screenScaleFactor)
		y: Math.floor(508 * screenScaleFactor)
		width: Math.floor(42 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "0.10"
		onClicked: {manager.send_gcode_str("M205 J0.100\n");}
	}

	Button {
		id: btn_jd_150
		objectName: "btn_jd_150"
		x: Math.floor(617 * screenScaleFactor)
		y: Math.floor(508 * screenScaleFactor)
		width: Math.floor(42 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "0.15"
		onClicked: {manager.send_gcode_str("M205 J0.150\n");}
	}

	Button {
		id: btn_jd_200
		objectName: "btn_jd_200"
		x: Math.floor(662 * screenScaleFactor)
		y: Math.floor(508 * screenScaleFactor)
		width: Math.floor(42 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "0.20"
		onClicked: {manager.send_gcode_str("M205 J0.200\n");}
	}

	Button {
		id: btn_jd_250
		objectName: "btn_jd_250"
		x: Math.floor(707 * screenScaleFactor)
		y: Math.floor(508 * screenScaleFactor)
		width: Math.floor(42 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "0.25"
		onClicked: {manager.send_gcode_str("M205 J0.250\n");}
	}

	Button {
		id: btn_jd_300
		objectName: "btn_jd_300"
		x: Math.floor(752 * screenScaleFactor)
		y: Math.floor(508 * screenScaleFactor)
		width: Math.floor(42 * screenScaleFactor)
		height: Math.floor(30 * screenScaleFactor)
		text: "0.30"
		onClicked: {manager.send_gcode_str("M205 J0.300\n");}
	}

	Label {
		id: lb_jd
		objectName: "lb_jd"
		x: Math.floor(482 * screenScaleFactor)
		y: Math.floor(538 * screenScaleFactor)
		text: "Set distance from real junction edge (mm)"
		font: UM.Theme.getFont("default")
	}

	Button {
		id: tmc_1
		objectName: "tmc_1"
		x: Math.floor(820 * screenScaleFactor)
		y: Math.floor(2 * screenScaleFactor)
		width: Math.floor(60 * screenScaleFactor)
		height: Math.floor(62 * screenScaleFactor)
		style: ButtonStyle {
			background:Rectangle{
				implicitHeight: edit_printer_name.height
				implicitWidth:  edit_printer_name.width
				color: "transparent"
				BorderImage{
					anchors.fill: parent
					source: "tmc.png";
				}
			}
		}
	}

	Label {
		id: lb_tmc_settings
		objectName: "lb_tmc_settings"
		x: Math.floor(892 * screenScaleFactor)
		y: Math.floor(10 * screenScaleFactor)
		text: "TMC settings"
		font: UM.Theme.getFont("large_bold")
	}

	Label {
		id: lb_tmc_settings2
		objectName: "lb_tmc_settings2"
		x: Math.floor(892 * screenScaleFactor)
		y: Math.floor(37 * screenScaleFactor)
		text: "Only for experienced users"
		font: UM.Theme.getFont("default")
	}

	Button {
		id: rms_1
		objectName: "rms_1"
		x: Math.floor(820 * screenScaleFactor)
		y: Math.floor(64 * screenScaleFactor)
		width: Math.floor(60 * screenScaleFactor)
		height: Math.floor(124 * screenScaleFactor)
		style: ButtonStyle {
			background:Rectangle{
				implicitHeight: edit_printer_name.height
				implicitWidth:  edit_printer_name.width
				color: "transparent"
				BorderImage{
					anchors.fill: parent
					source: "rms.png";
				}
			}
		}
	}

	Label {
		id: lb_rms_x
		objectName: "lb_rms_x"
		x: Math.floor(892 * screenScaleFactor)
		y: Math.floor(70 * screenScaleFactor)
		text: "X"
		font: UM.Theme.getFont("medium")
	}

	Button {
		id: btn_rms_x400
		objectName: "btn_rms_x400"
		x: Math.floor(914 * screenScaleFactor)
		y: Math.floor(64 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "400"
		onClicked: {manager.send_gcode_str("M906 X400\n");}
	}

	Button {
		id: btn_rms_x500
		objectName: "btn_rms_x500"
		x: Math.floor(956 * screenScaleFactor)
		y: Math.floor(64 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "500"
		onClicked: {manager.send_gcode_str("M906 X500\n");}
	}

	Button {
		id: btn_rms_x600
		objectName: "btn_rms_x600"
		x: Math.floor(998 * screenScaleFactor)
		y: Math.floor(64 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "600"
		onClicked: {manager.send_gcode_str("M906 X600\n");}
	}

	Button {
		id: btn_rms_x700
		objectName: "btn_rms_x700"
		x: Math.floor(1040 * screenScaleFactor)
		y: Math.floor(64 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "700"
		onClicked: {manager.send_gcode_str("M906 X700\n");}
	}

	Button {
		id: btn_rms_x800
		objectName: "btn_rms_x800"
		x: Math.floor(1082 * screenScaleFactor)
		y: Math.floor(64 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "800"
		onClicked: {manager.send_gcode_str("M906 X800\n");}
	}

	Button {
		id: btn_rms_x900
		objectName: "btn_rms_x900"
		x: Math.floor(1124 * screenScaleFactor)
		y: Math.floor(64 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "900"
		onClicked: {manager.send_gcode_str("M906 X900\n");}
	}

	Button {
		id: btn_rms_x1000
		objectName: "btn_rms_x1000"
		x: Math.floor(1166 * screenScaleFactor)
		y: Math.floor(64 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "1000"
		onClicked: {manager.send_gcode_str("M906 X1000\n");}
	}

	Label {
		id: lb_rms_y
		objectName: "lb_rms_y"
		x: Math.floor(892 * screenScaleFactor)
		y: Math.floor(97 * screenScaleFactor)
		text: "Y"
		font: UM.Theme.getFont("medium")
	}

	Button {
		id: btn_rms_y400
		objectName: "btn_rms_y400"
		x: Math.floor(914 * screenScaleFactor)
		y: Math.floor(91 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "400"
		onClicked: {manager.send_gcode_str("M906 Y400\n");}
	}


	Button {
		id: btn_rms_y500
		objectName: "btn_rms_y500"
		x: Math.floor(956 * screenScaleFactor)
		y: Math.floor(91 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "500"
		onClicked: {manager.send_gcode_str("M906 Y500\n");}
	}

	Button {
		id: btn_rms_y600
		objectName: "btn_rms_y600"
		x: Math.floor(998 * screenScaleFactor)
		y: Math.floor(91 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "600"
		onClicked: {manager.send_gcode_str("M906 Y600\n");}
	}

	Button {
		id: btn_rms_y700
		objectName: "btn_rms_y700"
		x: Math.floor(1040 * screenScaleFactor)
		y: Math.floor(91 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "700"
		onClicked: {manager.send_gcode_str("M906 Y700\n");}
	}

	Button {
		id: btn_rms_y800
		objectName: "btn_rms_y800"
		x: Math.floor(1082 * screenScaleFactor)
		y: Math.floor(91 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "800"
		onClicked: {manager.send_gcode_str("M906 Y800\n");}
	}

	Button {
		id: btn_rms_y900
		objectName: "btn_rms_y900"
		x: Math.floor(1124 * screenScaleFactor)
		y: Math.floor(91 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "900"
		onClicked: {manager.send_gcode_str("M906 Y900\n");}
	}

	Button {
		id: btn_rms_y1000
		objectName: "btn_rms_y1000"
		x: Math.floor(1166 * screenScaleFactor)
		y: Math.floor(91 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "1000"
		onClicked: {manager.send_gcode_str("M906 Y1000\n");}
	}

	Label {
		id: lb_rms_z
		objectName: "lb_rms_z"
		x: Math.floor(892 * screenScaleFactor)
		y: Math.floor(123 * screenScaleFactor)
		text: "Z"
		font: UM.Theme.getFont("medium")
	}

	Button {
		id: btn_rms_z400
		objectName: "btn_rms_z400"
		x: Math.floor(914 * screenScaleFactor)
		y: Math.floor(118 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "400"
		onClicked: {manager.send_gcode_str("M906 Z400\n");}
	}

	Button {
		id: btn_rms_z500
		objectName: "btn_rms_z500"
		x: Math.floor(956 * screenScaleFactor)
		y: Math.floor(118 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "500"
		onClicked: {manager.send_gcode_str("M906 Z500\n");}
	}

	Button {
		id: btn_rms_z600
		objectName: "btn_rms_z600"
		x: Math.floor(998 * screenScaleFactor)
		y: Math.floor(118 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "600"
		onClicked: {manager.send_gcode_str("M906 Z600\n");}
	}

	Button {
		id: btn_rms_z700
		objectName: "btn_rms_z700"
		x: Math.floor(1040 * screenScaleFactor)
		y: Math.floor(118 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "700"
		onClicked: {manager.send_gcode_str("M906 Z700\n");}
	}

	Button {
		id: btn_rms_z800
		objectName: "btn_rms_z800"
		x: Math.floor(1082 * screenScaleFactor)
		y: Math.floor(118 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "800"
		onClicked: {manager.send_gcode_str("M906 Z800\n");}
	}

	Button {
		id: btn_rms_z900
		objectName: "btn_rms_z900"
		x: Math.floor(1124 * screenScaleFactor)
		y: Math.floor(118 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "900"
		onClicked: {manager.send_gcode_str("M906 Z900\n");}
	}

	Button {
		id: btn_rms_z1000
		objectName: "btn_rms_z1000"
		x: Math.floor(1166 * screenScaleFactor)
		y: Math.floor(118 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "1000"
		onClicked: {manager.send_gcode_str("M906 Z1000\n");}
	}

	Label {
		id: lb_rms_e
		objectName: "lb_rms_e"
		x: Math.floor(892 * screenScaleFactor)
		y: Math.floor(150 * screenScaleFactor)
		text: "E"
		font: UM.Theme.getFont("medium")
	}

	Button {
		id: btn_rms_e400
		objectName: "btn_rms_e400"
		x: Math.floor(914 * screenScaleFactor)
		y: Math.floor(145 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "400"
		onClicked: {manager.send_gcode_str("M906 E400\n");}
	}

	Button {
		id: btn_rms_e500
		objectName: "btn_rms_e500"
		x: Math.floor(956 * screenScaleFactor)
		y: Math.floor(145 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "500"
		onClicked: {manager.send_gcode_str("M906 E500\n");}
	}

	Button {
		id: btn_rms_e600
		objectName: "btn_rms_e600"
		x: Math.floor(998 * screenScaleFactor)
		y: Math.floor(145 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "600"
		onClicked: {manager.send_gcode_str("M906 E600\n");}
	}

	Button {
		id: btn_rms_e700
		objectName: "btn_rms_e700"
		x: Math.floor(1040 * screenScaleFactor)
		y: Math.floor(145 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "700"
		onClicked: {manager.send_gcode_str("M906 E700\n");}
	}

	Button {
		id: btn_rms_e800
		objectName: "btn_rms_e800"
		x: Math.floor(1082 * screenScaleFactor)
		y: Math.floor(145 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "800"
		onClicked: {manager.send_gcode_str("M906 E800\n");}
	}

	Button {
		id: btn_rms_e900
		objectName: "btn_rms_e900"
		x: Math.floor(1124 * screenScaleFactor)
		y: Math.floor(145 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "900"
		onClicked: {manager.send_gcode_str("M906 E900\n");}
	}

	Button {
		id: btn_rms_e1000
		objectName: "btn_rms_e1000"
		x: Math.floor(1166 * screenScaleFactor)
		y: Math.floor(145 * screenScaleFactor)
		width: Math.floor(40 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "1000"
		onClicked: {manager.send_gcode_str("M906 E1000\n");}
	}

	Label {
		id: lb_rms
		objectName: "lb_rms"
		x: Math.floor(912 * screenScaleFactor)
		y: Math.floor(172 * screenScaleFactor)
		text: "Multiply by 1.414 for peak current (mA)"
		font: UM.Theme.getFont("default")
	}

	Button {
		id: steping_1
		objectName: "steping_1"
		x: Math.floor(820 * screenScaleFactor)
		y: Math.floor(188 * screenScaleFactor)
		width: Math.floor(60 * screenScaleFactor)
		height: Math.floor(124 * screenScaleFactor)
		style: ButtonStyle {
			background:Rectangle{
				implicitHeight: edit_printer_name.height
				implicitWidth:  edit_printer_name.width
				color: "transparent"
				BorderImage{
					anchors.fill: parent
					source: "steping.png";
				}
			}
		}
	}

	Label {
		id: steping_x
		objectName: "steping_x"
		x: Math.floor(892 * screenScaleFactor)
		y: Math.floor(194 * screenScaleFactor)
		text: "X"
		font: UM.Theme.getFont("medium")
	}

	Button {
		id: stealthshop_x
		objectName: "stealthshop_x"
		x: Math.floor(914 * screenScaleFactor)
		y: Math.floor(188 * screenScaleFactor)
		width: Math.floor(144 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "StealthChop"
		onClicked: {manager.send_gcode_str("M569 S1 X\n");}
	}

	Button {
		id: spreadcycle_x
		objectName: "spreadcycle_x"
		x: Math.floor(1061 * screenScaleFactor)
		y: Math.floor(188 * screenScaleFactor)
		width: Math.floor(144 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "SpreadCycle"
		onClicked: {manager.send_gcode_str("M569 S0 X\n");}
	}

	Label {
		id: steping_y
		objectName: "steping_y"
		x: Math.floor(892 * screenScaleFactor)
		y: Math.floor(221 * screenScaleFactor)
		text: "Y"
		font: UM.Theme.getFont("medium")
	}

	Button {
		id: stealthshop_y
		objectName: "stealthshop_y"
		x: Math.floor(914 * screenScaleFactor)
		y: Math.floor(215 * screenScaleFactor)
		width: Math.floor(144 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "StealthChop"
		onClicked: {manager.send_gcode_str("M569 S1 Y\n");}
	}

	Button {
		id: spreadcycle_y
		objectName: "spreadcycle_y"
		x: Math.floor(1061 * screenScaleFactor)
		y: Math.floor(215 * screenScaleFactor)
		width: Math.floor(144 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "SpreadCycle"
		onClicked: {manager.send_gcode_str("M569 S0 Y\n");}
	}

	Label {
		id: steping_z
		objectName: "steping_z"
		x: Math.floor(892 * screenScaleFactor)
		y: Math.floor(248 * screenScaleFactor)
		text: "Z"
		font: UM.Theme.getFont("medium")
	}

	Button {
		id: stealthshop_z
		objectName: "stealthshop_z"
		x: Math.floor(914 * screenScaleFactor)
		y: Math.floor(242 * screenScaleFactor)
		width: Math.floor(144 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "StealthChop"
		onClicked: {manager.send_gcode_str("M569 S1 Z\n");}
	}

	Button {
		id: spreadcycle_z
		objectName: "spreadcycle_z"
		x: Math.floor(1061 * screenScaleFactor)
		y: Math.floor(242 * screenScaleFactor)
		width: Math.floor(144 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "SpreadCycle"
		onClicked: {manager.send_gcode_str("M569 S0 Z\n");}
	}

	Label {
		id: steping_e
		objectName: "steping_e"
		x: Math.floor(892 * screenScaleFactor)
		y: Math.floor(275 * screenScaleFactor)
		text: "E"
		font: UM.Theme.getFont("medium")
	}

	Button {
		id: stealthshop_e
		objectName: "stealthshop_e"
		x: Math.floor(914 * screenScaleFactor)
		y: Math.floor(269 * screenScaleFactor)
		width: Math.floor(144 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "StealthChop"
		onClicked: {manager.send_gcode_str("M569 S1 E\n");}
	}

	Button {
		id: spreadcycle_e
		objectName: "spreadcycle_e"
		x: Math.floor(1061 * screenScaleFactor)
		y: Math.floor(269 * screenScaleFactor)
		width: Math.floor(144 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "SpreadCycle"
		onClicked: {manager.send_gcode_str("M569 S0 E\n");}
	}

	Label {
		id: lb_steping
		objectName: "lb_steping"
		x: Math.floor(914 * screenScaleFactor)
		y: Math.floor(296 * screenScaleFactor)
		text: "Silent"
		font: UM.Theme.getFont("default")
	}

	Label {
		id: lb_steping2
		objectName: "lb_steping2"
		x: Math.floor(1061 * screenScaleFactor)
		y: Math.floor(296 * screenScaleFactor)
		text: "More powerful"
		font: UM.Theme.getFont("default")
	}

	Button {
		id: threshold_1
		objectName: "threshold_1"
		x: Math.floor(820 * screenScaleFactor)
		y: Math.floor(312 * screenScaleFactor)
		width: Math.floor(60 * screenScaleFactor)
		height: Math.floor(124 * screenScaleFactor)
		style: ButtonStyle {
			background:Rectangle{
				implicitHeight: edit_printer_name.height
				implicitWidth:  edit_printer_name.width
				color: "transparent"
				BorderImage{
					anchors.fill: parent
					source: "Threshold.png";
				}
			}
		}
	}

	Label {
		id: threshold_x
		objectName: "threshold_x"
		x: Math.floor(892 * screenScaleFactor)
		y: Math.floor(318 * screenScaleFactor)
		text: "X"
		font: UM.Theme.getFont("medium")
	}

	Button {
		id: threshold_x60
		objectName: "threshold_x60"
		x: Math.floor(914 * screenScaleFactor)
		y: Math.floor(312 * screenScaleFactor)
		width: Math.floor(57 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "60"
		onClicked: {manager.send_gcode_str("M913 X60\n");}
	}

	Button {
		id: threshold_x80
		objectName: "threshold_x80"
		x: Math.floor(973 * screenScaleFactor)
		y: Math.floor(312 * screenScaleFactor)
		width: Math.floor(56 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "80"
		onClicked: {manager.send_gcode_str("M913 X80\n");}
	}

	Button {
		id: threshold_x100
		objectName: "threshold_x100"
		x: Math.floor(1031 * screenScaleFactor)
		y: Math.floor(312 * screenScaleFactor)
		width: Math.floor(56 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "100"
		onClicked: {manager.send_gcode_str("M913 X100\n");}
	}

	Button {
		id: threshold_x120
		objectName: "threshold_x120"
		x: Math.floor(1089 * screenScaleFactor)
		y: Math.floor(312 * screenScaleFactor)
		width: Math.floor(56 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "120"
		onClicked: {manager.send_gcode_str("M913 X120\n");}
	}

	Button {
		id: threshold_x140
		objectName: "threshold_x140"
		x: Math.floor(1147 * screenScaleFactor)
		y: Math.floor(312 * screenScaleFactor)
		width: Math.floor(57 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "140"
		onClicked: {manager.send_gcode_str("M913 X140\n");}
	}

	Label {
		id: threshold_y
		objectName: "threshold_y"
		x: Math.floor(892 * screenScaleFactor)
		y: Math.floor(345 * screenScaleFactor)
		text: "Y"
		font: UM.Theme.getFont("medium")
	}

	Button {
		id: threshold_y60
		objectName: "threshold_y60"
		x: Math.floor(914 * screenScaleFactor)
		y: Math.floor(339 * screenScaleFactor)
		width: Math.floor(57 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "60"
		onClicked: {manager.send_gcode_str("M913 Y60\n");}
	}

	Button {
		id: threshold_y80
		objectName: "threshold_y80"
		x: Math.floor(973 * screenScaleFactor)
		y: Math.floor(339 * screenScaleFactor)
		width: Math.floor(56 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "80"
		onClicked: {manager.send_gcode_str("M913 Y80\n");}
	}

	Button {
		id: threshold_y100
		objectName: "threshold_y100"
		x: Math.floor(1031 * screenScaleFactor)
		y: Math.floor(339 * screenScaleFactor)
		width: Math.floor(56 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "100"
		onClicked: {manager.send_gcode_str("M913 Y100\n");}
	}

	Button {
		id: threshold_y120
		objectName: "threshold_y120"
		x: Math.floor(1089 * screenScaleFactor)
		y: Math.floor(339 * screenScaleFactor)
		width: Math.floor(56 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "120"
		onClicked: {manager.send_gcode_str("M913 Y120\n");}
	}

	Button {
		id: threshold_y140
		objectName: "threshold_y140"
		x: Math.floor(1147 * screenScaleFactor)
		y: Math.floor(339 * screenScaleFactor)
		width: Math.floor(57 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "140"
		onClicked: {manager.send_gcode_str("M913 Y140\n");}
	}

	Label {
		id: threshold_z
		objectName: "threshold_z"
		x: Math.floor(892 * screenScaleFactor)
		y: Math.floor(372 * screenScaleFactor)
		text: "Z"
		font: UM.Theme.getFont("medium")
	}

	Button {
		id: threshold_z1
		objectName: "threshold_z1"
		x: Math.floor(914 * screenScaleFactor)
		y: Math.floor(366 * screenScaleFactor)
		width: Math.floor(57 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "1"
		onClicked: {manager.send_gcode_str("M913 Z1\n");}
	}

	Button {
		id: threshold_z2
		objectName: "threshold_z2"
		x: Math.floor(973 * screenScaleFactor)
		y: Math.floor(366 * screenScaleFactor)
		width: Math.floor(56 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "2"
		onClicked: {manager.send_gcode_str("M913 Z2\n");}
	}

	Button {
		id: threshold_z3
		objectName: "threshold_z3"
		x: Math.floor(1031 * screenScaleFactor)
		y: Math.floor(366 * screenScaleFactor)
		width: Math.floor(56 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "3"
		onClicked: {manager.send_gcode_str("M913 Z3\n");}
	}

	Button {
		id: threshold_z4
		objectName: "threshold_z4"
		x: Math.floor(1089 * screenScaleFactor)
		y: Math.floor(366 * screenScaleFactor)
		width: Math.floor(56 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "4"
		onClicked: {manager.send_gcode_str("M913 Z4\n");}
	}

	Button {
		id: threshold_z5
		objectName: "threshold_z5"
		x: Math.floor(1147 * screenScaleFactor)
		y: Math.floor(366 * screenScaleFactor)
		width: Math.floor(57 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "5"
		onClicked: {manager.send_gcode_str("M913 Z5\n");}
	}

	Label {
		id: threshold_e
		objectName: "threshold_e"
		x: Math.floor(892 * screenScaleFactor)
		y: Math.floor(399 * screenScaleFactor)
		text: "E"
		font: UM.Theme.getFont("medium")
	}

	Button {
		id: threshold_e10
		objectName: "threshold_e10"
		x: Math.floor(914 * screenScaleFactor)
		y: Math.floor(393 * screenScaleFactor)
		width: Math.floor(57 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "10"
		onClicked: {manager.send_gcode_str("M913 E10\n");}
	}

	Button {
		id: threshold_e20
		objectName: "threshold_e20"
		x: Math.floor(973 * screenScaleFactor)
		y: Math.floor(393 * screenScaleFactor)
		width: Math.floor(56 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "20"
		onClicked: {manager.send_gcode_str("M913 E20\n");}
	}

	Button {
		id: threshold_e30
		objectName: "threshold_e30"
		x: Math.floor(1031 * screenScaleFactor)
		y: Math.floor(393 * screenScaleFactor)
		width: Math.floor(56 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "30"
		onClicked: {manager.send_gcode_str("M913 E30\n");}
	}

	Button {
		id: threshold_e40
		objectName: "threshold_e40"
		x: Math.floor(1089 * screenScaleFactor)
		y: Math.floor(393 * screenScaleFactor)
		width: Math.floor(56 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "40"
		onClicked: {manager.send_gcode_str("M913 E40\n");}
	}

	Button {
		id: threshold_e50
		objectName: "threshold_e50"
		x: Math.floor(1147 * screenScaleFactor)
		y: Math.floor(393 * screenScaleFactor)
		width: Math.floor(57 * screenScaleFactor)
		height: Math.floor(27 * screenScaleFactor)
		text: "50"
		onClicked: {manager.send_gcode_str("M913 E50\n");}
	}

	Label {
		id: lb_threshold
		objectName: "lb_threshold"
		x: Math.floor(892 * screenScaleFactor)
		y: Math.floor(423 * screenScaleFactor)
		text: "Hybrid Threshold speed (mm/s). STEALTHCHOP must\nbe enabled"
		font: UM.Theme.getFont("default")
	}

	Label {
		id: lb_tmc_help
		objectName: "lb_tmc_help"
		x: Math.floor(892 * screenScaleFactor)
		y: Math.floor(465 * screenScaleFactor)
		text: "TMC stepper drivers allow you to have a better control\nof your stepper motors and achieve extremely quiet\nmotion"
		font: UM.Theme.getFont("default")
	}

	Button {
		id: btn_tmc_help
		objectName: "btn_tmc_help"
		x: Math.floor(892 * screenScaleFactor)
		y: Math.floor(514 * screenScaleFactor)
		width: Math.floor(68 * screenScaleFactor)
		height: Math.floor(12 * screenScaleFactor)
		onClicked: {manager.btn_tmc_help();}
		style: ButtonStyle {
			background:Rectangle{
				implicitHeight: btn_tmc_help.height
				implicitWidth:  btn_tmc_help.width
				color: "transparent"
				Label {
					text: "Learn more..."
					font: UM.Theme.getFont("default_bold")
				}
			}
		}
	}
}