#!/bin/bash

# ======================================
# Script: Criar Container do Oracle Database
# Projeto: HelpLink
# ======================================

# Variáveis
RG_NAME="RG-FIAP-HELPLINK"
CONTAINER_NAME="helplink-oracle-db"
LOCATION="eastus"

# Credenciais do banco (ALTERE PARA SENHAS SEGURAS)
ORACLE_PWD="SenhaForte123#"

echo "🚀 Criando Container Oracle Database: $CONTAINER_NAME"

# Criar Container Instance com Oracle XE
az container create \
  --resource-group $RG_NAME \
  --name $CONTAINER_NAME \
  --image container-registry.oracle.com/database/express:21.3.0-xe \
  --os-type Linux \
  --cpu 2 \
  --memory 4 \
  --ports 1521 \
  --ip-address Public \
  --dns-name-label $CONTAINER_NAME \
  --environment-variables \
    ORACLE_PWD=$ORACLE_PWD \
    ORACLE_CHARACTERSET=AL32UTF8

if [ $? -eq 0 ]; then
  echo "✅ Container Oracle criado com sucesso!"

  # Obter informações de conexão
  CONTAINER_IP=$(az container show \
    --resource-group $RG_NAME \
    --name $CONTAINER_NAME \
    --query ipAddress.fqdn -o tsv)

  echo ""
  echo "📋 Informações de Conexão:"
  echo "Host: $CONTAINER_IP"
  echo "Port: 1521"
  echo "SID: XE"
  echo "User: system"
  echo "Password: $ORACLE_PWD"
  echo ""
  echo "String de Conexão:"
  echo "jdbc:oracle:thin:@$CONTAINER_IP:1521:XE"
  echo ""
  echo "⏳ Aguarde ~2-3 minutos para o Oracle inicializar completamente"
else
  echo "❌ Erro ao criar container"
  exit 1
fi