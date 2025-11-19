pipeline {
    agent any
    
    tools {
        maven 'M2_HOME'
    }
    
    stages {
        stage('Checkout code') {
            steps {
                git branch: 'master', url: 'https://github.com/RawenSahraoui/country-service.git'
            }
        }
        
        stage('Build maven') {
            steps {
                sh 'mvn clean install'
            }
        }
        
        stage('Build Dockerfile') {
            steps {
                sh 'docker build . -t rawensahraoui/country-service:$BUILD_NUMBER'
                withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                    sh 'docker login -u rawensahraoui -p ${dockerhubpwd}'
                }
                sh 'docker tag rawensahraoui/country-service:$BUILD_NUMBER rawensahraoui/country-service:$BUILD_NUMBER'
                sh 'docker push rawensahraoui/country-service:$BUILD_NUMBER'
            }
        }
        
        stage('Deploy micro-service') {
            steps {
                sh 'docker rm -f $(docker ps -aq)'
                sh 'docker run -d -p 8082:8082 rawensahraoui/country-service:$BUILD_NUMBER'
            }
        }
    }
}