import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root

    property int count
    property bool counterEnabled

    property alias actionCountUp: clickMeButton.action
    property alias actionReset: resetButton.action

    implicitWidth: buttonBox.implicitWidth
    implicitHeight: 300

    Label {
        anchors.centerIn: parent
        text: `Current count: ${root.count}`
        horizontalAlignment: Text.AlignHCenter
        font.pointSize: 24
    }

    Row {
        id: buttonBox
        spacing: 10

        Button {
            id: clickMeButton
            text: "Click me"
        }

        Button {
            id: onOffButton
            text: root.counterEnabled ? "Disable counter" : "Enable counter"
            onClicked: root.counterEnabled = !root.counterEnabled
        }

        Button {
            id: resetButton
            text: "Reset"
        }
    }
}
