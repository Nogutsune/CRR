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
		
	stage('terraform plan') {
            steps {
                   sh " ls ./CRR/Terraform; sudo terraform plan -out plan.out "
				}
        }
		
        stage('terraform apply') {
            steps {
                sh 'sudo terraform apply -auto-approve "plan.out" '
            }
        }
	stage('clean up') {
            steps {
                sh 'sudo rm -rf plan.out'
            }
        }
		
        stage('destination bucket ownership transfer') {
            steps {
                sh './run.sh'
            }
        }
		
        stage('terraform ended') {
            steps {
                sh 'echo "Ended....!!"'
            }
        }

        
    }
}
