pipeline {
            agent any
            environment {
                    BUILD_CONFIGURATION = 'Release'
                    DEPLOY_PATH = 'C:\\knunna\\Release\\'  // Use double backslashes for Windows paths
                }
    
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
                stage('Build') {
                        steps {
                            script {
                                'dotnet build --configuration %BUILD_CONFIGURATION%'
                            }
                        }
                    }
                stage('Publish') {
                        steps {
                            script {
                                'dotnet publish --configuration %BUILD_CONFIGURATION% --output ./publish'
                            }
                        }
                    }
                stage('Deploy') {
                        steps {
                            script {
                                'xcopy /E /I /H ./publish %DEPLOY_PATH%'
                            }
                        }
                    }
                }
            
    }
