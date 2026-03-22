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
        stage('install node js'){
            steps{
                echo "installing node js"
                sh "sudo apt-get update"
                sh "sudo apt-get install -y nodejs"
                echo "node js installed"                
            }
        }
        stage('install npm'){
            steps{
                echo "installing npm"
                sh "sudo apt-get install -y npm"
                echo "npm installed"                
            }
        }
    }
}