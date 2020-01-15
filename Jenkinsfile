def TIME_STAMP
pipeline {
  agent any

  stages {
    stage('Initialize the variables') {
      steps{
        script{
           TIME_STAMP=$(date+%Y%m%d%H%M%S)
        }
      }
    }
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
        sh "./build.sh ${TIME_STAMP}"
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

