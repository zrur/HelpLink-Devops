# ======================================
# Dockerfile: HelpLink Application
# Java 17 + Spring Boot
# ======================================

# Stage 1: Build
FROM maven:3.9-eclipse-temurin-17-alpine AS build

WORKDIR /app

# Copiar pom.xml e baixar dependências
COPY pom.xml .
RUN mvn dependency:go-offline

# Copiar código fonte e compilar
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Runtime
FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

# Copiar JAR da etapa de build
COPY --from=build /app/target/*.jar app.jar

# Expor porta
EXPOSE 8080

# Variáveis de ambiente (serão sobrescritas no ACI)
ENV SPRING_PROFILES_ACTIVE=prod

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=60s \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8080/actuator/health || exit 1

# Executar aplicação
ENTRYPOINT ["java", "-jar", "/app/app.jar"]