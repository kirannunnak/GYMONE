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
                                                script {
                                                            docker.build('gymapp').push('latest')
                                                       }
                                    }
                        }
            }
    }
