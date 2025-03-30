# Step-by-Step Guide to Deploying the CRUD Application on Azure

This guide will walk you through the process of deploying a CRUD application on Azure using Bicep templates. Follow these steps to ensure a successful deployment.

## Prerequisites

1. **Azure Account**: Ensure you have an active Azure subscription. If you don't have one, you can create a free account.
2. **Azure CLI**: Install the Azure Command-Line Interface (CLI) on your local machine.
3. **Bicep CLI**: Install the Bicep CLI to compile and deploy Bicep templates.
4. **Code Editor**: Use a code editor like Visual Studio Code for editing Bicep files.

## Step 1: Set Up Your Environment

1. Open your terminal or command prompt.
2. Log in to your Azure account using the command:
   ```
   az login
   ```

## Step 2: Clone the Project Repository

1. Clone the repository containing the Bicep files and other resources:
   ```
   git clone <repository-url>
   ```
2. Navigate to the project directory:
   ```
   cd azure-crud-app
   ```

## Step 3: Review the Bicep Files

1. Open the `bicep/main.bicep` file to understand how the resources are orchestrated.
2. Review the individual modules located in the `bicep/modules` directory:
   - `appService.bicep`: Defines the Azure Container Instance.
   - `database.bicep`: Provisions the database resource.
   - `storage.bicep`: Sets up Azure Storage.

## Step 4: Deploy the Bicep Template

1. Compile the Bicep file to an ARM template (optional):
   ```
   bicep build bicep/main.bicep
   ```
2. Deploy the Bicep template using the Azure CLI:
   ```
   az deployment group create --resource-group <your-resource-group> --template-file bicep/main.bicep --parameters <parameters-file>
   ```

## Step 5: Verify the Deployment

1. After the deployment completes, navigate to the Azure Portal.
2. Check the resources created in your specified resource group.
3. Ensure that the Azure Container Instance, database, and storage account are properly configured.

## Step 6: Test the CRUD Application

1. Access the deployed application using the public IP address of the Azure Container Instance.
2. Test the CRUD operations to ensure everything is functioning as expected.

## Step 7: Clean Up Resources

1. If you no longer need the resources, you can delete the resource group to clean up:
   ```
   az group delete --name <your-resource-group> --yes --no-wait
   ```

## Conclusion

You have successfully deployed a CRUD application on Azure using Bicep templates. This guide provided a step-by-step approach to set up your environment, deploy resources, and verify the application. For further enhancements, consider exploring Azure's monitoring and scaling features.