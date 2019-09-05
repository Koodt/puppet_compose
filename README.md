# Puppet_compose
Puppet server at docker compose and puppet agent at ubuntu container

# 0. Clone this repository && cd 

# 1. Up compose
docker-compose up

# 2. Build the image 
cd Dockerfile && docker build -f Dockerfile_puppet_agent . -t puppetagent

# 3. Run the container
docker run -it --rm --network puppetcompose_default --name selectel -p 80:80 puppetagent bash

# 4. Run puppet agent inside container
/opt/puppetlabs/bin/puppet agent -t

# 5. Inspect container
docker container inspect selectel |grep "IPAddress"

# 6. Get request
curl `docker container inspect selectel |grep -oE "(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[2-9][0-9]?)"`

