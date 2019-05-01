# tagspaces
Docker Container build from https://github.com/tagspaces/tagspaces

DOCKER Hub: https://hub.docker.com/r/phreakazoid/tagspaces/

For testing without permanent Data Volume:

docker run --restart=unless-stopped -it -d \
--name "tagspaces" \
-p 8080:8080 \
-t phreakazoid/tagspaces:latest

--------------------------------------------

docker run --restart=unless-stopped -it -d \
--name "tagspaces" \
-p 8080:8080 \
-v /opt/tagspaces:/tagspaces \
-t phreakazoid/tagspaces:latest
