pipeline {
    agent any

    environment {
        // SonarQube server name configured in Jenkins
        SONARQUBE_ENV = 'Sonar'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('SonarQube Analysis') {
            steps {
                // Use Jenkins credentials for the Sonar token
                withCredentials([string(credentialsId: 'Sonar-token', variable: 'SONAR_TOKEN')]) {
                    sh '''
                    docker run --rm \
                      -v $PWD:/usr/src \
                      -e SONAR_HOST_URL=http://10.0.2.15:9000 \
                      -e SONAR_LOGIN=$SONAR_TOKEN \
                      sonarsource/sonar-scanner-cli \
                      -Dsonar.projectKey=todoapp \
                      -Dsonar.sources=.
                    '''
                }
            }
        }

        stage('Quality Gate') {
            steps {
                // Wait for SonarQube to compute Quality Gate and check status
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
