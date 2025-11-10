pipeline {
    agent any
    stages {
        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('Sonar') {
                    sh "sonar-scanner -Dsonar.projectKey=todoapp -Dsonar.sources=."
                }
            }
        }
    }
}
