# bootstraps

This tf generate clusters for argocd and applications.

## setup

1. Prepare clusters.
	```
	$ mise run tfinit
	$ mise run tfplan
	$ mise run tfapply
	```

1. Setup argocd.
	```
	$ mise run argocd
	```

1. Login to argocd.
	
	Get initial password for `admin` user. Then get access to the host of `argocd-server`.
	```
	$ mise run argocdpwd
	```

## clean up

```
$ mise run tfdestroy
```

## appendix

1. terraform commands

	```
	$ mise run tfinit
	$ mise run tffmt
	$ mise run tfvalidate
	$ mise run tfplan
	$ mise run tfapply
	$ mise run tfdestroy
	```