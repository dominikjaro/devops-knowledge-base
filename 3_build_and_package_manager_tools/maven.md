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