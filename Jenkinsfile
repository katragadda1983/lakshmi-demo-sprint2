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
				nexusArtifactUploader artifacts: [[artifactId: 'SPRINT3', classifier: '', file: 'project/target/project-1.0-RAMA.war', type: 'war']], credentialsId: 'Nexus', groupId: 'Pipeline', nexusUrl: '34.68.9.91:8081/', nexusVersion: 'nexus3', protocol: 'http', repository: 'DevOps', version: '${BUILD_NUMBER}_SPRINT3'
			}
		}
	}
}
