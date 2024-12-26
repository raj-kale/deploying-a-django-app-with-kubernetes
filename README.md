# Deploying a Django App with Kubernetes

This repository demonstrates how to deploy a Django app using Kubernetes. It includes steps for creating Docker images, pushing them to Docker Hub, and deploying the app using Kubernetes YAML configuration files.

---

## Prerequisites

- Docker installed on your system.
- Kubernetes cluster set up and `kubectl` configured.
- Docker Hub account to push Docker images.

---

## Steps to Deploy

### 1. Tagging the Docker Image

Tag the image to push it to Docker Hub:

```bash
docker image tag notes-app-k8s:latest rajk09/notes-app-k8s:latest
```

### 2. Pushing the Image to Docker Hub

Push the tagged image to your Docker Hub repository:

```bash
docker push rajk09/notes-app-k8s:latest
```

### 3. Creating Kubernetes YAML Files

Create the necessary Kubernetes YAML files for deployment:

- **Namespace YAML:**

  ```bash
  vim namespace.yml
  ```

- **Deployment YAML:**

  ```bash
  vim deployment.yml
  ```

- **Service YAML:**

  ```bash
  vim service.yml
  ```

### 4. Applying the YAML Files

Apply the YAML files using `kubectl`:

```bash
kubectl apply -f namespace.yml
# Output: namespace/notes-app created

kubectl apply -f deployment.yml
# Output: deployment.apps/notes-app-deployment created

kubectl apply -f service.yml
# Output: service/notes-app-service created
```

### 5. Checking the Pods

Verify that the pods are running in the namespace:

```bash
kubectl get pods -n notes-app
```

### 6. Exposing the Port

Expose the service to access it on port `8000`:

```bash
kubectl port-forward service/notes-app-service -n notes-app 8000:8000 --address=0.0.0.0
```

---

## Resources

This project uses resources from [TrainWithShubham](https://github.com/LondheShubham153/django-notes-app).

---

## Features

- Dockerized Django app ready for Kubernetes deployment.
- YAML configurations for Namespace, Deployment, and Service.
- Instructions to expose and test the app locally.

---

## Author

**Raj Kale**  
[GitHub Profile](https://github.com/rajkale715)
