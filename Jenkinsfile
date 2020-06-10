pipeline {
    environment {
        registry = "nttrung12190/hello"
        registryCredential = 'dockerhub'
    }
    agent any
    stages {
        stage('Build Image') {
            steps {
                script {
                    docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
    }
}



// docker build -t hello/v1 .
// docker run -p 3000:3000 -e ENV=$ENV -e VERSION=$VERSION --name hello -d hello/v1