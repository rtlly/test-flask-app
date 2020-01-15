def now=new Date()
pipeline {
  agent any
  environment{
    TIME_STAMP=now.format("yyMMddHHmm")
    IMAGE="ylihit/catnip"
  }
  stages {
    stage('Initialize the variables') {
      steps{
        sh "echo ${IMAGE}:${TIME_STAMP}"
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
        sh "./build.sh ${IMAGE}:${TIME_STAMP}"
      }
    }

    stage('Deploy') {
      steps {
        echo 'Deploy..'
        sh "kubectl apply -f flask-app.yaml"
        sh "kubectl --record deployment.apps/catnip-deployment set image deployment.v1.apps/catnip-deployment catnip=docker.io/${IMAGE}:${TIME_STAMP}"
      }
    }
  }

  post {
    always {
      cleanWs()
    }
  }
}
