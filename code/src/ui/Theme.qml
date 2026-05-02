pragma Singleton
import QtQuick

QtObject {
    // Brand & High Priority
    readonly property color primary: "#D4A017"    // Cyber Gold
    readonly property color secondary: "#B8860B"  // Dark Gold
    readonly property color accent: "#FFD700"     // Bright Gold
    
    // Backgrounds & Layers
    readonly property color surface: "#020617"    // Deep Studio Black
    readonly property color base: "#0F172A"       // Deep Slate Panel
    readonly property color panel: "#1E293B"      // Slate Card
    readonly property color border: "#334155"     // Slate Border
    
    // Status & Glows
    readonly property color glow: "#26D4A017"     // 15% opacity primary
    readonly property color success: "#10B981"
    readonly property color warning: "#F59E0B"
    readonly property color danger: "#EF4444"

    // Text colors
    readonly property color textPrimary: "#F8FAFC"
    readonly property color textSecondary: "#94A3B8"
    readonly property color textDisabled: "#475569"
    readonly property color textInverse: "#020617"

    // Generic geometry
    readonly property int radius: 4
    readonly property int paddingLarge: 16
    readonly property int paddingMedium: 8
    readonly property int paddingSmall: 4

    // Standard font
    readonly property font defaultFont: Qt.font({ family: "Inter", pixelSize: 13 })
    readonly property font defaultFontBold: Qt.font({ family: "Inter", pixelSize: 13, weight: Font.Bold })
    readonly property font headerFont: Qt.font({ family: "Inter", pixelSize: 18, weight: Font.Bold })
    readonly property font smallFont: Qt.font({ family: "Inter", pixelSize: 11 })
    readonly property font smallFontBold: Qt.font({ family: "Inter", pixelSize: 11, weight: Font.Bold })
    readonly property font monoFont: Qt.font({ family: "JetBrains Mono", pixelSize: 10 })
}
