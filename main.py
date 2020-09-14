# This Python file uses the following encoding: utf-8
import subprocess
import webbrowser
import sys
import os
import resources
import asyncio

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, QUrl, Slot


version = "v1.0.0_qmlui"

class Reverser(QObject):
    @Slot(str, str, result=str)
    def reverse(self, string, reversemode):
        if reversemode == 'Letters':
            return "".join(reversed(string))
        elif reversemode == 'Words':
            return " ".join(reversed(string.split(" ")))
        elif reversemode == 'Lines':
            return "\n".join(reversed(string.split("\n")))
        else:
            if string == None or string == "":
                return "Empty string."
            elif reversemode == None or reversemode == "":
                return "Invalid reverse mode."
    @Slot(str)
    def copy(self, string):
        cb = QGuiApplication.clipboard()
        cb.clear(mode=cb.Clipboard)
        cb.setText(string, mode=cb.Clipboard)
    @Slot(str)
    def openBrowser(self, url):
        if sys.platform == 'Darwin':    # in case of OS X
            subprocess.Popen(['open', url])
        else:
            webbrowser.open_new_tab(url)
    @Slot(result=str)
    def getVersion(self):
        return version

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    engine.load(os.path.join(os.path.dirname(__file__), "main.qml"))
    reverser = Reverser()
    engine.rootContext().setContextProperty("Reverser", reverser)
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
