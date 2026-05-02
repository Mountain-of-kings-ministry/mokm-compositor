# UI module - aggregates UI resources
# Note: QML files are registered in the main project CMakeLists.txt via qt_add_qml_module

add_library(ui INTERFACE)
target_include_directories(ui INTERFACE .)
