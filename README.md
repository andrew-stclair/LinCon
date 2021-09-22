# Linux desktop in a container

Based almost entirely on linuxserver.io's webtop ubuntu-xfce containers

## Configuration and building

Edit the dockerfile with packages you wish to use in the container, or just leave it as is and install them later.

Edit the docker-compose file with container settings you wish to use, it defaults to 4gb of ram max.

Create a webtop.env file containing `PASSWORD=<password>` changing out the password with one you wish to use for the web interface.

Run `docker-compose up --build` to build the container if you have not done so, or just `docker-compose up` to start it

## Adding software later

To add software after already starting the container, just edit the dockerfile with your changes and run `docker-compose up --build`. please note however this will remove all files and software from previous boots that do not reside in the users home folder.

## Accessing the gui

The GUI is available at http://localhost:3000

## Other notes

The home folder in this repository contains the files and folders from the home folder in the container.