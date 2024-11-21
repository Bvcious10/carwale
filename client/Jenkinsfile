pipeline{
    agent any
    stages{
        stage('terraform validate'){
            steps{
                dir('client/AKS')
                sh 'terraform validate'
            }
        }

        stage('terraform plan'){
            steps{
                dir('client/AKS')
                sh 'terraform plan'
            }
        }

        stage('terraform apply/destroy'){
            steps{
                dir('client/AKS')
                sh 'terraform ${action} --auto-approve'
            }
        }
    }
}