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
                    // If you want to mention groovy code then you should use script block
                    script {
                    // Find all files in the current workspace
                    def files = findFiles(glob: '**/*.*')
                    echo "Found ${files.length} files."
                    }
            }
        }
        stage('build') {
            steps {
                // Yes, the sh command is a fundamental Pipeline step that can be used 
                // in both Declarative and Scripted Jenkins Pipelines.
                echo 'Building the code using maven'
                sh ' cd Java-Login-App '
                sh 'mvn -B -DskipTests clean package'
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
