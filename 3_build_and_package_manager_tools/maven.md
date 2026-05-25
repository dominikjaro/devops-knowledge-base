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