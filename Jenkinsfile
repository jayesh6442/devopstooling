pipeline {
    agent any
    stages {
        stage('checkout') {
            steps {
                echo 'Checking out code...'
                git branch: 'main', url: 'https://github.com/jayesh6442/devopstooling.git'
                echo 'Code checked out successfully'
            }
        }
        stage('builing docker image'){
            steps{
                echo "building docker image"
                sh "docker build -t test-deploy ."
                echo "docker image built successfully"
            }
        }
    }
}