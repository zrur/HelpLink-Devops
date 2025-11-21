# 🤝 HelpLink – Global Solution FIAP (DevOps & Cloud – 2025)

Este repositório contém a aplicação **HelpLink**, desenvolvida como parte da **Global Solution da FIAP – 2º semestre de 2025**, na disciplina **DevOps Tools & Cloud Computing**.

A aplicação foi construída utilizando **Spring Boot**, empacotada em **Docker** e implantada automaticamente na nuvem através do **Azure DevOps + Azure Container Instances (ACI)**.

<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/3600f688-1bf8-460f-a5a6-18effee3b5f1" />

---

## 🧠 Descrição da Solução

O **HelpLink** é uma plataforma que conecta **doadores, ONGs e instituições sociais**, facilitando a criação, gerenciamento e distribuição de doações de forma organizada e transparente.

A solução permite:

- ✅ Cadastro de usuários  
- ✅ Cadastro de ONGs e causas sociais  
- ✅ Registro de doações  
- ✅ Consulta de dados em tempo real  
- ✅ Organização e gestão de doações  

O sistema foi desenvolvido utilizando **Spring Boot (Java 17)**, conectado a um banco de dados em container, empacotado em **Docker** e publicado automaticamente na cloud através do **Azure DevOps (CI/CD)** em uma **Azure Container Instance (ACI)**.

---

## ✅ Integrantes do Grupo

| Nome           | RM       |
|----------------|----------|
| Arthur Ramos   | RM558798 |
| Felipe Melo    | RM556099 |
| Robert Coimbra | RM555881 |

---

## 🚀 Tecnologias Utilizadas

- ☕ Java 17 + Spring Boot  
- 🧰 Maven  
- 🐳 Docker  
- 🗄️ Azure Container Registry (ACR)  
- ☁️ Azure Container Instance (ACI)  
- 🔁 Azure DevOps Pipelines (CI/CD)  
- 🗂️ Azure Repos  
- 📋 Azure Boards  

---

## 🏗️ Arquitetura em Nuvem (Azure)

| Recurso                     | Nome                    |
|------------------------------|-------------------------|
| Resource Group               | `RG-FIAP-HELPLINK`      |
| Container Registry           | `acrfiaphelplink`        |
| Container Instance (App)     | `helplink`                |
| Container Instance (DB)      | `helplink-oracle-db`      |
| Pipelines                    | Build + Release          |

### Fluxo DevOps (CI/CD)

```

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

````

✅ Automatização completa  
✅ Entrega contínua  
✅ Implantação sem uso de máquinas virtuais  

---

## 🌐 Links do Projeto (OFICIAL)

🔷 **Azure DevOps**  
https://dev.azure.com/RM558798/HelpLink



---

## ⚙️ Pipeline DevOps

### 🧱 CI – Integração Contínua (Build)

Responsável por:

- Build automático do projeto  
- Criação da imagem Docker  
- Envio para o Azure Container Registry (ACR)  

<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/2b883df2-d08d-4ce3-8c8e-9accf3f154cf" />


---

### 🚀 CD – Entrega Contínua (Release / Deploy)

Responsável por:

- Consumir a imagem do ACR  
- Criar/atualizar a Azure Container Instance  
- Publicar automaticamente a aplicação  

<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/95c10b54-b0d3-4207-96fb-9fd35bf55811" />

---

## 📋 Azure Boards (Gestão do Projeto)

Work Items criados para organização do projeto:

![Uploading image.png…]()

Isso comprova a utilização de **metodologia DevOps** e **gestão ágil do projeto**.

---

## 🐳 Docker

**Dockerfile da aplicação:**

```dockerfile
FROM openjdk:17
COPY target/helplink.jar helplink.jar
ENTRYPOINT ["java", "-jar", "helplink.jar"]
````

---

## ☁️ Azure – Principais recursos utilizados

### 🔹 Azure Container Registry (ACR)

| Propriedade  | Valor                                        |
| ------------ | -------------------------------------------- |
| Nome         | `acrfiaphelplink`                            |
| Login Server | `acrfiaphelplink.azurecr.io`                 |
| Imagem       | `acrfiaphelplink.azurecr.io/helplink:latest` |

### 🔹 Azure Container Instance (ACI)

| Propriedade    | Valor                  |
| -------------- | ---------------------- |
| Nome           | `helplink`             |
| Resource Group | `RG-FIAP-HELPLINK`     |
| DNS público    | Gerado automaticamente |

---

## 🧪 Testes Realizados

* ✅ Aplicação acessada pelo navegador
* ✅ APIs testadas via Postman
* ✅ Comunicação entre containers confirmada
* ✅ Deploy automático validado

---

## 📦 Estrutura do Projeto

```
📦 helplink
├── src/main/java/br.com.fiap.helplink
├── src/main/resources
├── Dockerfile
├── pom.xml
├── azure-pipelines.yml
└── README.md
```

---

## ✅ Status Final do Projeto

| Etapa                    | Status       |
| ------------------------ | ------------ |
| CI com Docker            | ✅ Concluído  |
| CD com Deploy na ACI     | ✅ Concluído  |
| Aplicação em nuvem       | ✅ Online     |
| Azure DevOps configurado | ✅ Completo   |
| Documentação             | ✅ Finalizada |

---

## 🏁 Conclusão

O **HelpLink** demonstra com sucesso a aplicação real de uma arquitetura moderna de **DevOps + Cloud utilizando a plataforma Microsoft Azure**.

O projeto contempla todo o ciclo de desenvolvimento moderno, desde o versionamento do código até a entrega automatizada em produção na nuvem, comprovando domínio sobre:

* ✅ CI/CD
* ✅ Containers
* ✅ Infraestrutura em nuvem
* ✅ Automação de processos
* ✅ DevOps na prática

```
```
