pipeline {
    agent any

    environment {
        DOCKER_REGISTRY = 'Dinesh1910'
        DOCKER_IMAGE = 'node-ci-cd-demo'
        DOCKER_TAG = "latest-${env.BUILD_NUMBER}"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Dinesh19-S/Devops-CI-CD-Project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${DOCKER_REGISTRY}/${DOCKER_IMAGE}:${DOCKER_TAG}")
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    echo "Tests executed successfully during Docker build"
                }
            }
        }

        stage('Push to Docker Registry') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'Docker-huB') {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Deploy to Staging') {
            steps {
                script {
                    bat "docker-compose -f docker-compose-staging.yml up -d"
                }
            }
        }

        stage('Deploy to Production') {
            when {
                branch 'main'
            }
            steps {
                input "Deploy to Production?"
                script {
                    bat "docker-compose -f docker-compose-production.yml up -d"
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
            bat 'docker system prune -f'
        }
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
