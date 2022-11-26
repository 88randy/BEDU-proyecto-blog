node {
    def app
    stage('Clone') {
        checkout scm 
    }
    stage('Build') {
        app = docker.build("bedu-proyecto_web:latest")
    }
    stage('Test') {
        app.inside {
            sh 'pip list'
        }
    }
    stage('Deploy') {
        sh 'set'
        sh 'docker stop bedu-proyecto_web || true && docker rm bedu-proyecto_web|| true'
        sh 'docker exec bedu-proyecto_web python manage.py migrate'
        sh 'docker exec bedu-proyecto_web python manage.py runserver 0.0.0.0:8000'
    }
}