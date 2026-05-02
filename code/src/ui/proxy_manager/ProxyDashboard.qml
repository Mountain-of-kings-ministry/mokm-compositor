import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import ".."

Dialog {
    id: root
    title: "PROXY ENGINE DASHBOARD"
    width: 600; height: 400
    standardButtons: Dialog.Close
    anchors.centerIn: parent
    modal: true

    background: Rectangle {
        color: Theme.base
        border.color: Theme.border
        radius: 12
    }

    contentItem: ColumnLayout {
        spacing: 16
        
        // Engine Stats
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 60
            color: Theme.panel; radius: 8; border.color: Theme.border
            
            RowLayout {
                anchors.fill: parent; anchors.margins: 12
                ColumnLayout {
                    Text { text: "ENGINE STATUS"; font: Theme.monoFont; font.pixelSize: 8; color: Theme.textSecondary }
                    Text { text: "ACTIVE (4 THREADS)"; font: Theme.smallFontBold; color: Theme.success }
                }
                Rectangle { width: 1; height: 30; color: Theme.border }
                ColumnLayout {
                    Text { text: "TOTAL THROUGHPUT"; font: Theme.monoFont; font.pixelSize: 8; color: Theme.textSecondary }
                    Text { text: "128.4 MB/s"; font: Theme.smallFontBold; color: Theme.textPrimary }
                }
                Item { Layout.fillWidth: true }
                ToolButton { 
                    text: "PAUSE ENGINE"
                    font: Theme.smallFontBold
                    icon.source: "../icons/outline/player-pause.svg"
                }
            }
        }

        // Transcoding Queue
        Text { text: "TRANSCODING QUEUE"; font: Theme.smallFontBold; color: Theme.textSecondary }
        
        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            model: [
                { file: "shot_010_lighting.mov", progress: 0.85, eta: "4s", speed: "42MB/s" },
                { file: "bg_texture_4k.exr", progress: 0.12, eta: "1m 12s", speed: "12MB/s" },
                { file: "render_comp_final.comp", progress: 1.0, eta: "Done", speed: "-" },
                { file: "raw_clip_003.braw", progress: 0.0, eta: "Waiting", speed: "-" }
            ]
            
            delegate: Rectangle {
                width: parent.width; height: 50
                color: "transparent"
                
                ColumnLayout {
                    anchors.fill: parent; anchors.margins: 4
                    RowLayout {
                        Text { text: modelData.file; font: Theme.smallFont; color: Theme.textPrimary; Layout.fillWidth: true }
                        Text { text: modelData.eta; font: Theme.monoFont; font.pixelSize: 10; color: Theme.textSecondary }
                    }
                    
                    RowLayout {
                        spacing: 8
                        ProgressBar {
                            value: modelData.progress
                            Layout.fillWidth: true
                            background: Rectangle { color: Theme.surface; radius: 2; height: 4 }
                            contentItem: Item {
                                Rectangle {
                                    width: modelData.progress * parent.width
                                    height: parent.height; radius: 2; color: Theme.primary
                                }
                            }
                        }
                        Text { text: (modelData.progress * 100).toFixed(0) + "%"; font: Theme.monoFont; font.pixelSize: 10; color: Theme.primary }
                    }
                }
                Rectangle { anchors.bottom: parent.bottom; width: parent.width; height: 1; color: Theme.border; opacity: 0.2 }
            }
        }
        
        // Action Bar
        RowLayout {
            Layout.fillWidth: true
            CheckBox { text: "Auto-transcode new assets"; font: Theme.smallFont; palette.text: Theme.textSecondary }
            Item { Layout.fillWidth: true }
            Button {
                text: "Clear Finished"
                font: Theme.smallFontBold
                background: Rectangle { color: Theme.panel; border.color: Theme.border; radius: 4 }
            }
        }
    }
}
