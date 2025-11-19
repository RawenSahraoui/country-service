pipeline {
    agent any
    
    tools {
        maven 'M2_HOME'  // ← Corrigé ici
        jdk 'JDK21'
    }
    
    stages {
        stage('Checkout code') {
            steps {
                git branch: 'main', 
                    url: 'https://github.com/RawenSahraoui/country-service.git'
            }
        }
        
        stage('Compile code') {
            steps {
                sh 'mvn clean compile'
            }
        }
        
        stage('Test code') {
            steps {
                sh 'mvn test'
            }
            post {
                success {
                    junit allowEmptyResults: true, 
                          testResults: '**/target/surefire-reports/*.xml'
                }
            }
        }
        
        stage('Package') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }
    }
    
    post {
        success {
            echo '✅ Pipeline executed successfully!'
        }
        failure {
            echo '❌ Pipeline failed!'
        }
    }
}