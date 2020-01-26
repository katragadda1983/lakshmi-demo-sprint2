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
				nexusArtifactUploader(
				nexusVersion: 'nexus3',
				protocol: 'http',
				nexusUrl: '34.68.9.91:8081/',
				groupId: 'Pipeline',
				version: '${BUILD_NUMBER}_SPRINT3',
				repository: 'DevOps',
				credentialsId: 'admin',
				artifacts: [
					[artifactId: 'SPRINT3',
						classifier: '',
						file: 'project/target/project-1.0-RAMA.war',
						type: 'war']
					]
				)
			}
		}
	}
}
