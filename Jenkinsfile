pipeline {
    agent any
    stages {
        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('Sonar') {
                    sh '''
                    docker run --rm \
                      -v $PWD:/usr/src \
                      sonarsource/sonar-scanner-cli \
                      -Dsonar.projectKey=todoapp \
                      -Dsonar.sources=.
                    '''
                }
            }
        }
    }
}
