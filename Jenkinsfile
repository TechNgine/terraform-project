pipeline {
    agent any

    parameters {
        choice(name: 'TERRAFORM_ACTION', choices: ['init', 'plan', 'apply', 'destroy'], description: 'Select Terraform action')
<<<<<<< Updated upstream
    }

    environment {
        AWS_REGION = 'us-east-1'
        TF_WORKING_DIR = 'terraform-project/ec2'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/your-repo.git'
            }
        }

=======
        choice(name: 'APPLICATION', choices: ['java', 'python', 'net'], description: 'Select the application type')
        choice(name: 'ENVIRONMENT', choices: ['dev', 'qa', 'prod'], description: 'Select the environment')
        string(name: 'INSTANCE_COUNT', description: 'Number of instances to create...This is only required for terraform plan')
    }

    environment {
        AWS_REGION = 'us-east-1' // unused variable
        TF_WORKING_DIR = 'ec2'  // Update if your Terraform files are in a different directory
    }

    stages {
>>>>>>> Stashed changes
        stage('Terraform Init') {
            when {
                expression { params.TERRAFORM_ACTION == 'init' }
            }
            steps {
                dir("${TF_WORKING_DIR}") {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            when {
<<<<<<< Updated upstream
                expression { params.TERRAFORM_ACTION == 'plan' }
            }
            steps {
                dir("${TF_WORKING_DIR}") {
                    sh 'terraform plan -out=tfplan'
=======
                expression { params.TERRAFORM_ACTION == 'plan' || params.TERRAFORM_ACTION == 'apply' }
            }
            steps {
                dir("${TF_WORKING_DIR}") {
                    script {
                        def instance_name = "aws-${params.ENVIRONMENT}-${params.APPLICATION}-${count.index < 10 ? local.count_letters[count.index] : format("%d", count.index + 1)}"
                        sh """
                            terraform plan -out=tfplan \
                            -var="application=${params.APPLICATION}" \
                            -var="environment=${params.ENVIRONMENT}" \
                            -var="instance_count=${params.INSTANCE_COUNT}" \
                            -var="instance_name=${instance_name}"
                        """
                    }
>>>>>>> Stashed changes
                }
            }
        }

        stage('Terraform Apply') {
            when {
                expression { params.TERRAFORM_ACTION == 'apply' }
            }
            steps {
                dir("${TF_WORKING_DIR}") {
<<<<<<< Updated upstream
                    sh 'terraform apply -auto-approve tfplan'
=======
                    script {
                        if (fileExists("tfplan")) {
                            echo "Applying Terraform changes..."
                            sh "terraform apply -auto-approve tfplan"
                        } else {
                            error "Terraform plan file does not exist. Run the 'plan' stage first."
                        }
                    }
>>>>>>> Stashed changes
                }
            }
        }

        stage('Terraform Destroy') {
            when {
                expression { params.TERRAFORM_ACTION == 'destroy' }
            }
            steps {
                dir("${TF_WORKING_DIR}") {
<<<<<<< Updated upstream
                    sh 'terraform destroy -auto-approve'
=======
                    def instance_name = "${params.APPLICATION}-${params.ENVIRONMENT}-${params.INSTANCE_COUNT}"
                    sh """
                        terraform destroy -auto-approve \
                        -var="application=${params.APPLICATION}" \
                        -var="environment=${params.ENVIRONMENT}" \
                        -var="instance_count=${params.INSTANCE_COUNT}" \
                        -var="instance_name=${instance_name}"
                    """
>>>>>>> Stashed changes
                }
            }
        }
    }

    post {
        always {
            echo 'Terraform process completed!'
        }
    }
}
