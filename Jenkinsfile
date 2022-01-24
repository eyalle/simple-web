#!groovy

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
        def CHART_DIR = "${env.WORKSPACE}/${CHART_NAME}"
        sh "CHART_DIR=${CHART_DIR} ./kube_helper.sh"
    }
}