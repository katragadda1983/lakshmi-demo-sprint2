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
		stage('Deploy')
		{
			steps{
				deploy adapters: [tomcat8(credentialsId: '6bcb0022-f973-4e4a-b4d9-5e1d5681f50a', path: '', url: 'http://34.68.9.91:8080')], contextPath: 'sprint3pipeline', onFailure: false, war: '**/*.war'
			}
		
		}
	}
}
