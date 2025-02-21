pipeline {
            agent any      
    
            stages {
                stage('Clone') {
                            steps   {
                                               git url: 'https://github.com/kirannunnak/GYMONE.git', branch: 'master'                              
                                    }
                    }
                stage('Verify .NET SDK') {
                            steps {
                                script {
                                    'dotnet --version'
                                }
                            }
                        }
                stage('Restore Dependencies') {
                        steps {
                            script {                              
                                'dotnet restore'
                            }
                        }
                    }                
                }
    }
