# kai-assessment

## Part 1: Infrastructure as Code (Azure)

### Pre-requisites to run this module - 

1. Install Terraform - https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
2. Create an Azure account
3. Install Azure CLI -  https://learn.microsoft.com/en-us/cli/azure/install-azure-cli
4. You might also need to add the azure secrets in the environment variables for authentication purposes - 

export ARM_SUBSCRIPTION_ID="your-subscription-id"
export ARM_TENANT_ID="your-tenant-id"
export ARM_CLIENT_ID="your-client-id"
export ARM_CLIENT_SECRET="your-client-secret"

source ~/.zshrc
   
---

### Steps to run this module - 
Step 1 
Login to the azure cli
command - az login

Step 2 
Pull this repository in your local
gh repo clone SwetaRathore2608/kai-assessment

Step 3
Run the below terraform commands to create the resources-

terraform init
terraform validate
terraform plan
terraform apply

Run the below command to destroy all the created resources - 
terraform destroy

Output/Logs

module.database.azurerm_postgresql_flexible_server.db: Creation complete after 6m3s [id=/subscriptions/623c0eb4-cfc0-4f05-9ade-d65bdd2b6752/resourceGroups/kai-assessment-group/providers/Microsoft.DBforPostgreSQL/flexibleServers/rg-gull-db]
Apply complete! Resources: 14 added, 0 changed, 0 destroyed.
Outputs:
resource_group_name = "kai-assessment-group"


Please find the complete output logs in the "Outputs/output-logs.txt" file.


Improvements - 
1. Secrets can be handled better - https://blog.gitguardian.com/how-to-handle-secrets-in-terraform/
   
