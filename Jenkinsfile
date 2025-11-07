pipeline {
    agent any
    options {
        skipDefaultCheckout true // prevent automatic checkout before pipeline runs
    }
    stages {
        stage('Clean Workspace') {
            steps {
                deleteDir() // ensures the workspace is empty
            }
        }
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Sachin-ingale/django-todo-cicd.git'
            }
        }
    }
}
