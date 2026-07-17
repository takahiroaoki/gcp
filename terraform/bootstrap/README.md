# bootstrap

This tf generate a cluster for argocd.

## setup

1. Enable gcp services.
	```
	$ mise run enable
	```

1. Prepare clusters.
	```
	$ mise run tfinit
	$ mise run tfplan
	$ mise run tfapply
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