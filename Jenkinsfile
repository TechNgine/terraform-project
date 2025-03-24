pipeline {
    agent any
    
    parameters {
        choice(
            name: 'ENVIRONMENT',
            choices: ['dev', 'qa', 'prod'],
            description: 'Select the environment (dev, qa, or prod)'
        )
        
        choice(
            name: 'APPLICATION',
            choices: ['java', 'python', 'net'],
            description: 'Select the application type (java, python, or net)'
        )
        
        string(
            name: 'INSTANCE_COUNT',
            defaultValue: '1',
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