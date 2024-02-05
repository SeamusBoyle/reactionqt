import QtQuick.Controls 2.15

import com.mycompany.qmlcomponents 1.0

Action {
    required property Reaction target
    enabled: target.canExecute
    onTriggered: target.execute()
}
