# Setup Ingress using Kind cluster

## Docs:
https://kind.sigs.k8s.io/docs/user/ingress/


## Steps:

### Prerequisites

- Docker
- Kind (k8s cluster)
- kubectl
- Make

### Setup using make file:
Use the [Makefile](Makefile) to create the kuberenetes cluster and all the resources

```make
make setup
```


### Setup manually using the belwo steps:
1. Use [kind-cluster-config.yaml](kind-cluster-config.yml) to create a kind cluster with extraPortMappings for routing http:80 and https:443 ports

2. Apply the `ingress-nginx` configs:

    ```bash
    kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
    ```

3. Deploy [petstore.yaml](petstore.yaml) file to create deployment, service and ingress.
