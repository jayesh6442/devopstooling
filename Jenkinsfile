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
        stage('build'){
            steps{
                echo "building this thing"
                sh "npm install"
                sh "npm run build"
                echo "build completed successfully"
                
            }
        }
    }
}