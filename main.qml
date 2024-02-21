import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

import com.mycompany.qmlcomponents 1.0

Window {
    id: root

    property bool allowCounting: true
    property int counter: 0

    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    property Reaction actionCounterIncrease: Reaction {
        canExecute: root.allowCounting
        onexecute: function () {
            root.counter += 1
        }
    }

    property Reaction actionCounterReset: Reaction {
        onexecute: function () {
            root.counter = 0
        }
    }

    Counter {
        anchors.fill: parent

        count: root.counter
        counterEnabled: root.allowCounting

        actionCountUp: ReactionAdapter {
            target: root.actionCounterIncrease
        }
        actionReset: ReactionAdapter {
            target: root.actionCounterReset
        }

        onCounterEnabledChanged: root.allowCounting = counterEnabled

        Binding {
            property: 'counterEnabled'
            value: root.allowCounting
        }
    }
}
