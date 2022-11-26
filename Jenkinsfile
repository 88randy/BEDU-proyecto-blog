node {
    def app
    stage('Clone') {
        checkout scm 
    }
    stage('Build') {
        app = docker.build("bedu-proyecto:latest")
    }
    stage('Test') {
        app.inside {
            sh 'pip list'
        }
    }
    stage('Deploy') {
        sh 'set'
        sh 'docker stop bedu-proyecto || true && docker rm bedu-proyecto|| true'
        sh 'docker-compose up -d --build'
        sh 'docker exec bedu-proyecto python manage.py migrate'
        sh 'docker exec bedu-proyecto python manage.py runserver 0.0.0.0:8000'
    }
}