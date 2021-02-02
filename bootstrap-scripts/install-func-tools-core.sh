#!/bin/bash

echo "installing azure functions core tools"

apt-get update
apt-get install wget -y

wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb

apt-get update
apt-get install azure-functions-core-tools-3 -y