pipeline {
    agent any
    stages {
        stage('Clean Workspace') {
            steps {
                deleteDir() // wipes out current workspace
            }
        }
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Sachin-ingale/django-todo-cicd.git', branch: 'main'
            }
        }
    }
}
