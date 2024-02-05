import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

import com.mycompany.qmlcomponents 1.0

Window {
    id: root

    property int counter: 0
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    property Reaction actionCounterIncrease: Reaction {
        onexecute: function () {
            counter += 1
        }
    }

    property Reaction actionCounterReset: Reaction {
        onexecute: function () {
            counter = 0
        }
    }

    Label {
        anchors.centerIn: parent
        text: `Current count: ${root.counter}`
        horizontalAlignment: Text.AlignHCenter
        font.pointSize: 24
    }

    Row {
        spacing: 10
        Button {
            text: "Click me"
            action: ReactionAdapter {
                target: actionCounterIncrease
            }
        }

        Button {
            text: actionCounterIncrease.canExecute ? "Disable counter" : "Enable counter"
            onClicked: actionCounterIncrease.canExecute = !actionCounterIncrease.canExecute
        }

        Button {
            text: "Reset"
            action: ReactionAdapter {
                target: actionCounterReset
            }
        }
    }
}
