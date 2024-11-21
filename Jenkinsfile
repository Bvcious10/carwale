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

         stage('terraform login'){
            steps{
              withCredentials([azureServicePrincipal('azure-cred')]) {
                sh 'az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID'
                // subscriptionIdVariable: 'AZURE_SUBSCRIPTION_ID',
                // clientIdVariable: 'AZURE_CLIENT_ID',
                // clientSecretVariable: 'AZURE_CLIENT_SECRET',
                // tenantIdVariable: 'AZURE_TENANT_ID'
    // some block
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