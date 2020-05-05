echo "Installing Python3"
sudo apt-get install python3
echo "Installing PIP"
sudo apt-get install python3-pip
echo "Installing Nuitka"
wget -O - http://nuitka.net/deb/archive.key.gpg | sudo apt-key add -
echo >/etc/apt/sources.list.d/nuitka.list "deb http://nuitka.net/deb/stable/bionic bionic main" # Bionic Beaver trick because Focal Fossa isnt available yet.
sudo apt-get update
sudo apt-get install nuitka
echo "Copying required files to a temporary dir..."
echo "Building... (Linux)"
python3 -m nuitka --standalone PySentenceBackwarder.py
echo "Copying the file to Output directory (Linux)"
rm -rf Output
mkdir Output
cp PySentenceBackwarder.dist/PySentenceBackwarder Output/PySentenceBackwarder_Linux
echo "Building... (Windows x64)"
python3 -m nuitka --standalone --mingw64 PySentenceBackwarder.py
echo "Ignore the error, its safe as long as we get the .exe"
echo "Copying the file to Output directory (Windows x64)"
cp PySentenceBackwarder.dist/PySentenceBackwarder.exe Output/PySentenceBackwarder_Win64.exe
echo "Cleaning up..."
rm -rf PySentenceBackwarder.dist/
rm -rf PySentenceBackwarder.build/
echo "Completed build."