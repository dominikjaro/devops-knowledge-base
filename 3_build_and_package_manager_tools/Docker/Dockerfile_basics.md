#### Most used docker commands

```bash
# Pull an image from a registry
docker pull <image_name>:<tag> 

# Run a container from an image
docker run -d -p 8080:80 <image_name>:<tag>

# List running containers
docker ps

# Stop a running container
docker stop <container_id>

# Remove a container
docker rm <container_id>

# List all images
docker images

# Build an image from a Dockerfile
docker build -t <image_name>:<tag> .

# Start all the containers defined in a docker-compose.yml file
docker compose up -d

# Stop all the containers defined in a docker-compose.yml file
docker compose down

# Show the history of an image, including the commands used to create each layer
docker history <image_name>:<tag> 
```

#### Dockerfile example

```dockerfile
# Use an official Node.js runtime as a parent image
FROM node:14-alpine 

# Sets environment variables for the application
ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PASSWORD=password \
    MONGO_DB_NAME=mydb

# Run the command to create a directory for the application
RUN mkdir -p /home/app

# Copy the application code from the host machine to the container
COPY ./app /home/app

# set default dir so that next commands executes in /home/app dir
WORKDIR /home/app

# will execute npm install in /home/app because of WORKDIR
RUN npm install

# no need for /home/app/server.js because of WORKDIR
CMD ["node", "server.js"]
```

---

### Docker compose example

Allowing you to define multiple containers that should run in the same network in 1 place in code.

**Docker compose file structure:** services, networks, volumes and environment variables
**Docker compose commands:** `docker compose up`, `docker compose down`, `docker compose build`, `docker compose logs`, `docker compose ps`, `docker compose exec`

```yaml
version: '3'
services:
    database:
      image: postgres:13
      environment:
        - POSTGRES_PASSWORD=password
      volumes:
        - db-data:/var/lib/postgresql/data
    api:
      build: ./api
      depends_on:
        - database
      environment:
        - DATABASE_URL=postgres://postgres:password@db:5432/postgres

    frontend:
      build: ./frontend
      depends_on:
        - api
      ports:
        - "8080:80"
volumes:
  db-data:
```

---

### Docker networking

When you have multiple container like backend, frontend, database, etc. you can use docker networking to allow them to communicate with each other.

**Docker network types:** Bridge, host overlay networks

* Bridge network: Default network type, containers on the same bridge network can communicate with each other using their container names as hostnames
* Host network: Containers share the host's network stack, which can lead to performance benefits but also security risks
* Overlay network: Used for multi-host communication in Docker Swarm, allowing containers on different hosts to communicate securely

**Example**

```bash
docker network create my_network

docker run -d --name api --network my_network my_backend_image

docker run -d --name frontend --network my_network -p 8080:80 my_frontend_image

# The frontend container can communicate with the backend using the container name "api" as the hostname, because they are in the same container network
```

---

### Docker volumes | Data persistence

Volumes store data outside of the containes.

**Volume types:** Named volumes, bind mounts, and tmpfs volumes

* Named volumes: Managed by Docker, stored in a specific location on the host machine, and can be easily shared between containers
* Bind mounts: Map a specific directory on the host machine to a directory in the container, allowing for more control over the data but can lead to security issues if not used carefully
* tmpfs volumes: Store data in memory, which can be useful for temporary data that doesn't need to persist

**Example**

```bash
docker volume create my-data

docker run -d --name mysql -v my-data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw mysql:latest
```

---

### Docker best practices

1. Use specific image tags instead of `latest` to ensure consistency across different environments (e.g. node:18.17-alpine)
2. Combine RUN commands with `&&` to reduce the number of layers in the image and improve build performance
3. Using multi-stage builds to reduce the final image size by separating the build environment from the runtime environment
   * First you use a larger image with all the build tools to compile your application, then you copy only the necessary files to a smaller image that will be used for running the application
   * Smaller images:
     * Deploy faster
     * Cost less to store
     * Fewer security issues because they have fewer components that can be exploited
  
```Dockerfile
# Build stage
FROM node:14 AS build
WORKDIR /app
COPY . .
RUN npm ci && npm run build

# Production stage
FROM node:alpine
COPY --from=build /app/build /usr/share/nginx/html
```

4. Caching: Use Docker's build cache effectively by ordering your Dockerfile instructions from least to most frequently changing. This allows Docker to reuse cached layers and speed up the build process.

```Dockerfile
# Install dependencies first to take advantage of caching
COPY package.json package-lock.json ./
RUN npm ci
# Then copy the rest of the application code
COPY . .
```

5. Don't run as root user in the container. Create a non-root user and switch to that user in the Dockerfile to improve security.

```Dockerfile
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser
```

5. Scan images for vulnerabilities regularly

(you can use tools like docker scout and also can scan it in your CI/CD pipeline)

6. Resource management: setting memoery and CPU limits
7. Health Checks: ensure container health and automatic restarts
8. Use `.dockerignore` to exclude unnecessary files from the build context, which can reduce build time and image size