pipeline{
    agent any
    stages{
        stage('checkout'){
            steps{
                git branch: 'main', credentialsId: '2985cda4-cbb9-4c2f-aef6-e8d0ea90d56e', url: 'https://github.com/Bvcious10/carwale.git'
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