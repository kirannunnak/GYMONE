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
                                                sh 'docker build -t gymapp:latest .' 
                                                docker.withRegistry('kirannunna2024')
                                                {
                                                   docker.push("gymapp:latest")
                                                }
                                    }
                        }
                }
    }
