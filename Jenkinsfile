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
                      -e SONAR_HOST_URL=http://10.0.2.15:9000 \\
                      -e SONAR_LOGIN=${SONAR_TOKEN} \\
                      sonarsource/sonar-scanner-cli \\
                      -Dsonar.projectKey=todoapp \\
                      -Dsonar.sources=/usr/src
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
