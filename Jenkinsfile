pipeline {
            agent any      
    
            stages {
                stage('Clone') {
                            steps   {
                                               git url: 'https://github.com/kirannunnak/GYMONE.git', branch: 'master'                              
                                    }
                    }
                stage('docker build')
                        {
                        steps
                                    {
                                                sh 'docker build -t gymapp:latest .' // Builds Docker image with tag 'my-image:latest' from current directory

                                                docker.withRegistry('kirannunna2024') { // Optional: Authenticate with Docker Hub

                                               docker.push("gymapp:latest")
                                    }
                        }
                }
    }
