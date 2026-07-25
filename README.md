# gcp-playground

GCP playground for myself.

This repository mainly store code or scripts for terraform, k8s, etc.

## requirements

- Docker Desktop
- VSCode & Dev Container Extension

※Or, codespaces.

## architecture

```mermaid
graph TD
    %% Styling
    classDef tf fill:#5C4EE5,stroke:#333,stroke-width:2px,color:#fff;
    classDef gke fill:#326CE5,stroke:#333,stroke-width:2px,color:#fff;
    classDef argo fill:#EF6C00,stroke:#333,stroke-width:2px,color:#fff;
    classDef k8s fill:#2468C3,stroke:#333,stroke-width:2px,color:#fff;
    classDef gcp fill:#4285F4,stroke:#333,stroke-width:2px,color:#fff;

    %% Components
    TF["Terraform"]:::tf

    subgraph GCP ["Google Cloud Platform (GCP)"]
        GCS["GCS Bucket (State Backend)"]:::gcp

        subgraph GKE ["GKE Cluster: bootstrap"]
            ArgoCD["Argo CD"]:::argo
            CC["Config Connector"]:::k8s
        end

        subgraph ManagedResources ["GCP Resources (Managed by Config Connector)"]
            CR["Cloud Run"]:::gcp
            Other["Other GCP Services..."]:::gcp
        end
    end

    %% Relationships
    TF -->|"1a. Stores State"| GCS
    TF -->|"1b. Provisions Cluster"| GKE
    ArgoCD -->|"2. Syncs K8s Manifests & CRDs"| CC
    CC -->|"3. Provisions & Reconciles"| CR
    CC -->|"3. Provisions & Reconciles"| Other
```

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

1. Prepare a GCS bucket for tfstate files. See [backend](./terraform/backend/).

1. Prepare a GKE cluster for argocd. See [bootstrap](./terraform/bootstrap/).

1. Initialize argocd for GitOps. See [argocd](./argocd/).

## clean up

1. Destroy the cluster for argocd. See [bootstrap](./terraform/bootstrap/).

1. Finally, destroy the backend bucket. See [backend](./terraform/backend/).