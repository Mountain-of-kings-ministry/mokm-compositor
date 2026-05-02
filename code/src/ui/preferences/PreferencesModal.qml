import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import ".."

Dialog {
    id: root
    title: "PREFERENCES"
    width: 450; height: 400
    standardButtons: Dialog.Ok | Dialog.Cancel
    anchors.centerIn: parent
    modal: true

    background: Rectangle {
        color: Theme.base
        border.color: Theme.border
        radius: 12
    }

    contentItem: ColumnLayout {
        spacing: 16
        Text { text: "SYSTEM PREFERENCES"; font: Theme.smallFontBold; color: Theme.textSecondary }
        
        RowLayout {
            Text { text: "Max Cache Size"; font: Theme.smallFont; color: Theme.textSecondary; Layout.preferredWidth: 100 }
            Slider { Layout.fillWidth: true; from: 1; to: 64; value: 8 }
            Text { text: "8 GB"; font: Theme.monoFont; color: Theme.primary }
        }
        
        RowLayout {
            Text { text: "Render Engine"; font: Theme.smallFont; color: Theme.textSecondary; Layout.preferredWidth: 100 }
            ComboBox { 
                model: ["Vulkan (Hardware)", "OpenGL", "Software (CPU)"] 
                Layout.fillWidth: true
            }
        }
        
        RowLayout {
            Text { text: "UI Scaling"; font: Theme.smallFont; color: Theme.textSecondary; Layout.preferredWidth: 100 }
            SpinBox { value: 100; from: 50; to: 200; stepSize: 25 }
            Text { text: "%"; color: Theme.textSecondary }
        }

        CheckBox { text: "Enable Auto-Save (Every 5 min)"; font: Theme.smallFont; checked: true; palette.text: Theme.textSecondary }
        CheckBox { text: "High-Quality Preview while Idle"; font: Theme.smallFont; checked: true; palette.text: Theme.textSecondary }

        Item { Layout.fillHeight: true }
    }
}
