the following PowerShell script:

    ```PowerShell
    # Variables
    $Uri = 'https://raw.githubusercontent.com/Azure/AzureStack-Tools/master/'
    $LocalPath = 'c:\AzureRMTemplateValidator'

    # Create folder
    New-Item $LocalPath -type directory

    # Download Template Validator files
    ( 'AzureStackCapabilities_TP2.json', 'AzureRM.TemplateValidator.psm1') | foreach { Invoke-WebRequest ($uri + 'TemplateValidator/' +$_) -OutFile ($LocalPath + '\' + $_) }

    # Download Template Validator files
    Invoke-WebRequest 'https://raw.githubusercontent.com/Azure/AzureStack-Tools/master/CloudCapabilities/AzureRM.CloudCapabilities.psm1' -OutFile ($LocalPath + '\' + 'AzureRM.CloudCapabilities.psm1') 
    ```

## Validate templates
