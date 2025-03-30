param location string = resourceGroup().location
@minLength(3)
param appName string

// Create a Virtual Network and Subnet
resource vnet 'Microsoft.Network/virtualNetworks@2024-05-01' = {
  name: '${appName}-vnet'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: ['10.0.0.0/16']
    }
    subnets: [
      {
        name: '${appName}-subnet'
        properties: {
          addressPrefix: '10.0.1.0/24'
          networkSecurityGroup: {
            id: nsg.id
          }
        }
      }
    ]
  }
}

// Create a Network Security Group (NSG)
resource nsg 'Microsoft.Network/networkSecurityGroups@2024-05-01' = {
  name: '${appName}-nsg'
  location: location
  properties: {
    securityRules: [
      {
        name: 'AllowHTTP'
        properties: {
          priority: 100
          direction: 'Inbound'
          access: 'Allow'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '80'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
        }
      }
      {
        name: 'DenyAllInbound'
        properties: {
          priority: 200
          direction: 'Inbound'
          access: 'Deny'
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '*'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
        }
      }
    ]
  }
}

// Create Azure Container Registry (ACR)
resource acr 'Microsoft.ContainerRegistry/registries@2024-11-01-preview' = {
  name: '${appName}acr'
  location: location
  sku: {
    name: 'Basic'
  }
  properties: {
    adminUserEnabled: true
  }
}

// Create Log Analytics Workspace
resource logAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2023-09-01' = {
  name: '${appName}loganalytics'
  location: location
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 30
  }
}

// Outputs
output acrLoginServer string = acr.properties.loginServer
output acrResourceId string = acr.id
output logAnalyticsWorkspaceId string = logAnalyticsWorkspace.properties.customerId
// Removed the output exposing the secret key to comply with best practices
// output logAnalyticsWorkspaceKey string = listKeys(logAnalyticsWorkspace.id, '2020-08-01').primarySharedKey
