pipeline {
    agent any
     environment {
         AWS_ACCESS_KEY_ID = 'AKIAUSJEUUYZLIMRCV5Z'
         AWS_SECRET_ACCESS_KEY = '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' 
         registry = "314146334258.dkr.ecr.us-east-1.amazonaws.com/ques/5"
    }
   
    stages {
          stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'Pipeline', url: 'https://github.com/suryan70195/jenkins-ECR.git']])
            }
        }
           stage('Building image') {
             steps{
                  script {
                   dockerImage = docker.build registry
                   }
      }
           }
    
            stage('Pushing to ECR') {
             steps{  
                  script {
               
     sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 314146334258.dkr.ecr.us-east-1.amazonaws.com'
     sh 'docker push 314146334258.dkr.ecr.us-east-1.amazonaws.com/ques/5:latest'                  
              

          }
      }
 }
             stage('stop previous containers') {
               steps {
            sh 'docker ps -f name=mypythonContainer -q | xargs --no-run-if-empty docker container stop'  
            sh 'docker container ls -a -fname=mypythonContainer -q | xargs -r docker container rm'
         }
       }
            stage('Docker Run') {
              steps{
                   script {
                sh 'docker run -d -p 8096:5000 --rm --name mypythonContainer 314146334258.dkr.ecr.us-east-1.amazonaws.com/ques/5:latest'     
      }
    }
        }
    }
  }
