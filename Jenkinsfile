pipeline {
	agent any
	stages {
		stage('Build')
		{
			steps{
				
				sh 'mvn package'
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
			steps {
				nexusArtifactUploader {
				nexusVersion('NEXUS3')
				protocol('HTTP')
				nexusUrl('34.68.9.91:8081/')
				groupId('DevOps')
				version('${BUILD_NUMBER}_SPRINT3')
				repository('DevOps')
				credentialsId('admin')
				artifact {
					artifactId('SPRINT3')
					type('war')
					file('project/target/project-1.0-RAMA.war')
				}
			}
		}
	}

	}
}
