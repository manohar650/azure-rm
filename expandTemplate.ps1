$resourceGroup = "yourExistingResourceGroup"
$templateUri = "https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/101-1vm-2nics-2subnets-1vnet/azuredeploy.json"
$templateParameterUri = "https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/101-1vm-2nics-2subnets-1vnet/azuredeploy.parameters.json"

$debugPreference = 'Continue'
$rawResponse = Test-AzureRmResourceGroupDeployment -TemplateUri $templateUri -TemplateParameterUri $templateParameterUri -ResourceGroupName $ResourceGroup 5>&1
$debugPreference = 'SilentlyContinue'
$httpResponse = $rawResponse | Where { $_ -like "*HTTP RESPONSE*"} | ForEach-Object {$_ -Replace 'DEBUG: ', ''}
$armTemplateJson = '{' + $httpResponse.Split('{',2)[1]
$armTemplateObject = $armTemplateJson | ConvertFrom-Json

# Full JSON repsonse
$armTemplateJson

# Validated Resources in PowerShell object
$armTemplateObject.properties.validatedResources | Select-Object name, type, apiVersion, location
