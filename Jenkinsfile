pipeline {

    environment {
        AWS_CREDENTIALS = credentials('aws-credentials')
        AWS_ACCESS_KEY_ID     = credentials('aws_accesskey_id')
        AWS_SECRET_ACCESS_KEY = credentials('aws_secrete_key')
        TERRAFORM_DIR = "C:\\ProgramData\\Jenkins\\.jenkins\\workspace\\terraform\"
    }

   agent  any
    stages {
        stage('Init Terraform') {
            steps {
                dir("${env.TERRAFORM_DIR}") {
                    script {
                        bat 'terraform init'
                    }
                }
            }
        }
        stage('Plan Terraform') {
            steps {
                dir("${env.TERRAFORM_DIR}") {
                    script {
                        bat 'terraform plan -out=tfplan'
                    }
                }
            }
        }
        stage('Apply Terraform') {
            steps {
                dir("${env.TERRAFORM_DIR}") {
                    script {
                        bat 'terraform apply -auto-approve tfplan'
                    }
                }
            }
        }
    }

  }
