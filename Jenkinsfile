#!groovy
def CHART_NAME = "simple-web-chart"
def CHART_DIR = "${CHART_NAME}"
def NAMESPACE = "eyal"
def SERVICE_NAME = "testjenkins"
def FULL_NAME = "${SERVICE_NAME}-${CHART_NAME}"


node {
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
        }
}