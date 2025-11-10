pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('Sonar') {
                    withCredentials([string(credentialsId: 'Sonar-token', variable: 'SONAR_TOKEN')]) {
                        sh """
                        docker run --rm \\
                          -v \$(pwd):/usr/src \\
                          sonarsource/sonar-scanner-cli \\
                          -Dsonar.projectKey=todoapp \\
                          -Dsonar.sources=/usr/src \\
                          -Dsonar.host.url=$SONAR_HOST_URL \\
                          -Dsonar.login=${SONAR_TOKEN}
                        """
                    }
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

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check SonarQube analysis and Quality Gate.'
        }
    }
}
