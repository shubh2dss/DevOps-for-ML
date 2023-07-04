pipeline {
   agent any

   stages {
      stage('Clone New Code') {
         steps {
            cleanWs()
            git 'https://github.com/shubh2dss/DevOps-for-ML.git'
                      
         }
      }
      stage('Build and Run Docker Container') {
         steps {
            script {
                
                  sh 'chmod 700 ${WORKSPACE}/Dockerfile'
                  sh 'chmod 700 ${WORKSPACE}/CI_and_CD/src/inference.py'
                  sh 'chmod 700 ${WORKSPACE}/requirements.txt'
                  
                  sh 'sudo docker build --tag ml_api .'
                  
                  sh 'sudo docker tag ml_api shubh2ds/house_price_prediction_image:v1.${BUILD_NUMBER}'
                  sh 'sudo docker push shubh2ds/house_price_prediction_image:v1.${BUILD_NUMBER}'
                  
                  sh 'scp ${WORKSPACE}/Dockerfile root@216.219.95.135:/home/workspace/GIT-ML-ENDTOEND/shubh2dss-GIT/CICD-Testing/api/'
                  sh 'scp ${WORKSPACE}/requirements.txt root@216.219.95.135:/home/workspace/GIT-ML-ENDTOEND/shubh2dss-GIT/CICD-Testing/api/'
                  sh 'scp ${WORKSPACE}/CI_and_CD/src/inference.py root@216.219.95.135:/home/workspace/GIT-ML-ENDTOEND/shubh2dss-GIT/CICD-Testing/api/src/'
                    
                  sh 'ssh root@216.219.95.135 sudo docker pull shubh2ds/house_price_prediction_image:v1.${BUILD_NUMBER}'
                  sh 'ssh root@216.219.95.135 sudo docker run -d -p 5000:5000 -v ml_vol:/home/workspace/GIT-ML-ENDTOEND/shubh2dss-GIT/CICD-Testing/ shubh2ds/house_price_prediction_image:v1.${BUILD_NUMBER}'

            }
          
         }
      }

   }
}
