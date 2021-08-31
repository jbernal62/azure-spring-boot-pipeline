Azure Project
## Terraform ## 

1. Create Azure Devops project for terraform, configure Connection Service to Azure Account and import the files within the folder "Terraform Project" in Azure Devops Repo. 

2. Configure Pipeline. Terraform project have a custom backend config in the variables.tf file. https://docs.microsoft.com/en-us/azure/developer/terraform/store-state-in-azure-storage?tabs=azure-cli parameters should change based on target subscription. 

<!-- terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraformstate"
    storage_account_name = "tfassessment"
    container_name       = "terraform-state"
    key                  = "terraform.tfstate"
  }
} -->

3. Create Pipeline. For the project I used Shared pool agents provided by Azure. However, for the effects of testing, local servers can be configured for job agent processing. 

4. Create and publish artifact Copy files to $(build.artifactstagingdirectory)/Terraform, target folder $(build.artifactstagingdirectory)/Terraform

5. import release pipeline from "Terraform Azure Devops Pipeline jSON file"

6. Create manual release and deploy. Once the deployment is completed, the backend container should show the terraform state file. Pipeline will be trigger by any push to the repository. Terraform init, validate, plan and apply are part of the release pipeline. 

## WebApp Maven Pipeline ## 

The following pipeline will deploy spring boot app package into Azure WebApp using Java as runtime.

1. Create Azure Devops project and initialize a new repository. 

2. Upload files from "WebApp Mave Pipeline folder"

3. Create service connection for Azure Subscription in projects settings. 

4. Import pipeline from spring-boot-pipeline.yml changing 

5.  import release pipeline from Devops Maven Release json file. "Changing values based on target environment"

6. Create manual release deploy and automatically, the code should push to the WebApp. 

## Docker Maven Pipeline ## 

A docker image was created for the spring boot project.

Container registry to pull Docker image. 

https://acrassessment.azurecr.io 
username : acrassessment
Password : unDZbXMkHHm78efvJyqocddJ/DThgWDU
image : image
tag : latest 


