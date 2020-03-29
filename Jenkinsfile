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
			    script {
		            	img = docker.build("katragadda1983/mywebapp:${env.BUILD_ID}")
                		}
			}
		}
		stage('PublishImage')
		{
			steps {
				
			    withDockerRegistry(credentialsId: 'docker-hub', url: 'https://hub.docker.com/') {
				    img.push("${env.BUILD_ID}")
				}
			}
		
		}
	}
}
