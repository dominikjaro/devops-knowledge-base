## Jenkinsfile

The Jenkinsfile can be written in either Declarative or Scripted syntax, with Declarative being the more modern and recommended approach. The scripted is written in groovy and is more flexible, but it can be more complex to read and maintain. The Declarative syntax provides a simpler and more structured way to define your pipeline.

### Jenkins Declarative Syntax

```
pipeline {
    stages {
        stage("build"){
            steps {
                echo "building the application"
            }
        }
        stage("test"){
            steps {
                echo "running tests"
            }
        }
    }
}
```

