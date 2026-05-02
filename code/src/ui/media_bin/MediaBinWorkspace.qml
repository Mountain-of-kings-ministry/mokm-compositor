import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import ".."

Item {
    id: root
    
    ColumnLayout {
        anchors.fill: parent
        spacing: 0
        
        // Header & Search
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 64
            color: Theme.base
            border.color: Theme.border
            
            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 8
                spacing: 4
                
                Text {
                    text: "PROJECT BIN"
                    font: Theme.smallFontBold
                    color: Theme.textSecondary
                    Layout.leftMargin: 4
                }
                
                RowLayout {
                    spacing: 8
                    TextField {
                        placeholderText: "Search assets..."
                        Layout.fillWidth: true
                        font: Theme.smallFont
                        background: Rectangle {
                            color: Theme.surface
                            border.color: Theme.border
                            radius: 4
                        }
                        color: Theme.textPrimary
                    }
                    ToolButton {
                        icon.source: "../icons/outline/filter.svg"
                        icon.color: Theme.textSecondary
                    }
                }
            }
        }
        
        // Asset List
        ListView {
            id: assetList
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            model: [
                { name: "shot_010_lighting.mov", type: "Video", proxy: "Proxied", size: "1.2 GB" },
                { name: "main_score_v2.wav", type: "Audio", proxy: "Original", size: "42 MB" },
                { name: "logo_reveal.dag", type: "Logic", proxy: "-", size: "12 KB" },
                { name: "bg_texture_4k.exr", type: "Image", proxy: "Transcoding", size: "89 MB" },
                { name: "render_comp_final.comp", type: "Comp", proxy: "-", size: "450 KB" }
            ]
            
            delegate: ItemDelegate {
                width: parent.width
                height: 48
                
                background: Rectangle {
                    color: hovered ? Theme.panel : "transparent"
                    Rectangle {
                        anchors.bottom: parent.bottom
                        width: parent.width; height: 1
                        color: Theme.border; opacity: 0.2
                    }
                }
                
                contentItem: RowLayout {
                    spacing: 12
                    
                    // Thumbnail / Icon Placeholder
                    Rectangle {
                        width: 40; height: 28
                        color: Theme.surface
                        border.color: Theme.border
                        radius: 4
                        Text {
                            anchors.centerIn: parent
                            text: modelData.type[0]
                            font: Theme.monoFont
                            color: Theme.textSecondary
                        }
                    }
                    
                    ColumnLayout {
                        spacing: 0
                        Layout.fillWidth: true
                        Text {
                            text: modelData.name
                            font: Theme.smallFontBold
                            color: Theme.textPrimary
                            elide: Text.ElideRight
                        }
                        Text {
                            text: modelData.type + " | " + modelData.size
                            font: Theme.monoFont
                            color: Theme.textSecondary
                            opacity: 0.6
                        }
                    }
                    
                    // Proxy Status Badge
                    Rectangle {
                        Layout.preferredWidth: 70
                        Layout.preferredHeight: 18
                        radius: 4
                        color: modelData.proxy === "Proxied" ? Theme.success : 
                               modelData.proxy === "Transcoding" ? Theme.warning : 
                               modelData.proxy === "Original" ? Theme.primary : "transparent"
                        opacity: modelData.proxy === "-" ? 0 : 0.15
                        
                        Text {
                            anchors.centerIn: parent
                            text: modelData.proxy
                            font: Theme.monoFont
                            font.pixelSize: 9
                            color: parent.color
                            opacity: 1
                        }
                    }
                }
            }
            
            ScrollIndicator.vertical: ScrollIndicator { }
        }
        
        // Footer Stats
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 24
            color: Theme.base
            border.color: Theme.border
            
            Text {
                anchors.centerIn: parent
                text: "5 Assets | Total Size: 1.35 GB | 80% Proxied"
                font: Theme.monoFont
                font.pixelSize: 9
                color: Theme.textSecondary
            }
        }
    }
}
