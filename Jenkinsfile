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
                withCredentials([string(credentialsId: 'Sonar-token', variable: 'SONAR_TOKEN')]) {
                    sh """
                    docker run --rm \\
                      -v \$(pwd):/usr/src \\
                      sonarsource/sonar-scanner-cli \\
                      -Dsonar.projectKey=todoapp \\
                      -Dsonar.sources=/usr/src \\
                      -Dsonar.host.url=http://10.0.2.15:9000 \\
                      -Dsonar.login=${SONAR_TOKEN}
                    """
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
