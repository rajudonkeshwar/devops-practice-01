// Jenkinsfile (Declarative Pipeline)
pipeline {
    agent any // Specifies where the entire pipeline will run

    environment {
        ACC_ID = "521992171924"
        REPOSITORY = "java-app"
        appVersion = "latest"
        REGISTRY = "${ACC_ID}.dkr.ecr.us-east-1.amazonaws.com"
    }

    stages {
        stage('Check Out The Code') {
            steps {
                echo 'In this stage code will be cloned'
                git branch: 'main',
                url: 'https://github.com/rajudonkeshwar/devops-practice-01.git'
                sh 'pwd'
            }
        }
        stage('Checking the files inside my git folder') {
            steps {
                    // If you want to mention groovy code then you should use script block
                    script {
                    // Find all files in the current workspace
                    def files = findFiles(glob: '**/*.*')
                    echo "Found ${files.length} files."
                    sh 'pwd'
                    }
            }
        }
        stage('build') {
            steps {
                // Yes, the sh command is a fundamental Pipeline step that can be used 
                // in both Declarative and Scripted Jenkins Pipelines.
                echo 'Building the code using maven'
                sh 'ls -la'
                sh '''
                    cd Java-Login-App
                    mvn -B -DskipTests clean package

                    '''
                // Add your deployment commands here, e.g., sh './deploy.sh'
            }
        }


        // stage('Building The Docker Image') {
        //     steps {
        //         script {
        //             // Builds the image using the Dockerfile in the current directory
        //             // and assigns it to a variable 'dockerImage'
        //             dockerImage = docker.build("${REGISTRY_IMAGE}:${IMAGE_TAG}")
        //         }
        //     }
        // }


        stage('Docker Build') {
            steps {
               script{
                withAWS(region: 'us-east-1', credentials: 'aws-creds') {
                    sh """
                    aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin ${REGISTRY}

                    docker build -t  ${REGISTRY}/${project}:${appVersion} .

                    docker push ${REGISTRY}/${project}:${appVersion}
                    """
                }
                 
               }
            }
        }
    }

    post { // Actions to run after the pipeline finishes
        always {
            echo 'Pipeline finished.'
        }
    }
}
