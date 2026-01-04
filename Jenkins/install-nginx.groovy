pipeline{
    agent any
    /* agent{            // here you can define label(select node to perform task)
        label{
            label 'dev-nodes'          // either you can give label or name
            customWorkspace '/mnt/workspace/'      // where you want to run this all task
        }
    } */
    stages{
        stage('install-nginx'){
            steps{
                sh "sudo apt install nginx -y"
            }
        }
        stage('deploy-indexfile'){
          agent{    // custom workspace with define label
            label {
                label 'slave-1'
                customWorkspace '/mnt/data/pipeline'
            }
          }
          parallel {    // parallel jobs
            steps{
                sh "sudo chmod -R 777 /var/www/html/index.html"
                sh "sudo echo 'Hello this is my Application' >> /var/www/html/index.html"
            }
            steps{
                sh "sudo apt install apache2 -y"
            }
          }  
        }
        stage('restart-nginx'){
            steps{
                sh "sudo service nginx restart"
            }
        }
    }
}