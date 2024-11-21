pipeline{
    agent any
    stages{
        stage('checkout'){
            steps{
                git branch: 'main', url: 'https://github.com/Bvcious10/carwale.git'
            }
        }

        stage('terraform init'){
            steps{
                dir('client/AKS'){
                sh 'terraform init'
                }
            }
        }

        stage('terraform validate'){
            steps{
                dir('client/AKS'){
                sh 'terraform validate'
                }
            }
        }

        stage('terraform plan'){
            steps{
                dir('client/AKS'){
                sh 'terraform plan'
                }
            }
        }

        stage('terraform apply/destroy'){
            steps{
                dir('client/AKS'){
                sh 'terraform ${action} --auto-approve'
            }
            }
        }
    }
}