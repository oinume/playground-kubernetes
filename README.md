[![CircleCI](https://circleci.com/gh/oinume/playground-kubernetes/tree/master.svg?style=svg)](https://circleci.com/gh/oinume/playground-kubernetes/tree/master)

# playground-kubernetes
My playground for Kubernetes

## Setup

1. Login to GCP

```bash
gcloud auth login
```

2. Set GCP project

```bash
gcloud config set project <your-project-id>
```

3. List clusters

```bash
gcloud container clusters list

NAME                   LOCATION           MASTER_VERSION  MASTER_IP      MACHINE_TYPE  NODE_VERSION   NUM_NODES  STATUS
playground-kubernetes  asia-northeast1-a  1.11.2-gke.15   <IP>  g1-small      1.11.2-gke.15  1          RUNNING
```

4. Get credential and set context

```bash
gcloud container clusters get-credentials <culster-name>
kubectl config get-contexts
```

## Create pod

```bash
kubectl create -f pod.yaml
...

kubectl get pods 
```


## TODO
- Fix docker command deprecation warning
- Add kubernetes yaml files
    - pod
    - config-map
    - replica-set
    - deployment
    - service
    - ingress
