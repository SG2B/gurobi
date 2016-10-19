# docker-gurobi
This repository contains a Dockerfile to create a Docker image for solving linear programming optimization problems with Gurobi. The Docker image is available via Docker Hub.

# Usage

```
docker run -e 'GUROBI_LICENSE=your-license-key' -v /path/to/license:/home/gurobi -v /path/to/scripts:/opt/gurobi/linux64/scripts --network 'host' sg2b/gurobi
```

# With docker-compose

```
version: '2'

services:
  gurobi:
    image: sg2b/gurobi
    container_name: gurobi652
    environment:
      - 'GUROBI_LICENSE=your-license-key'
    volumes:
      - /path/to/license:/home/gurobi
      - /path/to/scripts:/opt/gurobi/linux64/scripts
    network_mode: "host"
```