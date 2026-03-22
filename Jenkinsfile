pipeline  {
    agent {
        kubernetes {
            yaml '''
apiVersion: v1
kind: Pod
spec:
  containers:
    - name: node
      image: node:20-alpine
      command:
        - cat
      tty: true
'''
        }
    }

    stages {
        stage('checkout') {
            steps {
                echo 'Checking out code...'
                git branch: 'main', url: 'https://github.com/jayesh6442/devopstooling.git'
                echo 'Code checked out successfully'
            }
        }
        stage('Install') {
            steps {
                sh 'node -v'
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }
    }
}
