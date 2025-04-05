pipeline {
    agent any

    environment {
        IMAGE_NAME = "surethan37/final_task"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Surethan-S/DevOps_Final.git'
            }
        }

        stage('Build React App') {
            steps {
                sh 'chmod +x build.sh'
                sh './build.sh'  // Only build the React app
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                docker build -t task7 .
                docker tag task7 $IMAGE_NAME
                '''
            }
        }

        stage('Push Docker Image') {
            steps {
                sh '''
                docker login -u surethan37 -p 55665566@S37
                docker push $IMAGE_NAME
                '''
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh '''
                kubectl apply -f deploy.yaml --validate=false
                kubectl apply -f svc.yaml --validate=false
                '''
            }
        }
    }

    post {
        success {
            echo "Deployment Successful! 🎉"
        }
        failure {
            echo "Deployment Failed! ❌"
        }
    }
}
