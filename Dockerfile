FROM mcr.microsoft.com/powershell

RUN apt-get update
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

COPY acr-cleanup.ps1 .

ENV NO_OF_KEPT_IMAGES=5

CMD pwsh acr-cleanup.ps1 -ServicePrincipalId $SERVICE_PRINCIPAL_ID -ServicePrincipalPass $SERVICE_PRINCIPAL_PASS -ServicePrincipalTenant $SERVICE_PRINCIPAL_TENANT -AzureRegistryName $AZURE_REGISTRY_NAME -NoOfKeptImages $NO_OF_KEPT_IMAGES
