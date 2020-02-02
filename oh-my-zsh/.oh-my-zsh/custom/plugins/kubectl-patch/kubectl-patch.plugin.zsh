# Expand the official .oh-my-zsh kubectl plugin.

KUBECTL=$(which kubectl)
KUBECTL_OLD=$(which kubectl-old)

function kubectl {
    CTX=$($KUBECTL config current-context)
    if [[ $CTX == "ldc" ]]; then
        $KUBECTL_OLD $*
    else
        $KUBECTL $*
    fi
}

alias k=kubectl
# alias kubectl-create-secret="kubectl create secret generic"  # E.g. kubectl-create-secret test-production --from-literal=secret_key=secret
alias kdesc="kubectl describe"
alias kget="kubectl get -o wide"
alias kedit="kubectl edit"
alias klogs="kubectl logs --timestamps=true"
# alias ktail="kubetail"
alias ktail="stern -t -s 1s"
# TODO not working
# alias knodes-count-pods="kubectl get po -o wide --all-namespaces | grep -v NODE | awk '{print $8}' | sort | uniq -c"

alias kedit-secret="KUBE_EDITOR=kube-secret-editor kubectl edit secret"

function kctx {
    if [[ $# -eq 0 ]]; then
        kubectl config get-contexts
    else
        kubectl config use-context $1
        if [[ $# -eq 2 ]]; then
            kns $2
        fi
    fi
}

function kuser {
    kubectl config set-context $1 --user=$2
}

function kns {
    if [[ $# -eq 0 ]]; then
        kubectl get ns
    else
        kubectl config set-context $(kubectl config current-context) --namespace $@
    fi
}

function kview {
    kubectl get -o yaml $*
}

function kbash {
    # bash into a pod
    pod=$1
    shift
    kubectl exec -ti ${pod} sh $@
}

function ksearch {
    # Search something
    kget all --all-namespaces --show-kind=true | fgrep -i "$*"
    kget secret --all-namespaces --show-kind=true | fgrep -i "$*"
    kget cm --all-namespaces --show-kind=true | fgrep -i "$*"
    kget sa --all-namespaces --show-kind=true | fgrep -i "$*"
    kget clusterrolebinding --all-namespaces --show-kind=true | fgrep -i "$*"
}

function kevents {
    kubectl get events --sort-by=.metadata.creationTimestamp -ocustom-columns=LAST_TS:.lastTimestamp,NAME:.metadata.name,MSG:.message $* | grep -v 'Search Line limits were exceeded'
}

function kdelete-evicted-pods {
    # From https://stackoverflow.com/questions/46419163/what-will-happen-to-evicted-pods-in-kubernetes
    kubectl get pods --all-namespaces -o json | jq '.items[] | select(.status.reason!=null) | select(.status.reason | contains("Evicted")) | "kubectl delete pods \(.metadata.name) -n \(.metadata.namespace)"' | xargs -n 1 bash -c
}
