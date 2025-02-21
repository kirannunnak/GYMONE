pipeline {
            agent any      
    
            stages {
                stage('Clone') {
                            steps   {
                                               git url: 'https://github.com/kirannunnak/GYMONE.git', branch: 'master'                              
                                    }
                    }
                stage('Restore Dependencies') {
                        steps {
                            script {
                                // Restore .NET dependencies using NuGet
                                sh 'dotnet restore'
                            }
                        }
                    }                
                }
    }
