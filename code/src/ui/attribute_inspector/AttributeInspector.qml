import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import ".."

Item {
    id: root

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        // Header
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 32
            color: Theme.base
            border.color: Theme.border
            
            Text {
                anchors.centerIn: parent
                text: "ATTRIBUTE INSPECTOR"
                font: Theme.smallFontBold
                color: Theme.textSecondary
            }
        }

        ScrollView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true

            ColumnLayout {
                width: parent.width
                spacing: 1

                // Node Section
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 24
                    color: Theme.panel
                    Text { anchors.left: parent.left; anchors.leftMargin: 8; anchors.verticalCenter: parent.verticalCenter; text: "NODE: GRADE_01"; font: Theme.monoFont; color: Theme.primary }
                }

                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.margins: 12
                    spacing: 12

                    // Transform Group
                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 8
                        Text { text: "TRANSFORM"; font: Theme.smallFontBold; color: Theme.textSecondary }
                        
                        RowLayout {
                            Text { text: "Position"; font: Theme.smallFont; color: Theme.textSecondary; Layout.preferredWidth: 60 }
                            TextField { text: "960"; font: Theme.monoFont; Layout.fillWidth: true; background: Rectangle { color: Theme.base; radius: 4; border.color: Theme.border } }
                            TextField { text: "540"; font: Theme.monoFont; Layout.fillWidth: true; background: Rectangle { color: Theme.base; radius: 4; border.color: Theme.border } }
                        }
                        RowLayout {
                            Text { text: "Scale"; font: Theme.smallFont; color: Theme.textSecondary; Layout.preferredWidth: 60 }
                            Slider { Layout.fillWidth: true; from: 0; to: 2; value: 1.0 }
                            Text { text: "1.00"; font: Theme.monoFont; color: Theme.primary; Layout.preferredWidth: 30 }
                        }
                    }

                    Rectangle { Layout.fillWidth: true; height: 1; color: Theme.border; opacity: 0.5 }

                    // Color Correction Group
                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 8
                        Text { text: "COLOR CORRECTION"; font: Theme.smallFontBold; color: Theme.textSecondary }
                        
                        RowLayout {
                            Text { text: "Exposure"; font: Theme.smallFont; color: Theme.textSecondary; Layout.preferredWidth: 60 }
                            Slider { Layout.fillWidth: true; from: -5; to: 5; value: 0.5 }
                            Text { text: "+0.5"; font: Theme.monoFont; color: Theme.primary; Layout.preferredWidth: 30 }
                        }
                        RowLayout {
                            Text { text: "Gamma"; font: Theme.smallFont; color: Theme.textSecondary; Layout.preferredWidth: 60 }
                            Slider { Layout.fillWidth: true; from: 0.1; to: 4; value: 1.0 }
                            Text { text: "1.00"; font: Theme.monoFont; color: Theme.primary; Layout.preferredWidth: 30 }
                        }
                        RowLayout {
                            Text { text: "Saturation"; font: Theme.smallFont; color: Theme.textSecondary; Layout.preferredWidth: 60 }
                            Slider { Layout.fillWidth: true; from: 0; to: 2; value: 1.2 }
                            Text { text: "1.20"; font: Theme.monoFont; color: Theme.primary; Layout.preferredWidth: 30 }
                        }
                    }
                    
                    Rectangle { Layout.fillWidth: true; height: 1; color: Theme.border; opacity: 0.5 }

                    // Masking
                    RowLayout {
                        Layout.fillWidth: true
                        Text { text: "Enable Masking"; font: Theme.smallFont; color: Theme.textSecondary; Layout.fillWidth: true }
                        CheckBox { checked: false }
                    }
                }
            }
        }
    }
}
