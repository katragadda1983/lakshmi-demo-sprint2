pipeline {
	agent any
	environment {
		NEXUS_VERSION='nexus3'
		NEXUS_PROTOCOL='http'
		NEXUS_URL='34.68.9.91:8081/'
		NEXUS_REPOSITORY='DevOps'
		NEXUS_CREDENTIALS_ID='admin'
	}
	stages {
		stage('Build')
		{
			steps{
				
				sh 'mvn clean package'
			}
		}
	
		stage('SonarAnalysis')
		{
			steps{
				withSonarQubeEnv('SONAR'){
					sh 'mvn sonar:sonar'
				}
			}
		}
		stage('Test')
		{
			steps{
				sh 'mvn test'
			}
		}
		stage('Publish')
		{
			steps{
				echo 'publishing'
			}
		}
	}


}
