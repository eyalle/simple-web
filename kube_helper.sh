#!/bin/bash

CHART_NAME="simple-web-chart"
CHART_DIR="${CHART_NAME}"
NAMESPACE="eyal"
SERVICE_NAME="testjenkins"
FULL_NAME="${SERVICE_NAME}-${CHART_NAME}"

#################### Function Definition ####################
function login_config() {
    set +ex
    az login -i
    az aks get-credentials -n devops-interview-aks -g devops-interview-rg || true
    kubelogin convert-kubeconfig -l msi
    set -ex
}

function lint_chart() {
    pwd
    echo "runnin 'helm lint $CHART_DIR'"
    helm lint $CHART_DIR
}

function cleanup_deployments() {
    echo "Cleaning up older deployments"
    kubectl delete deployment --all -n $NAMESPACE || true
    kubectl delete services  --all -n $NAMESPACE || true
    kubectl delete ing -n eyal --all || true
    helm uninstall $SERVICE_NAME -n $NAMESPACE || true
}

function deloy_chart() {
    helm install $SERVICE_NAME $CHART_DIR -n $NAMESPACE
    echo "will wait for external IP availability now.."
    external_ip="";
    while [ -z \$external_ip ];
    do
        echo "Waiting for end point...";
        external_ip=$(kubectl get svc $FULL_NAME -n $NAMESPACE --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}");
        [ -z "$external_ip" ] && sleep 10;
    done;
    echo "End point ready! $external_ip"
    export SERVICE_IP=$external_ip
    export SERVICE_PORT=$(kubectl get svc -n $NAMESPACE $FULL_NAME -o jsonpath='{.spec.ports[0].port}')
    curl http://$SERVICE_IP:$SERVICE_PORT
}

#############################################################


#################### Execution ####################
lint_chart
login_config
cleanup_deployments
deloy_chart