#!groovy
def CHART_NAME = "simple-web-chart"
def CHART_DIR = "${CHART_NAME}"
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

        // stage ('verify helm chart'){
        //     sh "pwd"
        //     sh "helm lint ${CHART_DIR}"
        // }

        // stage ('clean up previous deployments'){
        //     sh """
        //     kubectl delete deployment --all -n ${NAMESPACE} || true
        //     kubectl delete services  --all -n ${NAMESPACE} || true
        //     helm uninstall ${SERVICE_NAME} -n ${NAMESPACE} || true
        //     """
        // }
        stage ('deploy helm chart'){
            sh "CHART_DIR=${env.WORKSPACE}/${CHART_DIR} ./kube_helper.sh"
            // dir("${env.WORKSPACE}/${CHART_DIR}"){
            //     def commands =
            //     """az login -i
            //     az aks get-credentials -n devops-interview-aks -g devops-interview-rg || true
            //     kubelogin convert-kubeconfig -l msi
            //     helm install ${SERVICE_NAME} . -n ${NAMESPACE}
            //     echo "will wait for external IP availability now.."
            //     external_ip=""; while [ -z \$external_ip ]; do echo "Waiting for end point..."; external_ip=\$(kubectl get svc ${FULL_NAME} -n ${NAMESPACE} --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}"); [ -z "\$external_ip" ] && sleep 10; done; echo "End point ready-" && echo \$external_ip; export SERVICE_IP=\$external_ip
            //     #export SERVICE_IP=\$(kubectl get svc -n ${NAMESPACE} ${FULL_NAME} -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
            //     export SERVICE_PORT=\$(kubectl get svc -n ${NAMESPACE} ${FULL_NAME} -o jsonpath='{.spec.ports[0].port}')
            //     curl http://\$SERVICE_IP:\$SERVICE_PORT""".stripIndent().stripMargin()

            //     print(commands)
            //     sh "${commands}"
            // }
        }
}