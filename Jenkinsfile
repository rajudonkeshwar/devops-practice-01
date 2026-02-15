// Jenkinsfile (Declarative Pipeline)
pipeline {
    agent any // Specifies where the entire pipeline will run
    stages {
        stage('Check Out The Code') {
            steps {
                echo 'In this stage code will be cloned'
                git branch: 'main',
                url: 'https://github.com/rajudonkeshwar/devops-practice-01.git'
            }
        }
        stage('Checking the files inside my git folder') {
            steps {
                    script {
                    // Find all files in the current workspace
                    def files = findFiles(glob: '**/*.*')
                    echo "Found ${files.length} files."

                    for (int i = 0; i < files.length; i++) {
                    echo "File: ${files[i]}, Path: ${files[i].path}, Length: ${files[i].length}"
                    }
                    }
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
