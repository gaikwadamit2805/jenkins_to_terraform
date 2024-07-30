pipeline {

    environment {
        AWS_CREDENTIALS = credentials('aws-credentials')
        AWS_ACCESS_KEY_ID     = credentials('aws_accesskey_id')
        AWS_SECRET_ACCESS_KEY = credentials('aws_secrete_key')
    }

   agent  any
    stages {
        stage('Plan') {
            steps {
                sh 'cd terraform/ ; terraform init'
                sh "cd terraform/ ; terraform plan -out tfplan"
                sh 'cd terraform/ ; terraform show -no-color tfplan > tfplan.txt'
            }
        }
        stage('Approval') {
           when {
               not {
                   equals expected: true, actual: params.autoApprove
               }
           }

           steps {
               script {
                    def plan = readFile 'terraform/tfplan.txt'
                    input message: "Do you want to apply the plan?",
                    parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
               }
           }
       }

        stage('Apply') {
            steps {
                sh "pwd;cd terraform/ ; terraform apply -input=false tfplan"
            }
        }
    }

  }
