#!groovy

pipeline {
  stages {
    stage('Build') {
      steps {
        checkout scm
        sh 'docker build . -t deart/search_engine_crawler:${BRANCH_NAME}'
        }
      }
  stage('Test') {
      steps {
        checkout scm
        sh 'docker run --rm deart/search_engine_crawler:${BRANCH_NAME} /app/test'
        }
      }
    }
  }