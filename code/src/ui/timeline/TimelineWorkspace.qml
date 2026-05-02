import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import ".."

Item {
    id: root

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        // Toolbar / Transport
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 32
            color: Theme.base
            border.color: Theme.border
            
            RowLayout {
                anchors.fill: parent
                anchors.margins: 4
                spacing: 8
                
                ToolButton { icon.source: "../icons/outline/player-skip-back.svg"; icon.width: 16 }
                ToolButton { icon.source: "../icons/outline/player-play.svg"; icon.width: 16 }
                ToolButton { icon.source: "../icons/outline/player-skip-forward.svg"; icon.width: 16 }
                
                Rectangle { width: 1; height: 16; color: Theme.border }
                
                Text {
                    text: "00:00:10:14"
                    font: Theme.monoFont
                    font.pixelSize: 12
                    color: Theme.primary
                }
                
                Item { Layout.fillWidth: true }
                
                ToolButton { icon.source: "../icons/outline/scissors.svg"; icon.width: 16 }
                ToolButton { icon.source: "../icons/outline/magnet.svg"; icon.width: 16; checked: true }
            }
        }

        // Ruler
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 28
            color: Theme.surface
            border.color: Theme.border
            
            RowLayout {
                anchors.fill: parent
                spacing: 0
                Repeater {
                    model: 20
                    delegate: Item {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Text {
                            anchors.left: parent.left
                            anchors.leftMargin: 4
                            anchors.top: parent.top
                            anchors.topMargin: 2
                            text: (index * 24) + "f"
                            font: Theme.monoFont
                            font.pixelSize: 9
                            color: Theme.textSecondary
                            opacity: 0.5
                        }
                        Rectangle {
                            anchors.left: parent.left
                            anchors.bottom: parent.bottom
                            width: 1; height: index % 5 == 0 ? 8 : 4
                            color: Theme.textSecondary; opacity: 0.3
                        }
                    }
                }
            }
        }

        // Tracks Area
        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 0

            // Track Headers
            Rectangle {
                Layout.preferredWidth: 200
                Layout.fillHeight: true
                color: Theme.base
                border.color: Theme.border

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 4
                    spacing: 2
                    
                    // Track V1
                    Rectangle {
                        Layout.fillWidth: true; Layout.preferredHeight: 40
                        color: Theme.panel; radius: 4; border.color: Theme.border
                        RowLayout {
                            anchors.fill: parent; anchors.margins: 8
                            Text { text: "V1"; font: Theme.monoFont; color: Theme.primary; font.bold: true }
                            Text { text: "Main_Comp"; font: Theme.smallFont; color: Theme.textPrimary; Layout.fillWidth: true }
                            ToolButton { icon.source: "../icons/outline/eye.svg"; icon.width: 14; opacity: 0.5 }
                        }
                    }
                    // Track A1
                    Rectangle {
                        Layout.fillWidth: true; Layout.preferredHeight: 40
                        color: Theme.panel; radius: 4; border.color: Theme.border
                        RowLayout {
                            anchors.fill: parent; anchors.margins: 8
                            Text { text: "A1"; font: Theme.monoFont; color: Theme.textSecondary; font.bold: true }
                            Text { text: "Audio_L/R"; font: Theme.smallFont; color: Theme.textSecondary; Layout.fillWidth: true }
                            ToolButton { icon.source: "../icons/outline/volume.svg"; icon.width: 14; opacity: 0.5 }
                        }
                    }
                    Item { Layout.fillHeight: true }
                }
            }

            // Clips Canvas
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: Theme.surface
                clip: true
                
                // Grid Background
                Canvas {
                    anchors.fill: parent
                    opacity: 0.05
                    onPaint: {
                        var ctx = getContext("2d");
                        ctx.strokeStyle = Theme.textSecondary;
                        for(var x=0; x<width; x+=100) {
                            ctx.beginPath(); ctx.moveTo(x,0); ctx.lineTo(x,height); ctx.stroke();
                        }
                    }
                }

                // Clips
                Item {
                    y: 4; x: 50
                    Rectangle {
                        width: 400; height: 32
                        color: Theme.primary; opacity: 0.2; radius: 4
                        border.color: Theme.primary; border.width: 1
                        Text { anchors.centerIn: parent; text: "shot_010_lighting.mov"; font: Theme.smallFont; color: Theme.textPrimary }
                    }
                    Rectangle {
                        y: 42; width: 600; height: 32
                        color: Theme.accent; opacity: 0.1; radius: 4
                        border.color: Theme.accent; border.width: 1
                        Text { anchors.centerIn: parent; text: "main_score_v2.wav"; font: Theme.smallFont; color: Theme.textSecondary }
                    }
                }
                
                // Playhead
                Rectangle {
                    x: 250
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    width: 2
                    color: Theme.primary
                    z: 100
                    
                    // Diamond Head
                    Rectangle {
                        anchors.top: parent.top
                        anchors.topMargin: -14
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: 12; height: 12; radius: 2; rotation: 45
                        color: Theme.primary
                        border.color: Theme.surface; border.width: 2
                    }
                }
            }
        }
    }
}
