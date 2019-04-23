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
        checkout scm
        sh 'docker run --rm deart/search_engine_crawler:${BRANCH_NAME} /app/test'
        }
      }
    }
  }