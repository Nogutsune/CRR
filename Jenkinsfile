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
                sh 'sudo rm -r *;sudo git clone https://github.com/Nogutsune/CRR.git'
            }
        }
        stage('tfsvars create'){
            steps {
                sh 'sudo cp /home/vagrant/vars.tf ./CRR/'
            }
        }
        stage('terraform init') {
            steps {
                sh 'sudo /home/vagrant/terraform init ./CRR'
            }
        }
        stage('terraform plan') {
            steps {
                sh 'ls ./CRR; sudo /home/vagrant/terraform plan ./CRR'
            }
        }
        stage('terraform ended') {
            steps {
                sh 'echo "Ended....!!"'
            }
        }

        
    }
}
