# EFK-Demo: Monitoring Kubernetes Services

This repository provides a demonstration of how to set up and use the EFK (Elasticsearch, Fluentd, Kibana) stack to monitor services running on a Kubernetes cluster.

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
  - [Setting Up the Cluster](#setting-up-the-cluster)
  - [Deploying the Services](#deploying-the-services)
  - [Deploying the EFK Stack](#deploying-the-efk-stack)
- [Usage](#usage)
- [Cleanup](#cleanup)
- [Contributing](#contributing)
- [License](#license)

## Overview

The EFK stack provides a powerful solution for monitoring logs from services running on Kubernetes. This demo showcases two sample Flask microservices and how their logs can be visualized and analyzed using the EFK stack.

## Prerequisites

- Docker
- Kubernetes (this demo uses `kind`)
- Helm v3
- `kubectl`
- `make`

## Getting Started

### Setting Up the Cluster

To create a local Kubernetes cluster using `kind`:

```bash
make create-cluster
```

### Deploying the Services

Build and deploy the two sample Flask microservices:

```bash
make deploy-serviceA
make deploy-serviceB
```

### Deploying the EFK Stack

Deploy Elasticsearch, Fluentd, and Kibana:

```bash
make deploy-elasticsearch
make deploy-fluentd
make deploy-kibana
```

## Usage

Once everything is set up:

1. Access the Kibana dashboard to visualize and query logs.
2. Interact with the Flask microservices to generate logs.
3. Use the Kibana interface to create visualizations, dashboards, and set up alerts.

## Cleanup

To clean up all deployed resources:

```bash
make clean
```

To delete the `kind` cluster:

```bash
make delete-cluster
```
