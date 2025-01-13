alias ll="ls -lha"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias encrypt="gpg -a -c --cipher-algo AES256"

# source: https://krlng.github.io/k8s_shortcuts/
alias k='kubectl'
alias kgp='kubectl get pods'
alias kgs='kubectl get service'
alias kd='kubectl describe'
alias kdel='kubectl delete'
alias klog='kubectl logs'
alias klf='kubectl logs -f'
alias kaf='kubectl apply -f'

# list available contexts
alias kcontext="kubectl config get-contexts"
# switch between different kubernetes contexts
alias kc="kubectl config use-context"
# set default namespace in current context

kns() {
  kubectl config set-context "$(kubectl config current-context)" --namespace="${1}"
}
