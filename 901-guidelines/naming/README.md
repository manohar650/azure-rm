# [Solution name]

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmarcvaneijk%2Ffoundation%2Fmaster%2F200-nested%2F200-template%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/></a>

This template deploys a [solution name]. The [solution name] is a [description]

`Tags: Cluster, SharePoint, Sql, AlwaysOn`

## Solution diagram and deployed resources

This diagram displays an overview of the solution

![alt text](../master/images/solutions.png "Solution")

The following resources are deployed as part of the solution

####Networking
This is the account that will contain your runbook and credentials. If you want to deploy to an existing account, make sure that the Resource Group, region, tags, and SKU in the template are all the same as your existing account, otherwise the properties will be overwritten. 
+ **Virtual network**: Consists of three subnets
+ **Load balancers**: The web servers
+ **Network Security Groups**: Each subnet is configured with
+ **Public IP Address**: The load balancer on the web tier is. The runbook provides an example of how you can authenticate to Azure and use Azure cmdlets in a runbook. It uses an Azure AD organizational ID to connect to Azure. It then prints out the first 10 VMs in your account.

####Storage
The runbook provides an example of how you can authenticate to Azure and use Azure cmdlets in a runbook. It uses an Azure AD organizational ID to connect to Azure. It then prints out the first 10 VMs in your account.
+ **Storage Accounts**: All tiers use the same storage account

####Compute
The credential should contain the username and password of the Azure AD organizational ID to connect to Azure.  To learn about how to create this user, see [Get set up to automate Azure]("http://aka.ms/getsetuptoautomate") and check out this blog post [Authenticating to Azure using Active Directory]("http://azure.microsoft.com/blog/2014/08/27/azure-automation-authenticating-to-azure-using-azure-active-directory/").  
+ **Web tier**: Each web server in this tier
+ **App tier**: The application tier
+ **Database tier**: For high availability the

## Prerequisites

This templates assumes a Azure Sql database already exists

## Deployment steps
You can either click the "deploy to Azure" button at the beginning of this document or deploy the solution from PowerShell with the following PowerShell script.

``` PowerShell
# Login to your subscription
Login-AzureRmAccount

# Variables, replace these with your own values
$ResourceGroupLocation = "West Europe"
$ResourceGroupName = "MyResourceGroup"
$RepositoryPath = "https://raw.githubusercontent.com/marcvaneijk/foundation/200-nested/master"

# Variables, used for constructing the required values
$TemplateFile = $RepositoryPath + '/' + "azuredeploy.json"
$TemplateParameterFile = $RepositoryPath + '/' + "azuredeploy.parameters.json"
$DeploymentName = (Get-ChildItem $TemplateFile).BaseName + ((get-date).ToUniversalTime()).ToString('MMddyyyyHHmmss')

# Create new Resource Group
New-AzureRmResourceGroup -Name $ResourceGroupName -Location $ResourceGroupLocation

# New Resource Group Deployment
New-AzureRmResourceGroupDeployment -Name $DeploymentName -ResourceGroupName $ResourceGroupName -TemplateFile $TemplateFile -TemplateParameterFile $TemplateParameterFile
```

## Usage
#### Connect
To connect to the SharePoint farm use the URI
#### Management
The SharePoint farm can be managed with the central administration website

## Notes
The certificate is based on selfsigned
