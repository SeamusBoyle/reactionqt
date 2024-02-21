import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import com.mycompany.qmlcomponents 1.0

Window {
    id: root

    property bool allowCounting: true
    property int counter: 0

    width: 640
    height: 900
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

    property var fruitListViewModel: QtObject {
        property var fruitModel: [
            { name: "Banana", cost: 1.50 },
            { name: "Apple", cost: 2.00 },
            { name: "Orange", cost: 1.80 },
            { name: "Grapes", cost: 3.50 },
            { name: "Kiwi", cost: 2.20 }
        ]
        property string textRole: 'name'
        property string valueRole: 'cost'
        property int selectedFruitIndex: -1

        property string costText

        onSelectedFruitIndexChanged: {
            if (selectedFruitIndex == -1) {
                costText = ''
                return
            }

            const fruitName = fruitModel[selectedFruitIndex][textRole]
            const price = fruitModel[selectedFruitIndex][valueRole]
            costText = '%1 $%2'.arg(fruitName).arg(price)
        }
    }

    ColumnLayout {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right

        Counter {
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

        FruitSelector {
            id: fruitSelector
            fruitModel: fruitListViewModel.fruitModel
            fruitModelTextRole: fruitListViewModel.textRole
            fruitModelValueRole: fruitListViewModel.valueRole
            selectedFruitIndex: fruitListViewModel.selectedFruitIndex
            costText: fruitListViewModel.costText

            onSelectedFruitIndexChanged: fruitListViewModel.selectedFruitIndex = selectedFruitIndex

            Binding {
                target: fruitSelector
                property: "selectedFruitIndex"
                value: fruitListViewModel.selectedFruitIndex
            }
        }

        FruitSelector {
            id: fruitSelector2
            fruitModel: fruitListViewModel.fruitModel
            fruitModelTextRole: fruitListViewModel.textRole
            fruitModelValueRole: fruitListViewModel.valueRole
            selectedFruitIndex: fruitListViewModel.selectedFruitIndex
            costText: fruitListViewModel.costText

            onSelectedFruitIndexChanged: fruitListViewModel.selectedFruitIndex = selectedFruitIndex

            Binding {
                target: fruitSelector2
                property: "selectedFruitIndex"
                value: fruitListViewModel.selectedFruitIndex
            }
        }
    }
}
