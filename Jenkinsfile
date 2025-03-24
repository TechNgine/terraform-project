pipeline {
    agent any
    
    parameters {
        string(
            name: 'ENVIRONMENT',
            description: 'Environment (dev, qa, or prod)'
        )
        
        string(
            name: 'APPLICATION',
            description: 'Application type (java, python, or net)'
        )
        
        string(
            name: 'INSTANCE_COUNT',
            description: 'Number of instances to create'
        )
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Terraform Init') {
            steps {
                dir('ec2') {
                    sh 'terraform init'
                }
            }
        }
        
        stage('Terraform Plan') {
            steps {
                dir('ec2') {
                    sh '''
                        terraform plan \
                        -var="environment=${ENVIRONMENT}" \
                        -var="application=${APPLICATION}" \
                        -var="instance_count=${INSTANCE_COUNT}" \
                        -out=tfplan
                    '''
                }
            }
        }
        
        stage('Terraform Apply') {
            steps {
                dir('ec2') {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
        
        stage('Cleanup') {
            steps {
                dir('ec2') {
                    sh 'rm -f tfplan'
                }
            }
        }
    }
    
    post {
        always {
            cleanWs()
        }
    }
} 