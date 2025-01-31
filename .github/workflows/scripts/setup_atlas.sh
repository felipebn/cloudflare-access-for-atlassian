#!/bin/bash
set -exu

echo "Installing Atlassian SDK"

sudo sh -c 'echo "deb https://packages.atlassian.com/debian/atlassian-sdk-deb/ stable contrib" >>/etc/apt/sources.list'
wget https://packages.atlassian.com/api/gpg/key/public
sudo apt-key add public
sudo apt-get update
sudo apt-get install atlassian-plugin-sdk

echo "Atlassian SDK installed successfully:"

atlas-version

ATLAS_MVN_HOME=$(atlas-version | grep -i "maven home" | head -n1 | cut -d ':' -f 2)

echo "Patching Atlassian SDK in ATLAS_MVN_HOME - $ATLAS_MVN_HOME ..."

cp .github/workflows/scripts/settings.xml $ATLAS_MVN_HOME/conf/settings.xml