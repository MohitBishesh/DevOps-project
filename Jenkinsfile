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
     stage('Sonarqube Analysis - Analysis') {
         steps {
               withSonarQubeEnv('SonarQube') {
          sh "mvn clean verify sonar:sonar \
                -Dsonar.projectKey=Devops-final \
  	                -Dsonar.projectName='Devops-final' \
  		                  -Dsonar.host.url=http://34.225.118.36:9000"
               }
           }
        }
       

        }
     }     
