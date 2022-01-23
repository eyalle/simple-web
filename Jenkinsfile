#!groovy
def CHART_NAME = "simple-web-chart"
def CHART_DIR = "simple-web/${CHART_NAME}"
def NAMESPACE = "eyal"
def SERVICE_NAME = "testjenkins"
def FULL_NAME = "${SERVICE_NAME}-${CHART_NAME}"


node {
    // parameters {
    //     string(defaultValue: "initial_docker_image_test", description: 'this is the docker image name', name: 'dockerimagename')
    // }

    // stages {
        stage ('checkout'){
            sh 'echo "checking out repo"'
            checkout scm
        }

        stage ('verify helm chart'){
            dir("${env.WORKSPACE}/${CHART_DIR}"){
                sh "pwd"
                sh "helm version"
                sh """
                    helm install ${SERVICE_NAME} . -n eyal
                    kubectl get pods -n eyal
                    export POD_NAME=$(sudo kubectl get pods --namespace ${NAMESPACE} -l "app.kubernetes.io/name=${CHART_NAME},app.kubernetes.io/instance=${SERVICE_NAME}" -o jsonpath="{.items[0].metadata.name}")
                    kubectl describe pod \$POD_NAME -n eyal
                    kubectl get deployments -n eyal
                    kubectl expose deployment ${FULL_NAME} --type=LoadBalancer -n eyal --name=${NAMESPACE}
                """
                // sh 'echo "stopping docker containers"'
                // sh 'docker ps -aq | xargs -r docker stop;'
                // sh 'echo "killing docker containers"'
                // sh 'docker ps -aq | xargs -r docker rm;'
                // sh 'echo "building docker image"'
                // sh 'docker build . -t "initial_docker_image_test"'
                // docker.build("${dockerimagename}" + ":$BUILD_NUMBER", ".")
            }
        }

        // stage ('run docker'){
        //     steps{
        //         dir("${env.WORKSPACE}/docker"){
        //             sh 'echo "trying to run docker"'
        //             sh 'docker run -dit --name my_app  -p 8081:80 ${dockerimagename}:${BUILD_NUMBER}'
        //         }
        //     }
        // }

        // stage ('test docker'){
        //     steps{
        //         script{
        //             def response = sh(returnStdout: true, script: 'curl localhost:8081')
        //             def validated = false
        //             if ( "${response}" =~ /Moshe/){
        //                 validated = true
        //                 docker.withRegistry('https://cloud.docker.com/repository/registry-1.docker.io', 'credentials-id')
        //             }

        //             echo "${validated}"
        //         }
        //     }
        // }
    // }

    // post {
    //     always {
    //         echo 'I will always say Hello again!'
    //         // sg.addRecipient(javax.mail.Message.RecipientType.TO, new javax.mail.internet.InternetAddress("eyallei666@gmail.com"))
    //     }

    //     success{
    //         echo "Job Successful!"
    //         emailext body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER} SUCCESSFUL\n More info at: ${env.BUILD_URL}",
    //             recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']],
    //             subject: "Jenkins Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}"
    //     }

    //     failure{
    //         echo "Job FAILED :("
    //         emailext body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER} FAILED! \n More info at: ${env.BUILD_URL}",
    //             recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']],
    //             subject: "Jenkins Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}"
    //     }
    // }
}