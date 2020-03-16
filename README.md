[![Docker Pulls](https://img.shields.io/docker/pulls/jorisvos037/docker-pufferpanel.svg)](https://hub.docker.com/r/jorisvos037/pufferpanel/)

This docker image provides a [PufferPanel](http://www.pufferpanel.com/) container.

# Get started
If you just want to get on with it you can run the following
```
docker run -d \
    -p 8080:8080 \
    -p 25565:25565 \
    -p 5657:5657 \
    -p 5656:5656 \
    -e VIRTUAL_HOST=<your host> \
    -e VIRTUAL_PORT=<your port> \
    --name pufferpanel jorisvos/pufferpanel
```

# Explanation
If you want a bit more explenation, here it is

## Environment variables
* VIRTUAL_HOST - default: localhost      - this is your (public) ip or domain (e.g. panel.example.com)
* VIRTUAL_PORT - default: 8080           - this is the port number that is used for the web interface (panel.example.com:8080)
* ADMIN_NAME   - default: root           - this is the login name of the admin user
* ADMIN_PW     - default: pufferpanel    - this is the login password of the admin user
* ADMIN_EMAIL  - default: root@localhost - this is the login email of the admin user (this is used to login)

## Ports
* 25565 - this can be changed! - this is the default port number of a minecraft server (and thus needed to access the actual mc server)
* 5657  - this is the port number that is used by pufferpanel to connect to the SFTP server (for transferring files to and from the server)
* 5656  - this is the port number that is used by the pufferpanel daemon
* 8080  - this can be changed! - this is the port number used by the webserver to access the web interface

## Admin user
The admin user by default has the following login:
- Email: root@localhost
- Password: pufferpanel

### Important!
Please change your Password immediately! (if you didn't specify it at the creation of the container)
