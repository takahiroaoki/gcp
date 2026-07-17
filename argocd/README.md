# argocd

Settings for argocd.

## setup

1. Setup argocd and wait until the workloads become ready.
	```
	$ mise run argocd
	```

1. Login to argocd.
	
	Get initial password for `admin` user. Then get access to the host of `argocd-server`.
	```
	$ mise run argocdready
	```

1. Install config connector.
	```
	$ mise run config-connector
	```

1. Deploy app-of-apps.
	```
	$ mise run deploy
	```

Then, we can manipulates applications on ArgoCD GUI.

The manifest files of applications are in [manifests](../manifests/).