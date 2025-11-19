#!/bin/bash

# ======================================
# Script: Criar Azure Container Registry
# Projeto: HelpLink
# ======================================

# Variáveis
RG_NAME="RG-FIAP-HELPLINK"
ACR_NAME="acrfiaphelplink"  # Deve ser único globalmente
LOCATION="eastus2"

echo "🚀 Criando Azure Container Registry: $ACR_NAME"

# Criar ACR
az acr create \
  --resource-group $RG_NAME \
  --name $ACR_NAME \
  --sku Standard \
  --location $LOCATION \
  --admin-enabled true

if [ $? -eq 0 ]; then
  echo "✅ ACR criado com sucesso!"

  # Obter credenciais
  echo "📋 Credenciais do ACR:"
  ACR_USERNAME=$(az acr credential show --name $ACR_NAME --query username -o tsv)
  ACR_PASSWORD=$(az acr credential show --name $ACR_NAME --query "passwords[0].value" -o tsv)
  ACR_LOGIN_SERVER=$(az acr show --name $ACR_NAME --query loginServer -o tsv)

  echo "Login Server: $ACR_LOGIN_SERVER"
  echo "Username: $ACR_USERNAME"
  echo "Password: $ACR_PASSWORD"
  echo ""
  echo "⚠️  Guarde essas credenciais para configurar no Azure DevOps!"
else
  echo "❌ Erro ao criar ACR"
  exit 1
fi