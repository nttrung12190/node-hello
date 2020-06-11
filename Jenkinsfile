pipeline {
    environment {
        registry = "nttrung12190/hello"
        dockerImage = ''
        dockerTag = "$GIT_BRANCH-$BUILD_NUMBER"
    }
    agent any
    stages {
        stage('Building image') {
            steps{
                script {
                    dockerImage = docker.build registry + ":$dockerTag"
                }
            }
        }
        stage('Push Image') {
            steps {
                script{
                    withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                        sh '''
                            echo "$PASSWORD" | docker login --username "$USERNAME" --password-stdin
                            docker push "$registry:$dockerTag"

                        '''
                    }
                }
            }
        }
        stage('Remove Unused docker image') {
            steps{
                sh "docker rmi $registry:$dockerTag"
            }
        }
    }
}



// docker build -t hello/v1 .
// docker run -p 3000:3000 -e ENV=$ENV -e VERSION=$VERSION --name hello -d hello/v1