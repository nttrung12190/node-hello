pipeline {
    environment {
        registry = "nttrung12190/hello"
        registryCredential = credentials('dockerhub')
        dockerImage = ''
    }
    agent any
    stages {
        stage('Building image') {
            steps{
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
        stage('Deploy Image') {
            steps{
                script {
                    docker.withRegistry( 'https://hub.docker.com/repository/docker/nttrung12190/hello', registryCredential ) {
                        dockerImage.push()
                    }
                }
            }
        }
        // stage('Deploy') {
        //     steps {
        //         sh '''
        //             echo $docker_pass | docker login --username nttrung12190 --password-stdin

        //         '''
        //     }
        // }
        stage('Remove Unused docker image') {
            steps{
                sh "docker rmi $registry:$BUILD_NUMBER"
            }
        }
    }
}



// docker build -t hello/v1 .
// docker run -p 3000:3000 -e ENV=$ENV -e VERSION=$VERSION --name hello -d hello/v1