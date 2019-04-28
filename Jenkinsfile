#!groovy

pipeline {
  agent { node ( 'master' ) }      
  stages {
    stage('Build') {
      agent { node ( 'master' ) }
      steps {
        checkout scm
        sh 'docker build . -t deart/search_engine_crawler:${BRANCH_NAME}'
        }
      }
  stage('Test') {
      agent { node ( 'master' ) }
      steps {
        sh 'docker run --rm deart/search_engine_crawler:${BRANCH_NAME} /app/test.sh'
        }
      }
  stage('Push') {
      agent { node ( 'master' ) }
      steps {
        withCredentials([usernamePassword(credentialsId: '1c8b3390-e48f-4f2a-8319-cf02d5968f75', passwordVariable: 'password', usernameVariable: 'username')]) {
        sh 'docker login -u ${username} -p ${password}'
        }
        sh 'docker push deart/search_engine_crawler:${BRANCH_NAME}'
        }
      }
   stage('Deploy') {
      agent { node ( 'df-ubuntu18-2' ) }
      when { branch 'master' }
      steps {
      	build job: 'Deploy Search Engine'
      }
    }
  }
 }