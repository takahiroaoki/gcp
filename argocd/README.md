# argocd

Settings for argocd.

## setup

1. Store the GitHub Personal Access Token in `argocd/pat.txt`

1. Setup argocd and wait until the workloads become ready.
	```
	$ mise run argocd
	```

1. Login to argocd.
	
	Get initial password and update it for `admin` user. Then get access to the host of `argocd-server`.
	```
	$ mise run argocdexpose
	
	# on another terminal
	$ mise exec -- kubectl port-forward svc/argocd-server -n bootstrap 8080:443
	
	# on the original terminal
	$ mise exec -- argocd login localhost:8080 --insecure
	$ mise exec -- argocd account update-password
	# then stop the port-forward
	```

1. Install config connector and register app-of-apps.
	```
	$ mise run deploy
	```

Then, we can manipulates applications on ArgoCD GUI.

The manifest files of applications are in [manifests](../manifests/).