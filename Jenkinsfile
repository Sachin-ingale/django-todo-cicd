pipeline {
    agent any

    environment {
        SONARQUBE = 'Sonar' // Name of your SonarQube installation in Jenkins
    }

    stages {
        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv("${SONARQUBE}") {
                    sh 'sonar-scanner -Dsonar.projectKey=todoapp -Dsonar.sources=.'
                }
            }
        }

        stage('Quality Gate') {
            steps {
                timeout(time: 5, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }
    }
}
