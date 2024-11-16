# Usar OpenJDK 17 como imagen base
FROM openjdk:17-jdk

# Establecer el directorio de trabajo en el contenedor
WORKDIR /app

# Copiar el JAR generado por Maven al contenedor
COPY target/evaluacion-devops-1.0-SNAPSHOT.jar /app/evaluacion-devops.jar

# Definir el comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "/app/evaluacion-devops.jar"]

# Exponer el puerto 8080
EXPOSE 8080