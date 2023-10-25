# Variables
CLUSTER_NAME := efk-demo
SERVICE_A_IMAGE_NAME := efk-demo-app-a:1.0.0
SERVICE_B_IMAGE_NAME := efk-demo-app-b:1.0.0
HELM_RELEASE_A := servicea-release
HELM_RELEASE_B := serviceb-release
ELASTIC_REPO := https://helm.elastic.co

# Create kind cluster
create-cluster:
	kind create cluster --name $(CLUSTER_NAME)

# Build Docker images
build-serviceA:
	cd serviceA && docker build -t $(SERVICE_A_IMAGE_NAME) .

build-serviceB:
	cd serviceB && docker build -t $(SERVICE_B_IMAGE_NAME) .

# Load Docker images into kind (since kind uses its own Docker daemon)
load-serviceA: build-serviceA
	kind load docker-image $(SERVICE_A_IMAGE_NAME) --name $(CLUSTER_NAME)

load-serviceB: build-serviceB
	kind load docker-image $(SERVICE_B_IMAGE_NAME) --name $(CLUSTER_NAME)

# Deploy services using Helm
deploy-serviceA: load-serviceA
	helm upgrade --install $(HELM_RELEASE_A) ./efk-helm-chart -f ./efk-helm-chart/valuesServiceA.yaml

deploy-serviceB: load-serviceB
	helm upgrade --install $(HELM_RELEASE_B) ./efk-helm-chart -f ./efk-helm-chart/valuesServiceB.yaml

# Deploy EFK stack
deploy-elasticsearch:
	helm repo add elastic $(ELASTIC_REPO)
	helm install elasticsearch elastic/elasticsearch

deploy-fluentd:
	helm install fluentd bitnami/fluentd --set elasticsearch.host=elasticsearch-master

deploy-kibana:
	helm install kibana elastic/kibana

# Combined targets
deploy-efk: deploy-elasticsearch deploy-fluentd deploy-kibana

deploy-all: deploy-serviceA deploy-serviceB deploy-efk

# Clean up
clean:
	helm uninstall $(HELM_RELEASE_A)
	helm uninstall $(HELM_RELEASE_B)
	helm uninstall elasticsearch
	helm uninstall fluentd
	helm uninstall kibana

# Delete kind cluster
delete-cluster:
	kind delete cluster --name $(CLUSTER_NAME)

.PHONY: create-cluster build-serviceA build-serviceB load-serviceA load-serviceB deploy-serviceA deploy-serviceB deploy-elasticsearch deploy-fluentd deploy-kibana deploy-efk deploy-all clean delete-cluster
