# puppet_compose
Puppet server at docker compose &amp;&amp; puppet agent at ubuntu container

# up compose
docker-compose up

# build image 
docker build -f Dockerfile_puppet_agent . -t puppetagent

# run container
docker run -it --rm --network puppet_default -p 80:80 puppetagent bash

