# Azure CRUD Application

This project is designed to deploy a CRUD (Create, Read, Update, Delete) application on Azure using Bicep templates. The application leverages various Azure resources to provide a robust and scalable solution for managing data.

## Project Overview

The Azure CRUD application consists of the following key components:

- **Azure App Service**: Hosts the application code and provides a platform for running web applications.
- **Azure Database**: Stores the application's data securely and allows for efficient data management.
- **Azure Storage**: Provides file storage capabilities for any necessary files or assets used by the application.

## Architecture Diagram

An architecture diagram is available in the `diagrams` folder, which visually represents the deployment architecture of the CRUD application. This diagram includes all resources and their interactions.

## Bicep Templates

The Bicep templates are organized into modules for better maintainability and clarity:

- **main.bicep**: The main template that orchestrates the deployment of all resources.
- **appService.bicep**: Defines the Azure App Service configuration.
- **database.bicep**: Provisions the database resource with necessary configurations.
- **storage.bicep**: Sets up Azure Storage for file storage needs.

## Step-by-Step Deployment Guide

A detailed step-by-step guide on how to deploy the CRUD application using the Bicep templates is provided in the `docs` folder. This guide covers:

1. Understanding Infrastructure-as-Code (IaC) principles.
2. Setting up the Azure environment.
3. Deploying the Bicep templates.
4. Verifying the deployment and accessing the application.

## Getting Started

To get started with the Azure CRUD application, follow the instructions in the step-by-step guide and ensure you have the necessary Azure subscriptions and permissions to deploy resources.

For any questions or issues, please refer to the documentation or reach out for support.