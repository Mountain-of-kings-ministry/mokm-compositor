import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import ".."

Dialog {
    id: root
    title: "EXTENSION MANAGER"
    width: 500; height: 600
    standardButtons: Dialog.Close
    anchors.centerIn: parent
    modal: true

    background: Rectangle {
        color: Theme.base
        border.color: Theme.border
        radius: 12
    }

    contentItem: ColumnLayout {
        spacing: 12
        Text { text: "INSTALLED PLUGINS"; font: Theme.smallFontBold; color: Theme.textSecondary }
        
        ListView {
            Layout.fillWidth: true; Layout.fillHeight: true; clip: true
            model: [
                { name: "MOKM_Grade_Core", version: "1.0.2", provider: "Built-in", type: "OFX" },
                { name: "ThorVG_Vector_Suite", version: "0.8.5", provider: "Built-in", type: "Render" },
                { name: "Vst3_Audio_Host", version: "2.1.0", provider: "Steinberg", type: "Audio" }
            ]
            delegate: Rectangle {
                width: parent.width; height: 50; color: "transparent"
                RowLayout {
                    anchors.fill: parent; anchors.margins: 8; spacing: 12
                    Rectangle { width: 32; height: 32; radius: 4; color: Theme.panel }
                    ColumnLayout {
                        Layout.fillWidth: true; spacing: 0
                        Text { text: modelData.name; font: Theme.smallFontBold; color: Theme.textPrimary }
                        Text { text: modelData.provider + " | v" + modelData.version; font: Theme.monoFont; font.pixelSize: 9; color: Theme.textSecondary }
                    }
                    Button { text: "Manage"; font: Theme.smallFontBold; background: Rectangle { color: Theme.panel; border.color: Theme.border; radius: 4 } }
                }
                Rectangle { anchors.bottom: parent.bottom; width: parent.width; height: 1; color: Theme.border; opacity: 0.2 }
            }
        }
    }
}
