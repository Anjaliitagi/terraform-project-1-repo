pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = "us-east-1"  // Keep your AWS region here
    }

    stages {
        stage('Checkout Code') {
            steps {
                echo "Pulling code from GitHub..."
                git branch: 'main', url: 'https://github.com/Anjaliitagi/terraform-project-1-repo'
            }
        }

        stage('Terraform Init') {
            steps {
                echo "Initializing Terraform..."
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'awscredentialss'
                ]]) {
                    bat 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                echo "Creating Terraform execution plan..."
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'awscredentialss'
                ]]) {
                    bat 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    input message: 'Approve deployment?', ok: 'Deploy'
                }
                echo "Applying Terraform changes..."
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'awscredentialss'
                ]]) {
                    bat 'terraform apply -auto-approve'
                }
            }
        }

        stage('Show Outputs') {
            steps {
                echo "Displaying Terraform outputs..."
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'awscredentials'
                ]]) {
                    bat 'terraform output'
                }
            }
        }
    }

    post {
        success {
            echo "✅ Terraform deployment completed successfully!"
        }
        failure {
            echo "❌ Terraform deployment failed!"
        }
        always {
            echo "Cleaning up workspace..."
            cleanWs()
        }
    }
}
