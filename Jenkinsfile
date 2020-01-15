pipeline {
  agent any
  environment{
    now= new Date()
    TIME_STAMP=now.format("yyMMddHHmm")
    IMAGE="ylihit/catnip"
    IMAGE_WITH_TAG=${IMAGE}:${TIME_STAMP}
  }
  stages {
    stage('Initialize the variables') {
      steps{
        sh "echo ${IMAGE_WITH_TAG}"
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
        sh "./build.sh ${IMAGE_WITH_TAG}"
      }
    }

    stage('Deploy') {
      steps {
        echo 'Deploy..'
        sh "kubectl apply -f flask-app.yaml"
        sh "kubectl set image deployment/catnip-deployment catnip=${IMAGE_WITH_TAG}
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

