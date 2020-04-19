#!groovy​
pipeline {
    agent any

    environment {
      CUSTOMER_NAME = "vascubrian"
      PROJECT_NAME = "Covid-2019"
      def sshCopy="vascubrian@meuweke.koreasouth.cloudapp.azure.com"
    }
      stages('deploy') {

         stage('NPM test + install') {
            steps {
                sh 'npm set registry https://registry.npmjs.org/'
                sh 'npm config ls'
                sh 'npm install'
            }
        }

        stage('Deploy Customers') {
          parallel {
            stage('Deploy Covid-2019') {
              stages {
                stage(":dev:") {
                  when {
                    anyOf {
                      branch 'develop'
                      branch 'feature/build/*'
                       }
                     }
                     steps {
                       sshagent (credentials: ['ssh-credentials']) {
                        sh "ssh ${sshCopy} 'mkdir -p /home/${CUSTOMER_NAME.toLowerCase()}/${PROJECT_NAME.toLowerCase()}/dev'"
                        sh "ssh ${sshCopy} 'rm -rf /home/${CUSTOMER_NAME.toLowerCase()}/${PROJECT_NAME.toLowerCase()}/dev/public/*'"
                        sh "ssh ${sshCopy} 'rm -rf /home/${CUSTOMER_NAME.toLowerCase()}/${PROJECT_NAME.toLowerCase()}/dev/src/*'"
                        sh "scp -r ./public ${sshCopy}:/home/${CUSTOMER_NAME.toLowerCase()}/${PROJECT_NAME.toLowerCase()}/dev/"
                        sh "scp -r ./src ${sshCopy}:/home/${CUSTOMER_NAME.toLowerCase()}/${PROJECT_NAME.toLowerCase()}/dev/"
                        sh "scp -r ./startups/ ${sshCopy}:/home/${CUSTOMER_NAME.toLowerCase()}/${PROJECT_NAME.toLowerCase()}/"
                        //Start Application
                        sh "ssh ${sshCopy} '/bin/bash /home/${CUSTOMER_NAME.toLowerCase()}/${PROJECT_NAME.toLowerCase()}/startups/start.sh dev ${CUSTOMER_NAME.toLowerCase()}'"
                      }
                     }
                  }
                }
              }
            }
          }
        }
    }