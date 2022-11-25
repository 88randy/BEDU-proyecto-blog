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
        sh 'docker-compose exec web python manage.py flush --no-input'
        sh 'docker-compose exec web python manage.py migrate'
        sh 'docker-compose up -d'
    }
}