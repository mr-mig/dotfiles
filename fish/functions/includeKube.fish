function includeKube -d "Initialize Kube environment"
  # Set the default kube context if present
  set DEFAULT_KUBE_CONTEXTS $HOME/.kube/config
  if test -f $DEFAULT_KUBE_CONTEXTS
    set -x KUBECONFIG $DEFAULT_KUBE_CONTEXTS
  end

  # Additional contexts should be in ~/.kube/custom-contexts/
  set CUSTOM_KUBE_CONTEXTS $HOME/.kube/custom-contexts
  mkdir -p $CUSTOM_KUBE_CONTEXTS
  echo "Custom contexts: $CUSTOM_KUBE_CONTEXTS"

  set OIFS $IFS
  set IFS \n
  for contextFile in (find $CUSTOM_KUBE_CONTEXTS -type f -name "*.yml")
    set -x KUBECONFIG "$contextFile:$KUBECONFIG"
    echo "KUBECONFIG $contextFile"
  end
  set IFS $OIFS
end 