@Library('cloud-shared-lib') _

pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = "eu-west-2"
        TF_WORKDIR = "infra"
    }

    options {
        timestamps()
        ansiColor('xterm')
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                terraformInit("${TF_WORKDIR}")
            }
        }

        stage('Validate & Format') {
            steps {
                terraformValidate("${TF_WORKDIR}")
                terraformFmt("${TF_WORKDIR}")
            }
        }

        stage('Security Scans') {
            parallel {
                stage('Tfsec Scan') {
                    steps {
                        tfsecScan("${TF_WORKDIR}")
                    }
                }
                stage('Checkov Scan') {
                    steps {
                        checkovScan("${TF_WORKDIR}")
                    }
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                terraformPlan("${TF_WORKDIR}")
                archiveArtifacts artifacts: "${TF_WORKDIR}/plan.out", fingerprint: true
            }
        }

        stage('Approval') {
            steps {
                input message: "Approve to apply Terraform changes?", ok: "Deploy"
            }
        }

        stage('Terraform Apply') {
            steps {
                terraformApply("${TF_WORKDIR}")
            }
        }
    }

    post {
        success {
            notifySlack("SUCCESS ✅ - ${env.JOB_NAME} #${env.BUILD_NUMBER}")
        }
        failure {
            notifySlack("FAILURE ❌ - ${env.JOB_NAME} #${env.BUILD_NUMBER}")
        }
    }
}
