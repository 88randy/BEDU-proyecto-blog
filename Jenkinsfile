node {
    def app
    stage('Clone') {
        checkout scm 
    }
    stage('Build') {
        app = docker.build("myblog:latest")
    }
    stage('Test') {
        app.inside {
            sh 'pip list'
        }
    }
    stage('Deploy') {
        sh 'set'
        sh 'docker stop myblog || true && docker rm myblog || true'
        sh 'docker stop bedu-proyecto_web || true && docker rm bedu-proyecto_web || true'
        sh 'docker-compose up --build'
        sh 'docker-compose exec bedu-proyecto_web_1 python manage.py flush --no-input'
        sh 'docker-compose exec bedu-proyecto_web_1 python manage.py migrate'
    }
}