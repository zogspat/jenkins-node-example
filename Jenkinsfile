pipeline {
  agent {
     node {
        label 'java-docker-slave'
        }
  }
  stages {
    stage('Build image')
    {
      steps
      {
        echo 'Maybe... starting the build'
        echo 'Running number ${env.BUILD_ID} on ${env.JENKINS_URL}'
        script
        {
          myapp = docker.build("zogspat/nodewpapiclient:latest") 
        }
      }
    }
    stage('Push to Docker Hub')
    {
      steps 
      { 
        script 
        { 
          myapp = docker.withRegistry(myapp, 'docker-hub-credentials') 
          { 
            dockerImage.push() 
          }
        } 
      }
    }
    stage('Deploy app to kubernetes')
    {
      steps
      {
        withKubeConfig(credentialsId: 'kubeconfig')
        {
          sh "kubectl apply -f kubeDepPlusService.yaml"
        }
      }
    }

  }

}
