### Nexus Artifact Repository
Nexus is a repository manager that allows you to store and manage your build artifacts, such as JAR files, Docker images, and more. It provides a central location for your team to access and share these artifacts, making it easier to manage dependencies and ensure consistency across your projects.

### Basic Nexus commands

**List all repositories:**
`curl -u admin:nexus123 -X GET 'http://<PUBLIC_IP>:8081/service/rest/v1/repositories'`

**List all components in the maven-snapshots repository:**
`curl -u dominik:nexus123 -X GET 'http://<PUBLIC_IP>:8081/service/rest/v1/components?repository=maven-snapshots'`

When you build a modern application, your code is only a tiny fraction of the final product. The rest is made up of external open-source libraries (dependencies), like Spring Boot, Apache Commons, or log4j.

To manage all these pieces efficiently and securely, an artifact repository manager like Sonatype Nexus splits storage into two completely different architectural concepts: Proxy Repositories and Hosted Repositories.

1. **Proxy Repositories**: intermediary cache that sits directly between your local development environment and the public internet (such as Maven Central, npmjs, or Docker Hub).
   1. **The Request (MISS):** You run a Maven build on your MacBook. Your project needs a library, say `spring-core-6.x.jar`. Maven asks your cloud Nexus server for it.
   2. **The Fetch:** Nexus checks its local storage disk `(/opt/sonatype-work/)`. If it has never seen this file before, this is called a Cache Miss. Nexus instantly reaches out across the public internet to Maven Central, downloads the `.jar` file, saves a copy to its local disk, and passes it back to your laptop.
   3. **The Shortcut (HIT):** Ten minutes later, your CI/CD deployment pipeline runs a build needing that exact same `spring-core-6.x.jar`. This time, Nexus finds it instantly on its own disk. This is a Cache Hit. Nexus serves it directly to your pipeline without touching the public internet.

2. **Hosted Repositories**: A Hosted Repositories does not talk to the internet at all. It is a strictly internal, write-once storage space dedicated entirely to housing your company's own proprietary software components.

   1. Your company writes a custom internal module, for example, my-fintech-app-1.0.jar.

   2. Your Jenkins or GitHub Actions CI/CD pipeline compiles the code, passes the security checks, and uses a command like mvn deploy to upload ("publish") that proprietary .jar file straight up to your Nexus Hosted Repository.

   3. It is stored there securely. Other engineering teams inside your company can now configure their own Maven projects to download your new library straight from Nexus, without your code ever being exposed to the public internet.

![Nexus Repo Type](nexus_repo_type.png)


