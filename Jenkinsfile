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
        sh 'docker run -p 8000:8000 -d --name bedu-proyecto_web bedu-proyecto_web:latest'
    }
}