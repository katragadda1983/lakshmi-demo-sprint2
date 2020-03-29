pipeline {
	agent any
	stages {
		stage('Build')
		{
			steps{
				
				sh 'mvn package'
			}
		}
	
		stage('Test')
		{
			steps{
				sh 'mvn test'
			}
		}
		
		stage('BuildImage')
		{
			steps {
				
				sh 'docker build . -t katragadda1983/webappjenkins:${env.BUILD_ID}'
			}
		}
	}
}
