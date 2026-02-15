// Jenkinsfile (Declarative Pipeline)
pipeline {
    agent any // Specifies where the entire pipeline will run
    stages {
        stage('Check Out The Code') {
            steps {
                git branch: 'main',
                credentialsId: '12345-1234-4696-af25-123455',
                url: 'ssh://git@bitbucket.org:company/repo.git'
            }
        }
        stage('Test') {
            steps {
                echo 'Running tests...'
                // Add your test commands here, e.g., sh 'mvn test'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying the application...'
                // Add your deployment commands here, e.g., sh './deploy.sh'
            }
        }
    }
    post { // Actions to run after the pipeline finishes
        always {
            echo 'Pipeline finished.'
        }
    }
}
