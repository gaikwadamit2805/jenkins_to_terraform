pipeline {
    agent any

    environment {
        AWS_CREDENTIALS = credentials('aws-credentials') // AWS credentials ID configured in Jenkins
    }

    stages {
        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    script {
                        withCredentials([[
                            $class: 'AmazonWebServicesCredentialsBinding',
                            accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                            secretKeyVariable: 'AWS_SECRET_ACCESS_KEY',
                            credentialsId: 'aws-credentials'
                        ]]) {
                            sh 'terraform init'
                        }
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    script {
                        withCredentials([[
                            $class: 'AmazonWebServicesCredentialsBinding',
                            accessKeyVariable: 'AKIAUOGUTWBBZKO7YQ62',
                            secretKeyVariable: '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',
                            credentialsId: 'aws-credentials'
                        ]]) {
                            sh 'terraform apply -auto-approve'
                        }
                    }
                }
            }
        }
    }
}
