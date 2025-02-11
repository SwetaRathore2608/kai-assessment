# kai-assessment

## Part 1: Infrastructure as Code (Azure)

### Pre-requisites to run this module - 

1. Install Terraform - https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
2. Create an Azure account
3. Install Azure CLI -  https://learn.microsoft.com/en-us/cli/azure/install-azure-cli
4. You might also need to add the azure secrets in the environment variables for authentication purposes - 

```
export ARM_SUBSCRIPTION_ID="your-subscription-id"
export ARM_TENANT_ID="your-tenant-id"
export ARM_CLIENT_ID="your-client-id"
export ARM_CLIENT_SECRET="your-client-secret"
```

```
source ~/.zshrc
```

---

### Steps to run this module - 
Step 1 
Login to the azure cli
```
az login
```

Step 2 
Pull this repository in your local
```
gh repo clone SwetaRathore2608/kai-assessment
```

Step 3
Run the below terraform commands to create the resources-

```
terraform init
terraform validate
terraform plan
terraform apply
```

Run the below command to destroy all the created resources - 

```
terraform destroy
```

Output/Logs

```
module.database.azurerm_postgresql_flexible_server.db: Creation complete after 6m3s [id=/subscriptions/623c0eb4-cfc0-4f05-9ade-d65bdd2b6752/resourceGroups/kai-assessment-group/providers/Microsoft.DBforPostgreSQL/flexibleServers/rg-gull-db]
Apply complete! Resources: 14 added, 0 changed, 0 destroyed.
Outputs:
resource_group_name = "kai-assessment-group"
```

Please find the complete output logs in the "Outputs/output-logs.txt" file.


Improvements - 
1. Secrets can be handled better - https://blog.gitguardian.com/how-to-handle-secrets-in-terraform/


## Part 2 - CI/CD Pipeline (Azure pipelines)

### Pre-requisites to run this module

1. Install kubectl
2. Configure access to the AKS cluster -
   ```
   az aks get-credentials --resource-group <resource_group> --name <aks_cluster>
   ```
3. Install Docker
4. Create an Azure Container Registry (ACR) to store the images, make sure you are logged through the Azure CLI -
   ```
   az login
   az acr create --resource-group <resource_group> --name <acr_name> --sku Basic
   ```
5. Provide admin access to the newly created ACR
   ```
   az acr update -n <acrName> --admin-enabled true
   ```
9. From your Azure web portal, create an Azure DevOps Organization and a project
10. Import the sample project into the project repository - https://github.com/chanduusc/Devops-task
11. If you are using a free tier azure account, you will have to create a Self-hosted Agent to run a pipeline. Please follow these instructions - https://medium.com/@shekhartarare/creating-a-self-hosted-agent-for-azure-pipelines-a-step-by-step-guide-a1cbd1c683d1
12. Create a service connection in Azure Devops with Docker. From your Azure portal, navigate to Project Settings -> New Service Connection -> Docker Registry and follow the instructions.

---

### Pipeline Design

I have designed and implemented a very basic pipeline -

1. Build the image for the given code repository
2. Publish the image into the ACR
3. Pick the image and deploy it into the AKS cluster
4. Rollback functinality incase of failure at any step

### Implementation steps

1. From the Azure Devops web portal, navigate to the devops organization
2. Create a Pipeline by choosing the linked repository, project details and configuration of the pipeline. In my case I have used - "Deploy to Azure Kubernetes Service". Confirm the Subscription details, review and create.
3. Copy and paste the configurations provided in the file - Azure/pipeline.txt
4. Save and Run the pipeline

<img width="1451" alt="image" src="https://github.com/user-attachments/assets/c5e387f7-acd9-45f0-a166-9ec7274a18e1" />

<img width="1441" alt="image" src="https://github.com/user-attachments/assets/2a0a7d66-8917-474e-ba56-ae313ae4396d" />

<img width="1009" alt="image" src="https://github.com/user-attachments/assets/ebe1b06e-3130-47a4-a8ea-376b113a09c3" />
