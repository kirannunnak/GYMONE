pipeline {
            agent any
            
             environment {
                            IMAGE_NAME = "gymoneapp"       // Docker image name
                            IMAGE_TAG = "latest"               // Image tag (could also use branch name or commit ID)
                            DOCKERHUB_REPO = "kirannunna2024/testapp" // Docker Hub repo (replace with your Docker Hub username/repo)
            }
    
            stages {
                stage('Clone') {
                            steps   {
                                               git branch: 'master', url: 'https://github.com/kirannunnak/GYMONE.git'                               
                                    }
                    }
                stage('docker build')
                        {
                        steps
                                    {
                                                script {
                                                            docker.build('gymapp').push('latest')
                                                       }
                                    }
                        }
            }
    }
