AEM-Vagrant, for quicky setting up a publisher and dispatcher on a Centos/7 box.
This can also be used with an author, if an author is desired, uncomment the necessary lines in the setup.sh and start.sh scripts.

To setup:

1. Install vagrant and virtualbox (Optional, install chefdk, it is usually installed with the setup)
2. Install Omnibus, vbguests and hostsupdater vagrant plugins
3. Move your license.properties and quickstart files to the dependencies folder(the jar file needs to be named "AEM_6.5_Quickstart.jar", if you are using a different version, please change the name in the scripts.
4. Start with "vagrant up --provision" with admin rights on a cmd inside the directory of this git repo.
If it fails with vbguests not working, etc. Execute the same command again.
If it fails with an error and asks for "vagrant reload" then execute that command and then execute "vagrant up --provision" again to finish the setup. (This seems to be an issue with the box, on the TODO list).
5. Wait for around 10-20 mins, and access the publisher or through dispatcher with either 192.168.2.111:4503 or aem-live.com accordingly.
If after 20 mins it still shows 404, no resource found. halt the machine and bring it back up again.

http://download.macromedia.com/dispatcher/download/dispatcher-apache2.4-linux-x86_64-ssl-4.3.2.tar.gz
Make sure this is the latest version of dispatcher, if not download the latest here and modify the setup-aem.sh bash script:
https://helpx.adobe.com/experience-manager/dispatcher/release-notes.html#Downloads
