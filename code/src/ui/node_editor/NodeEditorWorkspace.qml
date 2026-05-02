import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import ".."

Item {
    id: root

    // Background Node Graph Canvas
    Canvas {
        anchors.fill: parent
        onPaint: {
            var ctx = getContext("2d");
            ctx.clearRect(0, 0, width, height);
            
            // Draw dummy connections
            ctx.strokeStyle = Theme.primary;
            ctx.lineWidth = 2;
            ctx.setLineDash([4, 4]);
            ctx.globalAlpha = 0.3;
            
            // Connection: Source -> Grade
            ctx.beginPath();
            ctx.moveTo(250, 200);
            ctx.bezierCurveTo(350, 200, 350, 300, 450, 300);
            ctx.stroke();
            
            // Connection: Grade -> Viewer
            ctx.beginPath();
            ctx.moveTo(600, 300);
            ctx.bezierCurveTo(700, 300, 700, 250, 800, 250);
            ctx.stroke();
        }
    }

    // Dummy Nodes
    Item {
        anchors.fill: parent
        
        // Node 1: Source
        Rectangle {
            x: 100; y: 150
            width: 150; height: 80
            radius: 8
            color: Theme.panel
            border.color: Theme.primary
            border.width: 1
            
            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 8
                Text { text: "READ_01"; font: Theme.monoFont; color: Theme.primary }
                Text { text: "shot_010.mov"; font: Theme.smallFont; color: Theme.textSecondary; elide: Text.ElideRight; Layout.fillWidth: true }
                Rectangle { Layout.fillWidth: true; height: 1; color: Theme.border }
                Text { text: "RGBA | 10-bit"; font: Theme.monoFont; font.pixelSize: 8; color: Theme.textSecondary }
            }
            
            // Output Socket
            Rectangle {
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.rightMargin: -6
                width: 12; height: 12; radius: 6; color: Theme.primary
            }
        }
        
        // Node 2: Color Grade
        Rectangle {
            x: 450; y: 260
            width: 150; height: 80
            radius: 8
            color: Theme.panel
            border.color: Theme.accent
            border.width: 1
            
            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 8
                Text { text: "GRADE_01"; font: Theme.monoFont; color: Theme.accent }
                Text { text: "Custom LUT applied"; font: Theme.smallFont; color: Theme.textSecondary }
                Rectangle { Layout.fillWidth: true; height: 1; color: Theme.border }
                Text { text: "Exposure: +0.5"; font: Theme.monoFont; font.pixelSize: 8; color: Theme.textSecondary }
            }
            
            // Input Socket
            Rectangle {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: -6
                width: 12; height: 12; radius: 6; color: Theme.accent
            }
            // Output Socket
            Rectangle {
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.rightMargin: -6
                width: 12; height: 12; radius: 6; color: Theme.accent
            }
        }
        
        // Node 3: Viewer
        Rectangle {
            x: 800; y: 210
            width: 150; height: 80
            radius: 8
            color: Theme.base
            border.color: Theme.textSecondary
            border.width: 1
            opacity: 0.8
            
            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 8
                Text { text: "VIEWER_01"; font: Theme.monoFont; color: Theme.textPrimary }
                Text { text: "Active Output"; font: Theme.smallFont; color: Theme.textSecondary }
                Rectangle { Layout.fillWidth: true; height: 1; color: Theme.border }
                Text { text: "Proxy: Enabled"; font: Theme.monoFont; font.pixelSize: 8; color: Theme.success }
            }
            
            // Input Socket
            Rectangle {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: -6
                width: 12; height: 12; radius: 6; color: Theme.textSecondary
            }
        }
    }

    // Controls Overlay
    Rectangle {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 16
        width: 180; height: 32; radius: 16
        color: Theme.base; opacity: 0.9
        border.color: Theme.border
        
        RowLayout {
            anchors.fill: parent
            anchors.margins: 4
            ToolButton { 
                icon.source: "../icons/outline/plus.svg"
                icon.width: 16; icon.height: 16
                background: null
            }
            Rectangle { width: 1; height: 12; color: Theme.border }
            Text {
                text: "ADD NODE (SHIFT+A)"
                font: Theme.smallFontBold
                color: Theme.textSecondary
                Layout.fillWidth: true
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }
}
