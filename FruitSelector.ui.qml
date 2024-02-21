import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: root

    property var fruitModel
    property string fruitModelTextRole
    property string fruitModelValueRole
    property int selectedFruitIndex
    property string costText

    implicitWidth: 400
    implicitHeight: 300

    ComboBox {
        id: fruitComboBox
        width: parent.width * 0.8
        model: root.fruitModel
        currentIndex: root.selectedFruitIndex
        textRole: root.fruitModelTextRole
        valueRole: root.fruitModelValueRole

        onActivated: root.selectedFruitIndex = currentIndex

        Binding {
            target: fruitComboBox
            property: "currentIndex"
            value: root.selectedFruitIndex
        }
    }

    Text {
        anchors.centerIn: parent
        text: root.costText
        font.pixelSize: 18
    }
}
