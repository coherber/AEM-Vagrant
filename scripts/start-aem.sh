#!/bin/bash
#if [[ -d "/home/aem/author/crx-quickstart"  && -d "/home/aem/publish/crx-quickstart" ]]
if [ -d "/home/aem/publish/crx-quickstart" ]
then
  echo "--->Starting Author and publish instances from bash scripts"
    #sudo bash /home/aem/author/crx-quickstart/bin/start
    sudo bash /home/aem/publish/crx-quickstart/bin/start
else
  echo "--->Author and publisher environments have not been created, please run vagrant up --provision"
fi