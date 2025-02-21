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
                                    bat '"C:\\Windows\\System32\\cmd.exe" /c dotnet --version'
                                }
                            }
                        }
                stage('Restore Dependencies') {
                        steps {
                            script {
                                // Restore .NET dependencies using NuGet
                                bat '"C:\\Windows\\System32\\cmd.exe" /c dotnet restore'
                            }
                        }
                    }                
                }
    }
