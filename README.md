🤝 HelpLink – Global Solution FIAP (DevOps & Cloud – 2025)










Este repositório contém a aplicação HelpLink, desenvolvida como parte da Global Solution da FIAP – 2º semestre de 2025, na disciplina DevOps Tools & Cloud Computing.

A aplicação foi construída utilizando Spring Boot, empacotada em Docker e implantada automaticamente na nuvem através do Azure DevOps + Azure Container Instances (ACI).

🧠 Descrição da Solução

O HelpLink é uma plataforma que conecta doadores, ONGs e instituições sociais, facilitando a criação, gerenciamento e distribuição de doações de forma organizada e transparente.

A solução permite:

Cadastro de usuários

Cadastro de ONGs e causas sociais

Registro de doações

Consulta de dados em tempo real

Organização e gestão de doações

O sistema foi desenvolvido utilizando Spring Boot (Java 17), conectado a um banco de dados em container, empacotado em Docker e publicado automaticamente na cloud através do Azure DevOps (CI/CD) em uma Azure Container Instance (ACI).

✅ Integrantes do Grupo
Nome	RM
Arthur Ramos	RM558798
Felipe Melo	RM556099
Robert Coimbra	RM555881
🚀 Tecnologias Utilizadas

☕ Java 17 + Spring Boot

🧰 Maven

🐳 Docker

🗄️ Azure Container Registry (ACR)

☁️ Azure Container Instance (ACI)

🔁 Azure DevOps Pipelines (CI/CD)

🗂️ Azure Repos

📋 Azure Boards

🏗️ Arquitetura em Nuvem (Azure)
Recurso	Nome
Resource Group	RG-FIAP-HELPLINK
Container Registry	acrfiaphelplink
Container Instance (App)	helplink
Container Instance (DB)	helplink-oracle-db
Pipelines	Build + Release (Azure DevOps)
Fluxo DevOps (CI/CD)
Desenvolvedor
   ↓
Azure Repos
   ↓
Pipeline de Build
   ↓
Azure Container Registry (ACR)
   ↓
Pipeline de Release
   ↓
Azure Container Instance (ACI)
   ↓
Aplicação em produção


✔️ Automatização completa
✔️ Entrega contínua
✔️ Implantação sem uso de VM

🌐 Links do Projeto (OFICIAL)

🔷 Azure DevOps:
https://dev.azure.com/RM558798/HelpLink

🔷 Repositório GitHub:
https://github.com/zrur/HelpLink-Devops

⚙️ Pipeline DevOps
🧱 CI – Integração Contínua (Build)

Responsável por:

Build automático do projeto

Criação da imagem Docker

Envio para o Azure Container Registry (ACR)

✅ Status: Succeeded (verde)

🚀 CD – Entrega Contínua (Release / Deploy)

Responsável por:

Consumir a imagem do ACR

Criar/atualizar a Azure Container Instance

Publicar automaticamente a aplicação

✅ Status: Succeeded (verde)

📋 Azure Boards (Gestão do Projeto)

Foram criados Work Items no Azure Boards para organização do projeto:

✅ Configurar CI/CD para HelpLink

✅ Criar Pipeline de Build

✅ Criar Pipeline de Release (Deploy na ACI)

✅ Testar aplicação em produção

Isso comprova o uso de metodologia DevOps e gestão ágil do projeto.

🐳 Docker

Dockerfile da aplicação:

FROM openjdk:17
COPY target/helplink.jar helplink.jar
ENTRYPOINT ["java", "-jar", "helplink.jar"]

☁️ Azure – Principais recursos utilizados
Azure Container Registry (ACR)
Propriedade	Valor
Nome	acrfiaphelplink
Login Server	acrfiaphelplink.azurecr.io
Imagem	acrfiaphelplink.azurecr.io/helplink:latest
Azure Container Instance (ACI)
Propriedade	Valor
Nome	helplink
Resource Group	RG-FIAP-HELPLINK
DNS público	Gerado automaticamente pelo Azure
🧪 Testes Realizados

✅ Aplicação acessada pelo navegador

✅ APIs testadas com Postman

✅ Comunicação entre containers confirmada

✅ Deploy automático validado

📦 Estrutura do Projeto
📦 helplink
├── src/main/java/br.com.fiap.helplink
├── src/main/resources
├── Dockerfile
├── pom.xml
├── azure-pipelines.yml
└── README.md

✅ Status Final do Projeto
Etapa	Status
CI com Docker	✅ Concluído
CD com Deploy na ACI	✅ Concluído
Aplicação em nuvem	✅ Online
Azure DevOps	✅ Configurado
Documentação	✅ Completa
🏁 Conclusão

O HelpLink demonstra com sucesso a aplicação real de uma arquitetura DevOps + Cloud utilizando a plataforma Microsoft Azure. O projeto contempla todo o ciclo moderno de desenvolvimento, desde o versionamento do código até a entrega automatizada em produção na nuvem.

Ele comprova domínio sobre:

CI/CD

Containers

Infraestrutura em nuvem

Automação de processos

DevOps na prática
