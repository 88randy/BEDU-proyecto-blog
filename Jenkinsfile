node {
    def app
    stage('Clone') {
        checkout scm 
    }
    stage('Build') {
        steps {
            sh 'docker-compose up -d --build'
        }
    }
    stage('Test') {
        app.inside {
            sh 'pip list'
        }
    }
    stage('Deploy') {
        sh 'echo Listo'
    }
}