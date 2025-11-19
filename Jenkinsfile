pipeline {
    agent any
    
    tools {
        maven 'M2_HOME'
    }
    
    stages {
        stage('Checkout code') {
            steps {
                git branch: 'main', url: 'https://github.com/RawenSahraoui/Country-service.git'
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
            }
        }
        
        stage('Deploy micro-service') {
            steps {
                sh 'docker rm -f country-service-container || true'
                sh 'docker run -d --name country-service-container -p 8082:8082 rawensahraoui/country-service:$BUILD_NUMBER'
            }
        }
    }
}