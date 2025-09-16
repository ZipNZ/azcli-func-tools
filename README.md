# azcli-func-tools

Docker image that bundles **Azure CLI** and **Azure Functions Core Tools** for use in build and deployment pipelines.  
This image is primarily used by services like the **PDF Generator** to run and manage Azure Functions deployments.

---

## **Contents**
- Ubuntu 22.04 LTS base
- Node.js 22 LTS
- Azure CLI
- Azure Functions Core Tools v4

---

## **Building & Pushing Image**

```bash
# Build the Docker image
docker build -t zipnz/azcli-func-tools:latest .
# Push the image to the registry 
docker push zipnz/azcli-func-tools:latest
```
---

## **Usage Example**

Run the container interactively to access Azure CLI and Function Core Tools:

```bash
docker run --rm -it zipnz/azcli-func-tools:latest bash
```

