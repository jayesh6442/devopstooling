pipeline {
  agent {
    kubernetes {
      yaml """
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: kaniko
    image: gcr.io/kaniko-project/executor:latest
    command:
    - cat
    tty: true
"""
    }
  }

  stages {
    stage('Build Image') {
      steps {
        container('kaniko') {
          sh '''
          /kaniko/executor \
            --context $PWD \
            --dockerfile Dockerfile \
          '''
        }
      }
    }
  }
}