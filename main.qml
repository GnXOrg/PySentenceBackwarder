import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.0

Window {
    id: mainWnd
    width: 640
    height: 270
    maximumHeight: height
    maximumWidth: width
    minimumHeight: height
    minimumWidth: width
    visible: true
    color: "#303030"
    title: qsTr("PySentenceBackwarder GUI")
    Material.theme: Material.Dark
    Material.accent: Material.Dark
    FontLoader {
        id: noto
        source: "Fonts/NotoSans-Light.ttf"
    }
    Flickable {
        id: inputTxtFlickable
        x: 5
        y: 5
        width: 630
        height: 80
        TextArea.flickable: TextArea {
            id: inputTxt
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: TextArea.Wrap
            topPadding: 0
            bottomPadding: 0
            font.family: "Noto Sans Light"
            placeholderText: qsTr("Input text")
            onTextChanged: {
                if (autoRevToggle.checked) {
                    outputTxt.clear()
                    outputTxt.append(Reverser.reverse(inputTxt.text, revModeTxt.currentText))
                }
            }
        }
        ScrollBar.vertical: ScrollBar { }
        ScrollBar.horizontal: ScrollBar { }
    }

    Button {
        id: revText
        x: 302
        y: 91
        width: 333
        height: 44
        text: qsTr("Reverse")
        font.family: "Noto Sans Light"
        onClicked: {
            outputTxt.clear()
            print(Reverser.reverse(inputTxt.text,revModeTxt.currentText))
            outputTxt.append(Reverser.reverse(inputTxt.text,revModeTxt.currentText))
        }
    }

    Switch {
        id: autoRevToggle
        x: 5
        y: 89
        text: qsTr("Auto Reverse")
        font.family: "Noto Sans Light"
    }

    ComboBox {
        id: revModeTxt
        x: 150
        y: 91
        width: 146
        height: 44
        textRole: qsTr("")
        displayText: ""
        focusPolicy: Qt.StrongFocus
        editable: true
        flat: true
        font.family: "Noto Sans Light"
        model: [ "Letters", "Words", "Lines" ]
        Material.background: "#303030"
        Material.foreground:  "#FFFFFF"
    }

    Flickable {
        id: outputTxtFlickable
        x: 5
        y: 140
        width: 630
        height: 80
        TextArea.flickable: TextArea {
            id: outputTxt
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: TextArea.Wrap
            bottomPadding: 0
            font.family: "Noto Sans Light"
            topPadding: 0
            placeholderText: qsTr("Output text")
            readOnly: true
        }
        ScrollBar.vertical: ScrollBar { }
        ScrollBar.horizontal: ScrollBar { }
    }
    MessageBox { id: msgbox }
    Button {
        id: cpyBtn
        x: 325
        y: 226
        width: 72
        height: 44
        text: qsTr("Copy")
        font.family: "Noto Sans Light"
        onClicked: {
            if (outputTxt.text != "") {
                Reverser.copy(outputTxt.text)
                msgbox.text = "Copied!"
                msgbox.title = "PySentenceBackwarder"
                msgbox.visible = true
            }
        }
    }

    Button {
        id: clrOutputBtn
        x: 403
        y: 226
        width: 113
        height: 44
        text: qsTr("Clear Output")
        font.family: "Noto Sans Light"
        onClicked: outputTxt.clear()
    }

    Button {
        id: clInputBtn
        x: 522
        y: 226
        width: 113
        height: 44
        text: qsTr("Clear Input")
        font.family: "Noto Sans Light"
        onClicked: inputTxt.clear()
    }

    Button {
        id: gitHubBtn
        x: 5
        y: 226
        width: 38
        height: 44
        text: qsTr("")
        font.family: "Noto Sans Light"
        Image {
            x: 6
            y: 10
            width: 26
            height: 25
            source: "Logos/GitHub-Mark-Light-120px-plus.png"
            fillMode: Image.Stretch
        }
        onClicked: Reverser.openBrowser("https://github.com/GnXOrg/PySentenceBackwarder")
    }

    Button {
        id: aboutBtn
        x: 49
        y: 226
        width: 72
        height: 44
        text: qsTr("ABOUT")
        font.family: "Noto Sans Light"
        onClicked: {
            msgbox.text = "Version " + Reverser.getVersion() + "\nDeveloped and maintained by tretrauit@GnXOrg (teppyboy)"
            msgbox.title = "About PySentenceBackwarder"
            msgbox.visible = true
        }
    }
}
