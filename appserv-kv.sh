# Script to validate communication between Azure App Service and Azure Key Vault

# Set Azure resource names (replace with your actual names)
RESOURCE_GROUP="<your_resource_group_name>"
APP_SERVICE_NAME="<your_app_service_name>"
KEY_VAULT_NAME="<your_key_vault_name>"

# Get access token for Azure Resource Manager (ARM)
access_token=$(az account get-access-token --query accessToken -o output=t)

# Function to check Key Vault secret access
check_keyvault_access() {
  secret_name="<your_key_vault_secret_name>"
  secret_uri="https://${KEY_VAULT_NAME}.vault.azure.net/secrets/${secret_name}?api-version=2016-10-01"

  # Use Azure CLI to get secret using managed identity
  az keyvault secret get --name "$secret_name" --vault-name "$KEY_VAULT_NAME" --query value -o output=t --headers "Authorization: Bearer $access_token"  &> /dev/null

  # Check for non-zero exit code (indicating error)
  if [[ $? -ne 0 ]]; then
    echo "Error: Failed to access secret '$secret_name' from Key Vault '$KEY_VAULT_NAME'"
    exit 1
  fi

  echo "Successfully accessed secret '$secret_name' from Key Vault '$KEY_VAULT_NAME'"
}

# Call the function to check access
check_keyvault_access

# If script reaches here, communication is successful
echo "Communication between Azure App Service '$APP_SERVICE_NAME' and Azure Key Vault '$KEY_VAULT_NAME' seems to be functioning."
