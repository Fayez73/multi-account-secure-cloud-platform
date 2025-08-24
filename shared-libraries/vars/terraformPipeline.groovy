def call(Map config) {
  def envName    = config.envName
  def awsRegion  = config.awsRegion
  def awsRoleArn = config.awsRoleArn

  pipeline {
    agent any

    stages {
      stage("Terraform Fmt") {
        steps {
          sh "terraform fmt -check -recursive"
        }
      }

      stage("Terraform Init") {
        steps {
          withAwsRole(roleArn: awsRoleArn, region: awsRegion) {
            sh """
              cd infra/envs/${envName}
              terraform init -backend-config=backend.hcl
            """
          }
        }
      }

      stage("Terraform Validate") {
        steps {
          sh "terraform validate infra/envs/${envName}"
        }
      }

      stage("Static Security (tfsec)") {
        steps {
          sh "tfsec infra/envs/${envName}"
        }
      }

      stage("Static Security (Checkov)") {
        steps {
          sh "checkov -d infra/envs/${envName}"
        }
      }

      stage("Terraform Plan") {
        steps {
          withAwsRole(roleArn: awsRoleArn, region: awsRegion) {
            sh """
              cd infra/envs/${envName}
              terraform plan -out=tfplan
            """
          }
        }
      }

      stage("Terraform Apply") {
        when {
          branch "main"
        }
        steps {
          withAwsRole(roleArn: awsRoleArn, region: awsRegion) {
            sh """
              cd infra/envs/${envName}
              terraform apply -auto-approve tfplan
            """
          }
        }
      }
    }
  }
}
