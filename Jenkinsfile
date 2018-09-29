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
        stage('terraform plan') {
            steps {
                sh 'ls ./CRR; sudo terraform plan'
            }
        }
        stage('terraform ended') {
            steps {
                sh 'echo "Ended....!!"'
            }
        }

        
    }
}
