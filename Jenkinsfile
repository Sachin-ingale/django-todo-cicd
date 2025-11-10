pipeline {
    agent any
    environment {
        SONAR_PROJECT_KEY = "todoapp"
        SONAR_SOURCES = "."
    }
    stages {
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withCredentials([string(credentialsId: 'Sonar-token', variable: 'SONAR_AUTH_TOKEN')]) {
                    sh """
                    docker run --rm -v $PWD:/usr/src \
                      -e SONAR_HOST_URL=http://10.0.2.15:9000 \
                      -e SONAR_LOGIN=$SONAR_AUTH_TOKEN \
                      sonarsource/sonar-scanner-cli \
                      -Dsonar.projectKey=$SONAR_PROJECT_KEY \
                      -Dsonar.sources=$SONAR_SOURCES
                    """
                }
            }
        }

        stage('Quality Gate') {
            steps {
                // Optional: Wait for SonarQube quality gate result
                timeout(time: 5, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }
    }
}
