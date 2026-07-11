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