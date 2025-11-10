pipeline {
    agent any
    stages {
        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('Sonar') {
                    sh """
                    docker run --rm -v $PWD:/usr/src \
                      -e SONAR_HOST_URL=$SONAR_HOST_URL \
                      -e SONAR_AUTH_TOKEN=$SONAR_AUTH_TOKEN \
                      sonarsource/sonar-scanner-cli \
                      -Dsonar.projectKey=todoapp \
                      -Dsonar.sources=.
                    """
                }
            }
        }
    }
}
