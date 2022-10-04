---
layout: post
title:  "Object Path Analyzer"
date: 2022-10-04 00:00:00 +0200
categories: [Node-RED, Recipe]
---
A demonstration (proof-of-concept) tool based on Node-RED dashboard that can be used to analyze object path captured by [ObjectPath ACAP]({{ site.url}/acap/mqtt/component/2022/10/03/objectpath.html }}).
The deployment uses docker container that includes Node-RED and MongoDB.  Once installed, the Node-RED application is then fetched from GitHub as a project.

![image]({{ site.url }}/assets/objectpath-analyzer.jpg)

# Prerequisite
1. Linux computer with git, docker and docker-composed installed
2. One or more Axis cameras
3. [Object Path Capture ]({{ site.url}/acap/mqtt/component/2022/10/03/objectpath.html }}) ACAP installed and configured in the cameras(s)
4. An MQTT Broker

# Installing and configuring container
1. Clone repository (typically from in the home directory)
```
git clone https://github.com/pandosme/axis-common-node-red.git
```
2. Change the diretory name (optional)
```
mv axis-common-node-red objectpath-analyzer
```
3. Go into directory
```
cd  objectpath-analyzer
```
4. Change branch to use Node-RED with MongoDB
```
git checkout mongodb
```
5. Change container settings (optional)
```
nano docker-compose.yaml
```
Change default values if needed
_The instructions assumes you change the container name to objectpath-analyzer_
- ports: - '8600:1880'
- environment:TZ = Europe/Stockholm
- nodered:container_name: objectpath-analyzer
Save and exit
6. Fetch containers
```
sudo docker-compose pull
```
7. Fetch required Node-RED packages
```
sudo docker-compose up -d
sudo docker exec -it objectpath-analyzer bash
cd /data
npm install
exit
sudo docker-compose down
```
8. Change Node-RED settings (optional)
```
nano settings.js
```
- httpAdminRoot: '/admin',   (Default flows view url http://address:8600/admin)
- ui: { path: "/" },         (Default dashboard url http://address:8600/)
- adminAuth:                 (Default disabled.  It is recommended that you enable admin credentials.  See [Securing Node-RED](https://nodered.org/docs/user-guide/runtime/securing-node-red#editor--admin-api-security))
- httpNodeAuth:              (Default disabled.  It is recommeded to enable credentials to dashboard view. See [Securing Dasboard](https://nodered.org/docs/user-guide/runtime/securing-node-red#http-node-security))
- contextStorage:            (Default enabled.  Contect data will be stored and retained between reboots)
- projects:                  (Default enable.  Allows to revisioning of local projects or import remote repositories)  
- credentialSecret           (Set your own key to encrypt sensative data on host)
9. Start Container
```
sudo docker-compose up -d
```

# Installing Object Path Analyzer in Node-RED
1. Use a Browser and go to http://address:8600/admin
2. View Welocome messges or stop by clicking on X
3. Select Clone repository
4. Enter username and email for the local Git client (this data will not be sent anywhere)
5. Paste below string in "Git repository URL"
```
https://github.com/pandosme/objectpath-analyzer.git
```
6. Click Clone Project
Done!

# Initialializing the flows
The flows will need to have credentials to your MQTT Broker and your cameras.
1. Select tab "MQTT Data"
2. Double-click the purple MQTT subscription node
3. Click the pen after "Broker" and enter your MQTT Broker settings.  Click "Done"
4. Select tab "Cameras"
5. Double-click the orange node "Device Info".
6. Click the pen after Device "Cameras"
7. Leave "Address" blank but enter your cameras credential (User/Password).  Click "Done"
6. Click Deploy
7. Go to http://address:8600/
8. Select menu "Cameras"
9. For each of the camera that has ObjectPath installed, add name and address and click "Submit"  
Successful connections should add camera in table
10. Select Query in the menu

Done.  Wait for ObjectPath capture to populate the database with paths.  Then select camera and filter to view/analyze paths.

Wait for ObjectPath capture ACAP to populate the database...
