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

## Step 2 : Configuration of Gitlab CI

**important**: Before you start you need to make sure you can use the gitlab shared runners that we will use in this demo. If not, you can add our own runners to the project. To do this in your project go to `settings > CI/CD` then `Runners` then disable the shared runners and add your own by following the steps provided

Open the .gitlab-ci.yml file located at the root of the repository
```
variables:
  BACKEND_IMAGE_NAME: lugar2020/spring-backend
  FRONTEND_IMAGE_NAME: lugar2020/angular-frontend

stages:
  - build_push_image
  - deploy

build_spring_image:
  stage: build_push_image
  image: docker:20.10.16
  services:
    - docker:20.10.16-dind
  variables:
    DOCKER_TLS_CERTDIR: "/certs"
  before_script:
    - echo $DOCKER_PASSWORD | docker login -u $DOCKER_USER --password-stdin
    - cd spring-boot-h2-database-crud/
  script: 
    - docker build -t $BACKEND_IMAGE_NAME .
    - docker push $BACKEND_IMAGE_NAME

build_angular_image:
  stage: build_push_image
  image: docker:20.10.16
  services:
    - docker:20.10.16-dind
  variables:
    DOCKER_TLS_CERTDIR: "/certs"
  before_script:
    - echo $DOCKER_PASSWORD | docker login -u $DOCKER_USER --password-stdin
    - cd angular-14-crud-example/
  script: 
    - docker build -t $FRONTEND_IMAGE_NAME .
    - docker push $FRONTEND_IMAGE_NAME

deploy_application:
  stage: deploy
  image: devth/helm:latest
  before_script:
    - cd helm/
    - kubectl config get-contexts
    - kubectl config use-context kemanedonfack/devops-project-05:k8s-cluster
  script: 
    - helm install frontend angular-frontend
    - helm install backend spring-backend
  
```
Now let's dive into our .gitlab-ci.yml file to get a better understanding 

```
variables:
  BACKEND_IMAGE_NAME: lugar2020/spring-backend
  FRONTEND_IMAGE_NAME: lugar2020/angular-frontend
```

