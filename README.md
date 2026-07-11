# gcp-playground

## setup

1. Install tools.
    ```
    $ mise i
    ```

1. Initialize gcloud.
    ```
    # Choose project="playground-502010", region="asia-northeast1-a"
    $ mise exec -- gcloud init
    $ mise exec -- gcloud auth login
    $ mise exec -- gcloud auth application-default login
    ```

1. Prepare a GCS bucket for tfstate files. See [backend](./backend/).

1. Prepare a GKE for argocd and applications. See [bootstraps](./bootstraps/).

## clean up

1. Destroy clusters for argocd and applications. See [bootstraps](./bootstraps/).

1. Finally, destroy the backend bucket. See [backend](./backend/).