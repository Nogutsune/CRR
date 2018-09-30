pipeline {
    agent {
        node {
            label 'master'
        }
    }

    stages {

        stage('terraform started') {
            steps {
                sh 'echo "Started...!" '
            }
        }
        stage('git clone') {
            steps {
                sh 'sudo git clone https://github.com/Nogutsune/CRR.git'
            }
        }
        stage('tfsvars create'){
            steps {
                sh 'sudo cp /home/vagrant/vars.tf ./CRR/'
            }
        }
        stage('terraform init') {
            steps {
                sh 'cd ./CRR; sudo terraform init'
            }
        }
		stage('deploy') {
    steps {
        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', 
        accessKeyVariable: 'AWS_ACCESS_KEY_ID',
        credentialsId: 'Source', 
        secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
   
            sh " ls ./CRR; sudo terraform plan -var 'access_key=${AWS_ACCESS_KEY_ID}'  -var 'secret_key=${AWS_SECRET_ACCESS_KEY}'"
        }
    }
}
        stage('terraform plan') {
            steps {
                sh 'Plan executed'
            }
        }
        stage('terraform ended') {
            steps {
                sh 'echo "Ended....!!"'
            }
        }

        
    }
}
