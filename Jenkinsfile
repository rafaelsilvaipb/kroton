pipeline {
    agent any
    stages{
        stage("Clone Github"){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/rafaelsilvaipb/kroton']])
            }
        }
        stage("Build Maven"){
            steps{
                withMaven{ bat 'mvn clean install' }
            }
        }
        stage("Build Docker"){
            steps{
                bat 'docker build -t kroton .'
            }
        }
        stage("Push AWS ECR"){
            steps{
                bat 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 661984127532.dkr.ecr.us-east-1.amazonaws.com'
                bat 'docker tag kroton:latest 661984127532.dkr.ecr.us-east-1.amazonaws.com/kroton:latest'
                bat 'docker push 661984127532.dkr.ecr.us-east-1.amazonaws.com/kroton:latest'
            }
        }
        stage("Deploy EKS"){
            steps{
               kubeconfig(credentialsId: 'AWS', serverUrl: '',caCertificate: '') {
                    bat 'kubectl delete deployments kroton'
                    bat 'kubectl delete services kroton'
                    bat 'kubectl apply -f .\\EKS.yaml'
                    bat 'kubectl get svc'
                }
            }
        }
    }

}