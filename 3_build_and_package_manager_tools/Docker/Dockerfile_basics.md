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


#### Docker compose example

#### Docker networking

#### Docker volumes

#### Docker best practices

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

4. Don't run as root user in the container. Create a non-root user and switch to that user in the Dockerfile to improve security.
```Dockerfile
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser
```

5. Scan images for vulnerabilities regularly

(you can use tools like docker scout and also can scan it in your CI/CD pipeline)