# argocd

Settings for argocd.

## setup

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