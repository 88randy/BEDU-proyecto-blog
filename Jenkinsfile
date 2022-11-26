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
        sh 'docker stop bedu-proyecto_web || true && docker rm bedu-proyecto_web || true'
        sh 'docker-compose up --build'
        sh 'docker-compose exec bedu-proyecto_web_1 python manage.py migrate'
        sh 'docker-compose exec bedu-proyecto_web_1 python manage.py runserver 0.0.0.0:8000'
    }
}