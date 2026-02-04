pipeline {
  agent any

  stages {

    stage('Checkout') {
      steps { checkout scm }
    }

    stage('Terraform Init') {
      steps {
        dir('terraform') {
          sh 'terraform init'
        }
      }
    }

    stage('Terraform Apply') {
      steps {
        withCredentials([
          string(credentialsId: 'AWS_ACCESS_KEY_ID', variable: 'AWS_ACCESS_KEY_ID'),
          string(credentialsId: 'AWS_SECRET_ACCESS_KEY', variable: 'AWS_SECRET_ACCESS_KEY')
        ]) {
          dir('terraform') {
            sh 'terraform apply -auto-approve'
          }
        }
      }
    }

    stage('Ansible') {
      steps {
        withCredentials([
          sshUserPrivateKey(
            credentialsId: 'jenkins-ssh-key',
            keyFileVariable: 'KEY'
          )
        ]) {
          sh '''
          ansible-playbook \
            -i ansible/inventory.ini \
            ansible/site.yml \
            --private-key $KEY \
            --ssh-common-args="-o StrictHostKeyChecking=no"
          '''
        }
      }
    }
  }
}
