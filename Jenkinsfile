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
	
		stage('Code Download')
		{
			steps{
				checkout SCM;
			}
		}
	}


}
