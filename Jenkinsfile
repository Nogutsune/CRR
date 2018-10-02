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
        
        stage('terraform init') {
            steps {
                sh 'cd ./CRR/Terraform; sudo terraform init'
            }
        }
		stage('deploy') {
    steps {
         
   
            sh " ls ./CRR/Terraform; sudo terraform plan -input=false "
        
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
