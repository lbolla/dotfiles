# Expand the official .oh-my-zsh kubectl plugin.

alias k=kubectl
# alias kubectl-create-secret="kubectl create secret generic"  # E.g. kubectl-create-secret test-production --from-literal=secret_key=secret
# alias k="kubectl"
alias kdesc="kubectl describe"
alias kget="kubectl get -o wide"
alias kedit="kubectl edit"
alias klogs="kubectl logs"
# alias ktail="kubetail"
alias ktail="stern -t -s 1s"
alias kview="kubectl get -o yaml"
alias kevents="kubectl get events --sort-by=.lastTimestamp -ocustom-columns=LAST_TS:.lastTimestamp,NAME:.metadata.name,MSG:.message | grep -v 'Search Line limits were exceeded'"
# TODO not working
# alias knodes-count-pods="kubectl get po -o wide --all-namespaces | grep -v NODE | awk '{print $8}' | sort | uniq -c"

alias kedit-secret="KUBE_EDITOR=kube-secret-editor kubectl edit secret"

function kctx {
    if [[ $# -eq 0 ]]; then
        kubectl config get-contexts
    else
        kubectl config use-context $@
    fi
}

function kns {
    if [[ $# -eq 0 ]]; then
        kubectl get ns
    else
        kubectl config set-context $(kubectl config current-context) --namespace $@
    fi
}

function kview {
    kubectl get -o yaml $* | $PAGER
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
