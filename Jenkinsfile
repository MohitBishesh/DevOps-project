pipeline {
   agent any
   tools {
         maven "Maven"
         //maven
   }
   
   stages {
      stage( 'Build Artifact') {
         steps {
          sh "mvn clean package -DskipTests=true" 
           archive 'target/*.jar'
          }
      }
      stage('Test Maven JUnit') {
         steps {
           sh "mvn test"
         }
         post{
           always{
              junit (
                    allowEmptyResults:true,
                    testResults:'*test-reports/.xml'
                    )
            }
         }
      }
     stage('Sonarqube Analysis - SAST') {
         steps {
               withSonarQubeEnv('SonarQube') {
          sh "mvn clean verify sonar:sonar \
                -Dsonar.projectKey=Devops-final \
  	                -Dsonar.projectName='Devops-final' \
  		                  -Dsonar.host.url=http://34.225.118.36:9000 \"
               }
           }
        }
       
            stage("verify tooling") {
             steps {
                 sh '''
                   docker version
                   docker info
                    docker-compose version
                    curl --version
                   jq --version
                    '''
                }
            }
             stage('Prune Docker data') {
                steps {
                    sh 'docker system prune -a --volumes -f'
                    sh 'docker-compose down --remove-orphans -v'
                }
            }
              stage('Start container') {
                 steps {
                    sh 'docker-compose build'
                    sh 'docker-compose up -d'
                    sh 'docker-compose ps'
                   }
            }
        }
         post {
           always {
             sh 'docker-compose ps -a'

    }
        }
     }     
