# PySentenceBackwarder

SentenceBackwarder but made in Python

## About

+ SentenceBackwarder but this is a remake with QtQuick UI, for old version is in master branch.

## How to use
+ Grab a release in [releases](https://github.com/GnXOrg/PySentenceBackwarder/releases) or an CI build in [GitLab CI](https://gitlab.com/teppyboy/PySentenceBackwarder/-/pipelines) correspond to your OS
  + Windows:
    1. Extract the archive into a directory, open main.exe (for CI build is in /dist/main/main.exe)
  + macOS:
    + Since i don't have a macOS device i can't compile it, i'll try to compile it using [Darling](https://www.darlinghq.org/)
    1. Install [WineHQ](https://wiki.winehq.org/MacOS)
    2. Download Windows build then run with WineHQ.
  + Linux:
    1. Extract the archive into a directory
    2. Open Terminal inside the directory where contains "main" file (for CI build is /dist/main/)
    3. Execute `chmod +x main` in terminal.
    4. Open "main"


### Building

+ Clone the project
  + Download [Git](https://git-scm.com/)
    + Windows:
      + Download Git from [git-scm](https://git-scm.com/)
    + macOS: 
      + Execute `brew install git` in Terminal
    + Linux:
      + Get Git from your package distributor (Ex: Arch Linux uses `sudo pacman -S git`)
  + Execute `git clone git@github.com:GnXOrg/PySentenceBackwarder.git` in the Terminal
  + Execute `cd PySentenceBackwarder` in the Terminal to cd to the project
+ Install Python3
  + Windows:
    + Download Python from [python.org](https://www.python.org/downloads/)
  + macOS: 
    + Download Python from [python.org](https://www.python.org/downloads/mac-osx/) or execute `brew install python` in Terminal
  + Linux: 
    + Get Python from your package distributor (Ex: Arch Linux uses `sudo pacman -S python`)
+ Create a [Virtual Environment](https://docs.python.org/3/library/venv.html) (optional)
  + Read [Creation of virtual environments](https://docs.python.org/3/library/venv.html)
+ Install dependencies
  + Execute `python -m pip install -r requirements.txt`
+ Build
  + Execute `pyinstaller main.spec`
+ Done
  + Built files will be located at `dist/main/`

#### License

[![License: LGPL v3](https://img.shields.io/badge/License-LGPL%20v3-blue.svg)](https://www.gnu.org/licenses/lgpl-3.0)
