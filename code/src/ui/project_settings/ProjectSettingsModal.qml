import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import ".."

Dialog {
    id: root
    title: "PROJECT SETTINGS"
    width: 400; height: 350
    standardButtons: Dialog.Save | Dialog.Cancel
    anchors.centerIn: parent
    modal: true

    background: Rectangle {
        color: Theme.base
        border.color: Theme.border
        radius: 12
    }

    contentItem: ColumnLayout {
        spacing: 16
        Text { text: "COMPOSITION PROPERTIES"; font: Theme.smallFontBold; color: Theme.textSecondary }
        
        RowLayout {
            Text { text: "Resolution"; font: Theme.smallFont; color: Theme.textSecondary; Layout.preferredWidth: 80 }
            TextField { text: "1920"; font: Theme.monoFont; Layout.fillWidth: true; background: Rectangle { color: Theme.surface; radius: 4; border.color: Theme.border } }
            Text { text: "x"; color: Theme.textSecondary }
            TextField { text: "1080"; font: Theme.monoFont; Layout.fillWidth: true; background: Rectangle { color: Theme.surface; radius: 4; border.color: Theme.border } }
        }
        
        RowLayout {
            Text { text: "Frame Rate"; font: Theme.smallFont; color: Theme.textSecondary; Layout.preferredWidth: 80 }
            ComboBox { 
                model: ["23.976 fps", "24.00 fps", "25.00 fps", "30.00 fps", "60.00 fps"] 
                Layout.fillWidth: true
                currentIndex: 1
            }
        }
        
        RowLayout {
            Text { text: "Color Space"; font: Theme.smallFont; color: Theme.textSecondary; Layout.preferredWidth: 80 }
            ComboBox { 
                model: ["sRGB (Linear)", "ACEScg", "Rec.709", "DaVinci Wide Gamut"] 
                Layout.fillWidth: true
                currentIndex: 1
            }
        }

        Item { Layout.fillHeight: true }
    }
}
