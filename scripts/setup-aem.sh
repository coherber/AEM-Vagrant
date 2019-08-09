#!/bin/sh
# bash script to create directories and move files to appropriate dir.

echo "--->Installing httpd"
yes | sudo yum install httpd

echo "--->Starting httpd"
sudo systemctl start httpd

echo "--->Disabling firewalld"
sudo systemctl stop firewalld
sudo systemctl disable firewalld

cd /home



if [ ! -d "/home/aem" ]; then
    echo "--->Creating Author and publish dirs, /vagrant/aem/{author,publish}"
    sudo mkdir -p /home/aem/{author,publish,dispatcher}

    echo "--->Moving files"
    #sudo cp /vagrant/dependencies/{AEM_6.5_Quickstart.jar,license.properties} /home/aem/author
    sudo cp /vagrant/dependencies/{AEM_6.5_Quickstart.jar,license.properties} /home/aem/publish

    echo "--->Renaming jar"
    #sudo mv /home/aem/author/AEM_6.5_Quickstart.jar /home/aem/author/cq5-author-p4502.jar
    sudo mv /home/aem/publish/AEM_6.5_Quickstart.jar /home/aem/publish/cq5-publish-p4503.jar
fi
	
	echo "--> Downloading Dispatcher"
	sudo curl -o dispatcher-ssl-4.3.2.tar.gz http://download.macromedia.com/dispatcher/download/dispatcher-apache2.4-linux-x86_64-ssl-4.3.2.tar.gz
	
	echo "--> extracting tar ball"
	tar -xvf dispatcher-ssl-4.3.2.tar.gz
	
	echo "--> Moving .so file to etc/httpd/modules"
	#If this fails check the version of dispatcher downloaded
	sudo cp dispatcher-apache2.4-4.3.2.so /etc/httpd/modules
	
	echo "--> updating conf file"
	yes | sudo cp /vagrant/dependencies/httpd.conf /etc/httpd/conf
	
	echo "--> Updating dispatcher.any file"
	yes | sudo cp /vagrant/dependencies/dispatcher.any /etc/httpd/conf


# Uncomment if you have a PC capable of running both environments in a virtual box

#if [ ! -d "/home/aem/author/crx-quickstart" ]; then
#    echo "--->Unpacking and updating start files"
#    cd /home/aem/author
#    sudo java -jar cq5-author-p4502.jar -unpack
#    echo "--->Updating AUTHOR start file"
#	cp /vagrant/dependencies/start-author /home/aem/author/crx-quickstart/bin
#    yes | sudo mv /home/aem/author/crx-quickstart/bin/start-author /home/aem/author/crx-quickstart/bin/start
#fi
    
if [ ! -d "/home/aem/publish/crx-quickstart" ]; then
    echo "--->cding to publish dir."
    cd
    cd /home/aem/publish
    sudo java -jar cq5-publish-p4503.jar -unpack
    echo "--->Updating PUBLISH start file"
	cp /vagrant/dependencies/start-publish /home/aem/publish/crx-quickstart/bin
    yes | sudo mv /home/aem/publish/crx-quickstart/bin/start-publish /home/aem/publish/crx-quickstart/bin/start 

fi

echo "--> Restarting httpd"
sudo systemctl restart httpd
