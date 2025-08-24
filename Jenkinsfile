@Library('multi-account-lib') _   // Jenkins Shared Library

pipeline {
  agent any

  environment {
    AWS_REGION     = "eu-west-2"
    AWS_ROLE_ARN   = credentials('aws-org-admin-role')  // Jenkins credentials store
    SLACK_CHANNEL  = '#cloud-platform-pipeline'
  }

  options {
    ansiColor('xterm')
    timestamps()
    disableConcurrentBuilds()
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Terraform') {
      steps {
        terraformPipeline {
          envName    = "${params.ENV ?: 'dev'}"
          awsRegion  = "${env.AWS_REGION}"
          awsRoleArn = "${env.AWS_ROLE_ARN}"
        }
      }
    }
  }

  post {
    success {
      notify buildStatus: "SUCCESS", channel: "${env.SLACK_CHANNEL}"
    }
    failure {
      notify buildStatus: "FAILURE", channel: "${env.SLACK_CHANNEL}"
    }
  }
}
