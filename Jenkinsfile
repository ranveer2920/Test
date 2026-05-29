pipeline {

    agent any

    environment {

        DEV_SERVER = "35.175.127.24"
        STG_SERVER = "100.48.7.108"
        PRD_SERVER = "34.201.210.160"

        SERVER_USER = "ec2-user"
    }

    stages {

        stage('Checkout') {

            steps {

                checkout scm
            }
        }

        stage('Deploy to DEV') {

            when {

                branch 'dev'
            }

            steps {

                sh """

                echo "Deploying to DEV Server"

                scp -o StrictHostKeyChecking=no \
                index.html ${SERVER_USER}@${DEV_SERVER}:/tmp/index.html

                ssh -o StrictHostKeyChecking=no \
                ${SERVER_USER}@${DEV_SERVER} '

                sudo cp /tmp/index.html /var/www/html/index.html

                sudo systemctl restart httpd
                '

                """
            }
        }

        stage('Deploy to STAGING') {

            when {

                branch 'stg'
            }

            steps {

                sh """

                echo "Deploying to STAGING Server"

                scp -o StrictHostKeyChecking=no \
                index.html ${SERVER_USER}@${STG_SERVER}:/tmp/index.html

                ssh -o StrictHostKeyChecking=no \
                ${SERVER_USER}@${STG_SERVER} '

                sudo cp /tmp/index.html /var/www/html/index.html

                sudo systemctl restart httpd
                '

                """
            }
        }

        stage('Deploy to PRODUCTION') {

            when {

                branch 'main'
            }

            steps {

                sh """

                echo "Deploying to PRODUCTION Server"

                scp -o StrictHostKeyChecking=no \
                index.html ${SERVER_USER}@${PRD_SERVER}:/tmp/index.html

                ssh -o StrictHostKeyChecking=no \
                ${SERVER_USER}@${PRD_SERVER} '

                sudo cp /tmp/index.html /var/www/html/index.html

                sudo systemctl restart httpd
                '

                """
            }
        }
    }

    post {

        success {

            echo "Deployment Successful"
        }

        failure {

            echo "Deployment Failed"
        }
    }
}
