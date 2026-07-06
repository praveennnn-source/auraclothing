pipeline {
    agent any

    stages {

        stage('Clone Repository') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/YOUR_USERNAME/fashion-store.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t fashion-store .'
            }
        }

        stage('Stop Old Container') {
            steps {
                sh '''
                docker stop fashion-store || true
                docker rm fashion-store || true
                '''
            }
        }

        stage('Run New Container') {
            steps {
                sh '''
                docker run -d \
                --name fashion-store \
                -p 80:80 \
                fashion-store
                '''
            }
        }
    }
}g
