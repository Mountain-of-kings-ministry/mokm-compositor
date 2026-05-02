import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "project_settings"
import "preferences"
import "proxy_manager"
import "plugin_manager"
import "keyboard_shortcuts"
import QtQuick.Dialogs
import Mokm.Core 1.0
import Mokm.Database 1.0
import untitled

ApplicationWindow {
    id: mainWindow
    width: 1440
    height: 800
    visible: true
    title: ProjectManager.projectName + (ProjectManager.isDirty ? " *" : "") + " - MOKM Effector"
    color: Theme.surface

    Component.onCompleted: {
        console.log("MOKM Effector Workspace Loaded");
    }

    menuBar: MenuBar {
        id: mainMenuBar
        background: Rectangle { color: Theme.base; border.color: Theme.border; border.width: 1 }

        Menu {
            title: "File"
            Action { text: "New Project"; shortcut: "Ctrl+N"; onTriggered: ProjectManager.createNewProject("Untitled") }
            Action { text: "Open Project..."; shortcut: "Ctrl+O"; onTriggered: openProjectDialog.open() }
            MenuSeparator {}
            Action { text: "Save"; shortcut: "Ctrl+S"; onTriggered: ProjectManager.saveProject() }
            Action { text: "Save As..."; shortcut: "Ctrl+Shift+S"; onTriggered: saveAsProjectDialog.open() }
            MenuSeparator {}
            Action { text: "Exit"; onTriggered: Qt.quit() }
        }
        Menu {
            title: "Edit"
            Action { text: "Undo"; shortcut: "Ctrl+Z"; enabled: UndoManager.canUndo; onTriggered: UndoManager.undo() }
            Action { text: "Redo"; shortcut: "Ctrl+Y"; enabled: UndoManager.canRedo; onTriggered: UndoManager.redo() }
        }
        Menu {
            title: "Composition"
            Action { text: "New Composition"; shortcut: "Ctrl+N" }
            Action { text: "Composition Settings"; shortcut: "Ctrl+K" }
            MenuSeparator {}
            Action { text: "Render Queue"; shortcut: "Ctrl+M" }
        }
        Menu {
            title: "Window"
            Action { text: "Project Bin"; checkable: true; checked: true }
            Action { text: "Inspector"; checkable: true; checked: true }
            Action { text: "Timeline"; checkable: true; checked: true }
            MenuSeparator {}
            Action { text: "Reset Workspace Layout" }
        }
        Menu {
            title: "Help"
            Action { text: "About MOKM Effector" }
            Action { text: "Documentation" }
        }
    }

    // Main Workspace Layout
    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 0

            // Left Tool Sidebar
            Rectangle {
                Layout.fillHeight: true
                Layout.preferredWidth: 48
                color: Theme.base
                border.color: Theme.border
                border.width: 1

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 4
                    spacing: 4

                    Repeater {
                        model: [
                            { icon: "mouse-2.svg", name: "Select", active: true },
                            { icon: "hand-grab.svg", name: "Pan" },
                            { icon: "viewport-wide.svg", name: "3D View" },
                            { icon: "nodes.svg", name: "Nodes" },
                            { icon: "layers-intersect.svg", name: "Layers" },
                            { icon: "bolt.svg", name: "Render" }
                        ]
                        delegate: ToolButton {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 40
                            ToolTip.visible: hovered
                            ToolTip.text: modelData.name
                            background: Rectangle {
                                color: modelData.active ? Theme.primary : "transparent"
                                opacity: modelData.active ? 0.15 : 0
                                radius: 8
                                border.color: modelData.active ? Theme.primary : "transparent"
                                border.width: 1
                            }
                            icon.source: "icons/outline/" + modelData.icon
                            icon.color: modelData.active ? Theme.primary : Theme.textSecondary
                            icon.width: 22
                            icon.height: 22
                        }
                    }

                    Item { Layout.fillHeight: true }

                    ToolButton {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 40
                        ToolTip.visible: hovered
                        ToolTip.text: "System Settings"
                        icon.source: "icons/outline/settings.svg"
                        icon.color: Theme.textSecondary
                        onClicked: settingsMenu.open()
                        
                        Menu {
                            id: settingsMenu
                            y: -height
                            MenuItem { text: "Project Settings"; onClicked: projectSettingsModal.open() }
                            MenuItem { text: "Preferences"; onClicked: preferencesModal.open() }
                            MenuItem { text: "Proxy Engine Dashboard"; onClicked: proxyDashboard.open() }
                            MenuItem { text: "Extension Manager"; onClicked: pluginManagerModal.open() }
                            MenuItem { text: "Shortcut Configuration"; onClicked: shortcutMapperModal.open() }
                        }
                    }
                }
            }

            // Central Split Panels
            SplitView {
                Layout.fillWidth: true
                Layout.fillHeight: true
                orientation: Qt.Horizontal
                handle: Rectangle {
                    implicitWidth: 2
                    color: Theme.border
                    opacity: 0.5
                }

                // Project Bin (Left Panel)
                Rectangle {
                    SplitView.preferredWidth: 280
                    SplitView.minimumWidth: 220
                    color: Theme.surface
                    border.color: Theme.border

                    Loader {
                        anchors.fill: parent
                        source: "media_bin/MediaBinWorkspace.qml"
                    }
                }

                // Main Center View (Canvas & Timeline)
                SplitView {
                    orientation: Qt.Vertical
                    SplitView.fillWidth: true
                    handle: Rectangle {
                        implicitHeight: 2
                        color: Theme.border
                        opacity: 0.5
                    }

                    // Viewport / Canvas
                    Rectangle {
                        SplitView.fillHeight: true
                        color: Theme.surface
                        
                        // Workspace Grid Overlay
                        Canvas {
                            anchors.fill: parent
                            opacity: 0.03
                            onPaint: {
                                var ctx = getContext("2d");
                                ctx.strokeStyle = Theme.textSecondary;
                                ctx.lineWidth = 1;
                                for(var x=0; x<width; x+=50) {
                                    ctx.beginPath(); ctx.moveTo(x,0); ctx.lineTo(x,height); ctx.stroke();
                                }
                                for(var y=0; y<height; y+=50) {
                                    ctx.beginPath(); ctx.moveTo(0,y); ctx.lineTo(width,y); ctx.stroke();
                                }
                            }
                        }

                        Loader {
                            id: workspaceLoader
                            anchors.fill: parent
                            source: "node_editor/NodeEditorWorkspace.qml"
                        }
                        
                        // Viewport Controls
                        Row {
                            anchors.bottom: parent.bottom
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.bottomMargin: 16
                            spacing: 8
                            Rectangle {
                                width: 160; height: 32; radius: 16; color: Theme.base; opacity: 0.9
                                border.color: Theme.border; border.width: 1
                                RowLayout {
                                    anchors.fill: parent; anchors.margins: 8
                                    Text { text: "100%"; font: Theme.monoFont; color: Theme.textSecondary; Layout.alignment: Qt.AlignCenter }
                                    Rectangle { width: 1; height: 12; color: Theme.border }
                                    Text { text: "RGBA"; font: Theme.monoFont; color: Theme.textSecondary; Layout.alignment: Qt.AlignCenter }
                                }
                            }
                        }
                    }

                    // Timeline (Bottom Panel)
                    Rectangle {
                        SplitView.preferredHeight: 300
                        SplitView.minimumHeight: 150
                        color: Theme.base
                        border.color: Theme.border

                        Loader {
                            anchors.fill: parent
                            source: "timeline/TimelineWorkspace.qml"
                        }
                    }
                }

                // Attribute Inspector (Right Panel)
                Rectangle {
                    SplitView.preferredWidth: 320
                    SplitView.minimumWidth: 260
                    color: Theme.surface
                    border.color: Theme.border

                    Loader {
                        anchors.fill: parent
                        source: "attribute_inspector/AttributeInspector.qml"
                    }
                }
            }
        }

        // Status Bar
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 28
            color: Theme.base
            border.color: Theme.border

            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 12
                anchors.rightMargin: 12
                
                RowLayout {
                    spacing: 8
                    Rectangle { width: 8; height: 8; radius: 4; color: Theme.success }
                    Text {
                        text: "System Ready"
                        font: Theme.smallFontBold
                        color: Theme.textSecondary
                    }
                }
                
                Text {
                    text: "| Comp: Main_Render | Frame: 0 / 240 | Proxy: On"
                    font: Theme.monoFont
                    color: Theme.textSecondary
                    opacity: 0.7
                }
                
                Item { Layout.fillWidth: true }
                
                Text {
                    text: "Engine: ThorVG v0.1 | API: Vulkan 1.3 | Threads: 8 | Mem: 124MB"
                    font: Theme.monoFont
                    color: Theme.primary
                    opacity: 0.8
                }
            }
        }
    }

    // Dialogs & Modals
    PreferencesModal { id: preferencesModal }
    ProjectSettingsModal { id: projectSettingsModal }
    ProxyDashboard { id: proxyDashboard }
    PluginManagerModal { id: pluginManagerModal }
    ShortcutMapper { id: shortcutMapperModal }

    MessageDialog {
        id: recoveryDialog
        title: "Crash Recovery"
        text: "An unsaved project was found. Would you like to recover it?"
        buttons: MessageDialog.Yes | MessageDialog.No
        onAccepted: ProjectManager.loadProject("")
    }

    FileDialog {
        id: openProjectDialog
        title: "Open Project"
        nameFilters: ["MOKM Project Files (*.mokm)"]
        onAccepted: ProjectManager.loadProject(selectedFile)
    }

    FileDialog {
        id: saveAsProjectDialog
        title: "Save Project As"
        fileMode: FileDialog.SaveFile
        nameFilters: ["MOKM Project Files (*.mokm)"]
        onAccepted: ProjectManager.saveProjectAs(selectedFile)
    }
}
