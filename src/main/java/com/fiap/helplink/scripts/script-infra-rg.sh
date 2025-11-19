#!/bin/bash

# ======================================
# Script: Criar Resource Group
# Projeto: HelpLink
# Alunos: Arthur (558798), Felipe (556099), Robert (555881)
# ======================================

# Variáveis
RG_NAME="RG-FIAP-HELPLINK"
LOCATION="eastus2"

echo "🚀 Criando Resource Group: $RG_NAME"

# Criar Resource Group
az group create \
  --name $RG_NAME \
  --location $LOCATION

if [ $? -eq 0 ]; then
  echo "✅ Resource Group criado com sucesso!"
  az group show --name $RG_NAME --output table
else
  echo "❌ Erro ao criar Resource Group"
  exit 1
fi