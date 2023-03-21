FROM maven:3.8-jdk-11-slim AS build
# Copier les fichiers de l'application vers le conteneur
COPY . /app
# Définir le répertoire de travail dans le conteneur
WORKDIR /app
# Créer le fichier JAR à partir du code source Java avec Maven
RUN mvn clean install -DskipTests
# Utiliser une image plus légère pour l'exécution de l'application
FROM openjdk:11-jre-slim
# Copier le fichier JAR créé dans l'étape précédente vers le conteneur
COPY --from=build /app/target/*.jar /app/my-spring-boot-app.jar
# Définir le répertoire de travail dans le conteneur
WORKDIR /app
# Exposer le port utilisé par l'application
EXPOSE 9090
# Démarrer l'application
CMD ["java", "-jar", "my-spring-boot-app.jar"]
