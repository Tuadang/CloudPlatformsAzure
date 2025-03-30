# Azure CRUD Application

This project demonstrates how to deploy a CRUD (Create, Read, Update, Delete) application on Azure using Bicep templates. The application leverages Azure services to provide a scalable, secure, and efficient solution for managing data.

## Project Overview

The Azure CRUD application consists of the following key components:

- **Azure Container Instance (ACI)**: Runs the containerized CRUD application.
- **Azure Container Registry (ACR)**: Stores the Docker image for the application.
- **Log Analytics Workspace**: Collects logs and diagnostics.
- **Azure Resource Group**: Groups all resources together

## Architecture Diagram

The architecture of the CRUD application includes the following interactions:
1. The client (browser) accesses the application via the FQDN of the Azure Container Instance.
2. The Azure Container Instance pulls the Docker image from the Azure Container Registry.
3. Logs and diagnostics from the Azure Container Instance are sent to the Log Analytics Workspace.

## Bicep Templates

The Bicep templates are modular and organized for better maintainability:

- **`infrastructure.bicep`**: Deploys the foundational infrastructure, including ACR, Log Analytics Workspace, and networking resources.
- **`application.bicep`**: Deploys the Azure Container Instance and configures it to pull the Docker image from ACR.

## Step-by-Step Deployment Guide

A comprehensive step-by-step guide is available in the [`docs`](./docs/step-by-step-guide.md) folder. The guide includes:
1. Setting up your Azure environment.
2. Deploying the infrastructure using `infrastructure.bicep`.
3. Building and pushing the Docker image to ACR.
4. Deploying the application using `application.bicep`.
5. Verifying the deployment and accessing the application.
6. Checking logs in Azure Monitor via the Log Analytics Workspace.

## Getting Started

### Prerequisites
1. **Azure Account**: Ensure you have an active Azure subscription.
2. **Azure CLI**: Install the Azure Command-Line Interface (CLI).
3. **Docker**: Install Docker to build and push the container image.

### Quick Start
1. Clone this repository:
   ```sh
   git clone <repository-url>
   cd azure-crud-app