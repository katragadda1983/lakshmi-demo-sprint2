pipeline {
	agent any
	environment {
	    PROJECT = 'leafy-oxide-260319'
        CLUSTER = 'cluster-sprint6-k8s'
        LOCATION = 'us-central1-c'
        AUTH = 'gcp-creds'
	}
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
		            	///img = docker.build("katragadda1983/mywebapp:${env.BUILD_ID}")
				img = docker.build("gcr.io/leafy-oxide-260319/mywebappgcr:${env.BUILD_ID}")
			    }
			}
		}
		stage('PublishImage')
		{
			steps {
				script {
				    docker.withRegistry('https://gcr.io', 'gcr:gcp-creds') {
					    img.push("${env.BUILD_ID}")
				    }
				}
			}
		
		}
		stage('Deploy') { 
                steps{
                   echo "Deployment started on k8s cluster ..."
		           sh "sed -i 's/tag/${env.BUILD_ID}/g' deployment.yaml"
                   step([$class: 'KubernetesEngineBuilder', projectId: env.PROJECT, clusterName: env.CLUSTER, location: env.LOCATION, manifestPattern: 'deployment.yaml', credentialsId: env.AUTH, verifyDeployments: true])
		           echo "Deployment Finished ..."
            }
          }
	}
}
