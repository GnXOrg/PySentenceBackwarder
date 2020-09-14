// CenteredDialog.qml
import QtQml 2.2

import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.0

Dialog {
    parent: ApplicationWindow.overlay
    x: (parent.width - width) / 2
    y: (parent.height - height) / 2
    Material.background: "#303030"
    focus: true
    modal: true

    property alias text: messageText.text

    Label {
        id: messageText

        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter

        anchors.fill: parent
        Material.foreground:  "#FFFFFF"
    }

    standardButtons: Dialog.Ok
}
