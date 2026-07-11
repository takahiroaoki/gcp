# gcp-playground

## setup

1. Install tools.
    ```
    $ mise i
    ```

1. Initialize gcloud.
    ```
    # Choose project="playground-502010", region="asia-northeast1-a"
    $ mise run init
    ```

1. Authorization.
    ```
    $ mise run auth
    $ mise run appauth
    ```

1. Prepare a GCS bucket for tfstate files. See [backend](./backend/).

1. Prepare a GKE for argocd and applications. See [bootstraps](./bootstraps/).

## clean up

1. Destroy clusters for argocd and applications. See [bootstraps](./bootstraps/).

1. Finally, destroy the backend bucket. See [backend](./backend/).