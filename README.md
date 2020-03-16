# PufferPanel

PufferPanel for Minecraft in a Box.

http://www.pufferpanel.com

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

The default User is:

```
ADMIN_NAME root
ADMIN_PW pufferpanel
ADMIN_EMAIL root@localhost
```

Please change your Password immediately!
