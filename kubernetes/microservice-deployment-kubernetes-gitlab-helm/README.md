# Microservices App Deployment to kubernetes with Helm via GitLab CI

## Introduction
In today's fast-paced software development environment, it is essential to deploy applications quickly and efficiently. **Microservices** architecture is becoming increasingly popular for its ability to create highly scalable and flexible applications. **Kubernetes**, a popular open-source container orchestration system, has also become the go-to solution for microservices deployment. In this article, we will walk through the process of deploying applications from microservices to a Kubernetes cluster with **Helm** via **GitLab CI**.

[GitLab CI](https://gitlab.com/) is an integral part of the GitLab platform and provides a robust continuous integration and deployment (CI/CD) pipeline. It allows developers to automate the building, testing and deployment of their applications. [Helm](https://helm.sh/) is a package manager for Kubernetes that allows users to install, upgrade and manage applications in a Kubernetes cluster.

## Prerequisites
To perform this demo, you will need to have the following prerequisites:
- **A Kubernetes cluster**: You can use an existing Kubernetes cluster or create a new one on a cloud provider such as Google Cloud, Amazon Web Services or Microsoft Azure.
- **A GitLab account**: You will need a GitLab account to set up the CI/CD pipeline.
- **Docker Hub account**: You will need a Docker Hub account to store Docker images.

## What is Helm ?
[Helm](https://helm.sh/) is a package manager for Kubernetes that allows you to easily install and manage applications on a Kubernetes cluster. Helm uses charts to define the structure and configuration of an application, which can be versioned and shared between teams.

**Helm chart** is a package that contains all the Kubernetes manifests, configuration files and dependencies needed to install and run an application on a Kubernetes cluster. It defines the structure and configuration of an application, including items such as environment variables, ports, volumes and service dependencies.

## Step 1 : Clone the repository
You can find the complete source code of the project at the address below: [source code](https://github.com/kemanedonfack/community/tree/master/kubernetes/microservice-deployment-kubernetes-gitlab-helm)
Let's  briefly explain the folders in the repository
![Capture](https://user-images.githubusercontent.com/70517765/226720738-84c6c466-43ab-40af-923e-ddf208bffc10.PNG)

The above screenshot shows the different directories of the source code: 
- **.gitlab/agents/k8s-cluster**: contains the configurations of our kubernetes agent for server we will discuss in more detail later in this article
- **angular-14-crud-example**: this directory contains the source code of our frontend application developed with the Angular Framework
- **helm**: contains the different files to deploy our application under kubernetes via Helm
- **kubernetes**: contains the different files to deploy our application on kubernetes without using Helm
- **spring-boot-h2-database-crud**: contains the source code of our backend application developed with the Spring boot framework
- **.gitlab-ci.yml**: which is the core of our pipeline is the file where we describe the different steps of our pipeline
- **docker-compose.yml** this file allows us to deploy our application under docker


