pipeline {
    agent any

    stages {
        stage('Test Workspace') {
            steps {
                echo "Testing Jenkins workspace..."
                sh 'whoami'
                sh 'ls -la'
            }
        }
    }

    post {
        always {
            echo 'Test pipeline finished.'
        }
    }
}
