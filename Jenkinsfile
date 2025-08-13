pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('awscredentials')   // Jenkins credentials ID for AWS Access Key
        AWS_SECRET_ACCESS_KEY = credentials('awscredentials')   // Jenkins credentials ID for AWS Secret Key
        AWS_DEFAULT_REGION    = "us-east-1"
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
                bat 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                echo "Creating Terraform execution plan..."
                bat 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    input message: 'Approve deployment?', ok: 'Deploy'
                }
                echo "Applying Terraform changes..."
                bat 'terraform apply -auto-approve'
            }
        }

        stage('batow Outputs') {
            steps {
                echo "Displaying Terraform outputs..."
                bat 'terraform output'
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