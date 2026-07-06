pipeline {
    agent any

    stages {

        stage('Clone Repository') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/praveennnn-source/auraclothing.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t auraclothing .'
            }
        }

        stage('Stop Old Container') {
            steps {
                sh '''
                docker stop auraclothing || true
                docker rm auraclothing || true
                '''
            }
        }

        stage('Run New Container') {
            steps {
                sh '''
                docker run -d \
                --name auraclothing \
                -p 80:80 \
                auraclothing
                '''
            }
        }
    }
}
