pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        echo 'Building..'
        sh "git checkout master"
      }
    }

    stage('Test') {
      steps {
        echo 'Test..'
      }
    }

    stage('Push') {
      steps {
        echo 'Push..'
        sh "./build.sh"
      }
    }

    stage('Deploy') {
      steps {
        echo 'Deploy..'
        sh "kubectl apply -f flask-app.yaml"
      }
    }


  }

  post {
    always {
      cleanWs()
    }
  }
}

