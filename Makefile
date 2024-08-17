NAMESPACE := <YOUR_NAMESPACE>

setup: setup-petstore-service

setup-cluster:
	kind create cluster --config=kind-cluster-config.yml

setup-ingress-controller: setup-cluster
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

wait-for-ingress-setup: setup-ingress-controller
	sleep 20
	kubectl get all -n ingress-nginx
	kubectl wait --namespace ingress-nginx --for=condition=ready pod --selector=app.kubernetes.io/component=controller --timeout=90s

setup-petstore-service: wait-for-ingress-setup
	kubectl apply -f petstore.yaml

purge:
	kind delete cluster