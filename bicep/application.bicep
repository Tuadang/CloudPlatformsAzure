param location string = resourceGroup().location
@minLength(3)
param appName string
param acrLoginServer string
param acrName string

resource existingAcr 'Microsoft.ContainerRegistry/registries@2024-11-01-preview' existing = {
  name: acrName
}

param logAnalyticsWorkspaceId string
param logAnalyticsWorkspaceKey string

// Define a container group with managed identity
resource containerGroup 'Microsoft.ContainerInstance/containerGroups@2023-05-01' = {
  name: '${appName}-cg'
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    containers: [
      {
        name: '${appName}-container'
        properties: {
          image: '${acrLoginServer}/flask-crud:latest'
          resources: {
            requests: {
              cpu: 1
              memoryInGB: 2
            }
          }
          ports: [
            {
              port: 80
            }
          ]
        }
      }
    ]
    osType: 'Linux'
    restartPolicy: 'Always'
    ipAddress: {
      type: 'Public'
      dnsNameLabel: appName
      ports: [
        {
          port: 80
          protocol: 'TCP'
        }
      ]
    }
    diagnostics: {
      logAnalytics: {
        workspaceId: logAnalyticsWorkspaceId
        workspaceKey: logAnalyticsWorkspaceKey
      }
    }
    imageRegistryCredentials: [
      {
        server: acrLoginServer
        username: existingAcr.listCredentials().username
        password: existingAcr.listCredentials().passwords[0].value
      }
    ]
  }
}

// Assign AcrPull role to the container group
resource acrPullRoleAssignment 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' = {
  name: guid(existingAcr.id, 'AcrPull')
  scope: existingAcr
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '7f951dda-4ed3-4680-a7ca-43fe172d538d') // AcrPull role
    principalId: containerGroup.identity.principalId
  }
}
