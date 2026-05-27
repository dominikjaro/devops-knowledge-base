## What is Maven?

### Build Tool

It's a tool to build source code and produce an artifact or produce an output from your application.

* **Artifact:** maven produces output called Articact. It can be a jar file, a zip file.
* **Manage Dependencies:** maven can manage dependencies. It can download dependencies from the internet and add them to your project.

### Project Management Tool

* Handles Versioning/Releses
* Describes Project
* Can produce Javadocs/Site Information

## Why Use Maven?

* **Repeatable builds:** Maven provides a consistent build process. Recreate our builds for any environment.
* **Transitive dependencies:** Maven can automatically download and manage dependencies for your project. It can also handle transitive dependencies, which are dependencies of your dependencies.
* **Local Repo:** Maven maintains a local repository on your machine where it stores downloaded dependencies. This allows for faster builds and offline work. I can just download it once and reuse it across multiple projects.

* `mvn clean` - Cleans the project by deleting the target directory, which contains the compiled classes and other build artifacts.
* `mvn compile` - Compiles the source code of the project.

---

## Maven Structure

By default maven looks for `src/main/java` directory underneath the project and it compiles the code into a target directory. It does these by referencing our default and everything from the `pom.xml` file.

* **src/main/java** - This is the start of our source code. This is where we put our Java files.
* **src/test/java** - This is where we put our test code. This is where we put our unit tests.
* **target** - This is where maven puts the compiled code and other build artifacts. This is where the jar file will be created.
* **pom.xml** - This is the Project Object Model file. This is where we define our project, its dependencies, and other configurations.
  * In the pom.xml:
    * `<project>` - This is the root element of the pom.xml file. It contains all the information about the project.
    * `<groupdId>` - This is the group ID of the project. It is usually a reverse domain name. For example, `com.example`.
    * `<artifactId>` - This is the artifact ID of the project. It is usually the name of the project. For example, `my-app`.
    * `<version>` - This is the version of the project. It is usually in the format of `major.minor.patch`. For example, `1.0.0`.
    * `<packaging>` - This is the packaging type of the project. It can be `jar`, `war`, `pom`, etc. The default is `jar`.
    * `<dependencies>` - This is where we define our dependencies. We can add dependencies by adding `<dependency>` elements inside the `<dependencies>` element. Each `<dependency>` element contains the group ID, artifact ID, and version of the dependency.

### Goals

* `mvn clean` - This goal cleans the project by deleting the target directory.
* `mvn compile` - This goal compiles the source code of the project.
* `mvn package` - This goal packages the compiled code into a jar file. The jar file will be created in the target directory.
* `mvn install` - This goal installs the jar file into the local repository. This allows us to use the jar file as a dependency in other projects.
* `mvn deploy` - This goal deploys the jar file to a remote repository. This allows other developers to use the jar file as a dependency in their projects.

* **~/.m2/repository** - This is the local repository where maven stores downloaded dependencies and installed artifacts. When you run `mvn install`, the jar file will be copied to this directory. When you run `mvn package`, the jar file will be created in the target directory, but it will not be copied to the local repository until you run `mvn install`.

Everything goes with the groupID, arrifactID, and version. This is how maven identifies dependencies and artifacts. When you run `mvn install`, maven will look for the jar file in the target directory and copy it to the local repository with the appropriate group ID, artifact ID, and version.

---

### Maven Dependencies

* Just list what you need and maven will take care of the rest. It will download the dependencies and add them to your project.

```xml
<dependencies>
    <dependency>
        <groupId>org.apache.commons</groupId>
        <artifactId>commons-lang3</artifactId>
        <version>3.12.0</version>
    </dependency>
</dependencies>
```

#### Packaging Types

* **jar** - This is the default packaging type. It creates a jar file.
* **war** - This packaging type is used for web applications. It creates a war file.
* **pom** - This packaging type is used for projects that are not meant to be packaged. It is used for projects that are meant to be used as dependencies in other projects. It does not create a jar file.
* **ear** - This packaging type is used for enterprise applications. It creates an ear file.
* **maven-plugin** - This packaging type is used for maven plugins. It creates a jar file that can be used as a maven plugin.

#### Versions

* **SNAPSHOT** - This is a development version. It is not stable and can change at any time. It is usually used for testing and development purposes. It is not recommended to use SNAPSHOT versions in production.
* **Release** - This is a stable version. It is recommended to use release versions in production. It is usually used for production purposes.
* **Final** - This is a stable version. It is recommended to use final versions in production. It is usually used for production purposes.


#### Scopes

* **compile** - This is the default scope. It means that the dependency is available in all classpaths of the project. It is also included in the final artifact.
* **provided** - This scope means that the dependency is provided by the runtime environment. It is available in the compile and test classpaths, but it is not included in the final artifact.
* **runtime** - This scope means that the dependency is not needed for compilation, but it is needed for execution. It is available in the runtime and test classpaths, but it is not included in the final artifact.

---

### Maven Repositories

* **Central Repository** - This is the default repository that maven uses to download dependencies. It is a public repository that contains a large number of artifacts.
* **Local Repository** - This is the repository that maven uses to store downloaded dependencies and installed artifacts. It is located in the `~/.m2/repository` directory on your machine by default.
* **Remote Repository** - This is a repository that is hosted on a remote server. It can be a public repository or a private repository. You can configure maven to use remote repositories by adding them to the `pom.xml` file.

```xml
<repositories>
    <repository>
        <id>spring-snapshot</id>
        <url>https://repo.spring.io/libs-snapshot</url>
        <snapshots>
            <enabled>true</enabled>
        </snapshots>
        <releases>
            <enabled>false</enabled>
        </releases>
    </repository>
</repositories>
```

---

### Maven Plugins

**Phases:**

* **validate** - This phase validates the project structure and configuration.
* **compile** - This phase compiles the source code of the project.
* **test** - This phase runs the tests of the project.
* **package** - This phase packages the compiled code into a jar file.
* **integration-test** - This phase runs the integration tests of the project.
* **verify** - This phase runs any checks to verify the package is valid and meets quality criteria.
* **install** - This phase installs the jar file into the local repository.
* **deploy** - This phase deploys the jar file to a remote repository.

The **goals** is what we type at the command line and the **phase** is what maven executes. When you run `mvn package`, maven will execute all the phases up to and including the package phase. This means that it will execute the validate, compile, test, and package phases.

```xml
<build>
    <plugins>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-compiler-plugin</artifactId>
            <version>3.8.1</version>
            <configuration>
              <release>17</release>
            </configuration>
        </plugin>
    </plugins>
</build>
```

---

### BOM (Bill of Materials)

This is a special type of pom file that is used to manage the versions of dependencies. It is used to ensure that all dependencies in a project are compatible with each other. It is usually used in large projects with many dependencies.

```xml
<dependencyManagement>
    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-dependencies</artifactId>
            <version>2.5.4</version>
            <type>pom</type>
            <scope>import</scope>
        </dependency>
    </dependencies>
</dependencyManagement>
```