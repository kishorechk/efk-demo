# Kubernetes EFK Stack Implementation

Welcome to the repository for our comprehensive guide on implementing the EFK (Elasticsearch, Fluentd, Kibana) stack on Kubernetes. This repository contains all the code and configuration files you'll need to set up your own log monitoring system on a Kubernetes cluster.

## About the Project

This project demonstrates how to collect, process, and analyze log data from services deployed on a Kubernetes (k8s) cluster. By leveraging the EFK stack, you can monitor system health, user activities, and security threats in a cloud-native environment.

## Quickstart

To get started with deploying the EFK stack on your Kubernetes cluster, clone this repository and follow the instructions provided in the `Makefile`.

```bash
git clone https://github.com/kishorechk/efk-demo.git
cd efk-demo
make deploy-all
```

## Blog Post

For a detailed walkthrough of this project, including step-by-step instructions and explanations, check out our Medium blog post:

📘 [Kubernetes Observability: EFK Stack Deployment Guide](https://medium.com/@yourusername/mastering-kubernetes-monitoring-with-efk-stack-a-step-by-step-guide-123456)

## Repository Structure

Here's a brief overview of what you'll find in this repository:

- `serviceA/`: Contains the Dockerfile and source code for a sample microservice A.
- `serviceB/`: Contains the Dockerfile and source code for a sample microservice B.
- `efk-helm-chart/`: Helm chart for deploying the EFK stack and the microservices on Kubernetes.
- `Makefile`: A list of commands to facilitate the building, deploying, and cleaning up of services and the EFK stack.

## Prerequisites

Before you begin, ensure you have the following installed:
- Docker
- Kubernetes cluster (e.g., minikube, kind)
- Helm 3

## Usage

To deploy the microservices and the EFK stack, run the following commands:

```bash
make deploy-serviceA
make deploy-serviceB
make deploy-efk
```

To clean up the deployment:

```bash
make clean
```

## Contributing

Contributions to this project are welcome! Please feel free to submit issues or pull requests with improvements.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Thanks to the Kubernetes and EFK communities for providing the tools and resources to make this project possible.

---

Happy monitoring!
