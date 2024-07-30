pipeline {
    agent any

    environment {
        AWS_CREDENTIALS = credentials('a0626853-ecaa-4e3e-b837-ce0372bc6935') // Define your AWS credentials in Jenkins
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/gaikwadamit2805/jenkins_to_terraform.git' // Replace with your repository URL
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    script {
                        sh 'terraform init'
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    script {
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }
    }
}

