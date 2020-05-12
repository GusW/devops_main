#!/bin/bash

#######################################################################################################################
######################## This code should be run in a CLOUD INSTANCE not your PERSONAL machine ########################
#######################################################################################################################

flaskHelloWorld() {

fileName=$1

echo "from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
return 'Hello, World!'">> $fileName

}



python3 --version

# TODO: dport should be an env variable
sudo iptables -I INPUT 6 -m state --state NEW -p tcp --dport 5000 -j ACCEPT
sudo netfilter-persistent save
sudo iptables -S

sudo apt update
sudo apt install python3-pip python3-venv -y

sudo pip3 install virtualenvwrapper

bashrcFileWithPath=~/.bashrc

echo '' >> $bashrcFileWithPath
echo '# set up Python env' >> $bashrcFileWithPath
echo 'export WORKON_HOME=~/envs' >> $bashrcFileWithPath
echo 'export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3' >> $bashrcFileWithPath
echo 'export VIRTUALENVWRAPPER_VIRTUALENV_ARGS=" -p /usr/bin/python3 "' >> $bashrcFileWithPath
echo 'source /usr/local/bin/virtualenvwrapper.sh' >> $bashrcFileWithPath
source $bashrcFileWithPath

mkvirtualenv flask01
sudo pip3 install Flask


flaskProjectDirName="test"
flaskProjectFileName="hello.py"

mkdir $flaskProjectDirName && cd "$_"
touch $flaskProjectFileName
flaskHelloWorld $flaskProjectFileName

export FLASK_APP=$flaskProjectFileName

# TODO: host should be an env variable
flask run --host=0.0.0.0


















