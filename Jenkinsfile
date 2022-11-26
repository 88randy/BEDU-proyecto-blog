node {
    def app
    stage('Clone') {
        checkout scm 
    }
    stage('Build') {
        app = docker.build("bedu-proyecto_web_1:latest")
    }
    stage('Test') {
        app.inside {
            sh 'pip list'
        }
    }
    stage('Deploy') {
        sh 'set'
        sh 'docker stop bedu-proyecto_web_1 || true && docker rm bedu-proyecto_web_1 || true'
        sh 'docker-compose up -d --build'
    }
}