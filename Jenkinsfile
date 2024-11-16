pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                // Compilar el proyecto con Maven
                echo "Compilando el proyecto con Maven..."
                sh 'mvn clean package'
            }
        }
        stage('Docker Build') {
            steps {
                // Construir la imagen Docker
                echo "Construyendo la imagen Docker..."
                sh 'docker build -t evaluacion-devops .'
            }
        }
        stage('Docker Deploy') {
            steps {
                // Reiniciar el contenedor Docker
                echo "Desplegando el contenedor Docker..."
                sh '''
                    docker stop evaluacion-devops || true
                    docker rm evaluacion-devops || true
                    docker run -d --name evaluacion-devops -p 8080:8080 evaluacion-devops
                '''
            }
        }
    }

    post {
        success {
            echo "Pipeline ejecutado exitosamente."
        }
        failure {
            echo "El pipeline ha fallado."
        }
    }
}
