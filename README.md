# Hola Noelia - Aplicación Quarkus

Esta es una aplicación hermosa de Quarkus que muestra el mensaje "Hola soy NOelia desde Quarkus" con una interfaz web moderna y atractiva.

## ✨ Características

- 🎨 **Interfaz web moderna** con diseño responsive
- 🚀 **Arranque súper rápido** con Quarkus
- 📱 **Completamente responsive** para móviles y tablets
- 🎭 **Animaciones y efectos** visuales atractivos
- 🔗 **Múltiples endpoints** (texto, JSON, web)
- 🔄 **CI/CD Pipeline** con Jenkins
- 🐳 **Containerización** con Docker
- ☁️ **Despliegue en Azure** App Service

## 🎯 Endpoints disponibles

- `GET /` - Redirige automáticamente a la interfaz web
- `GET /hola/web` - Interfaz web hermosa y moderna
- `GET /hola` - Devuelve el mensaje en texto plano
- `GET /hola/json` - Devuelve el mensaje en formato JSON

## 🚀 Cómo ejecutar la aplicación

### Modo desarrollo (recomendado)
```bash
mvn quarkus:dev
```

### Modo producción
```bash
mvn clean package
java -jar target/quarkus-app/quarkus-run.jar
```

## 🌐 Acceso a la aplicación

Una vez que la aplicación esté ejecutándose, puedes acceder a:

- **Interfaz principal**: http://localhost:8080/ (redirige automáticamente)
- **Interfaz web**: http://localhost:8080/hola/web
- **API texto**: http://localhost:8080/hola
- **API JSON**: http://localhost:8080/hola/json

## 🐳 Docker

### Construir y ejecutar con Docker
```bash
# Construir la imagen
docker build -t hola-noelia .

# Ejecutar el contenedor
docker run -p 8080:8080 hola-noelia
```

### Usar Docker Compose
```bash
# Construir y ejecutar todos los servicios
docker-compose up -d

# Ver logs
docker-compose logs -f

# Detener servicios
docker-compose down
```

## ☁️ Despliegue en Azure App Service

### Aplicación en Producción

La aplicación está desplegada y funcionando en Azure App Service:

**🌐 URL de producción:** https://hola-noelia-app.azurewebsites.net

### Configuración del Despliegue

#### 1. Preparar la imagen Docker
```bash
# Construir imagen local
docker build -t hola-noelia .

# Etiquetar para Docker Hub
docker tag hola-noelia:latest santiagososam/hola-noelia:latest

# Subir a Docker Hub
docker push santiagososam/hola-noelia:latest
```

#### 2. Crear App Service en Azure
```bash
# Crear grupo de recursos
az group create --name hola-noelia-rg --location eastus

# Crear App Service Plan (Linux)
az appservice plan create --name hola-noelia-plan --resource-group hola-noelia-rg --location eastus --is-linux --sku B1

# Crear App Service con Docker
az webapp create --resource-group hola-noelia-rg --plan hola-noelia-plan --name hola-noelia-app --deployment-container-image-name santiagososam/hola-noelia:latest
```

#### 3. Configuración en Azure Portal

1. **App Service:** `hola-noelia-app`
2. **Sistema operativo:** Linux
3. **Plan:** B1 (básico)
4. **Región:** East US
5. **Configuración Docker:**
   - **Container type:** Single container
   - **Image source:** Otros registros de contenedor
   - **Image type:** Público
   - **Registry login server:** santiagososam
   - **Image and tag:** hola-noelia:latest
   - **Puerto:** 8080

### Verificar el Despliegue

Una vez configurado, la aplicación estará disponible en:
- **URL principal:** https://hola-noelia-app.azurewebsites.net
- **Endpoints disponibles:**
  - https://hola-noelia-app.azurewebsites.net/hola/web
  - https://hola-noelia-app.azurewebsites.net/hola
  - https://hola-noelia-app.azurewebsites.net/hola/json

### Monitoreo y Logs

- **Logs de aplicación:** Disponibles en Azure Portal
- **Métricas:** CPU, memoria, requests
- **Health checks:** Automáticos cada 30s

## 🔄 Jenkins Pipeline

### Configuración en Jenkins

1. **Crear un nuevo Pipeline Job** en Jenkins
2. **Configurar el repositorio Git** con tu código
3. **Usar el Jenkinsfile** del proyecto

### Pipeline Features

- ✅ **Validación** del proyecto Maven
- 🔨 **Compilación** de la aplicación Quarkus
- 🧪 **Ejecución de pruebas** automáticas
- 📦 **Empaquetado** de la aplicación
- 🔍 **Verificación de calidad** del código
- 🚀 **Construcción nativa** opcional
- 📁 **Archivado de artefactos**
- 🐳 **Construcción de Docker** automática
- 🌍 **Despliegue** a diferentes ambientes
- 📧 **Notificaciones** por email

### Parámetros del Pipeline

- `BUILD_NATIVE`: Construir imagen nativa de Quarkus
- `DEPLOY_ENVIRONMENT`: Ambiente de despliegue (dev/staging/prod)
- `APP_VERSION`: Versión de la aplicación
- `SEND_NOTIFICATIONS`: Enviar notificaciones por email

### Configurar Jenkins

1. **Instalar plugins necesarios**:
   - Pipeline
   - Git
   - Maven Integration
   - Email Extension
   - SpotBugs

2. **Configurar herramientas**:
   - JDK 17
   - Maven 3.9.6

3. **Configurar email** para notificaciones

### Ejecutar Pipeline

```bash
# En Jenkins, crear un nuevo Pipeline Job
# Configurar SCM con tu repositorio Git
# Usar el Jenkinsfile del proyecto
```

## 🎨 Características de la interfaz web

- ✨ **Diseño glassmorphism** con efectos de cristal
- 🌈 **Gradientes coloridos** y animaciones suaves
- 📱 **Completamente responsive** para todos los dispositivos
- ⚡ **Efectos de escritura** en el mensaje principal
- 🎯 **Tarjetas interactivas** con hover effects
- 🚀 **Animaciones de entrada** escalonadas

## 🛠️ Tecnologías utilizadas

- **Framework**: Quarkus 3.6.3
- **Java**: 17
- **REST API**: JAX-RS con RESTEasy Reactive
- **JSON**: Jackson para serialización
- **Frontend**: HTML5, CSS3, JavaScript vanilla
- **Diseño**: Glassmorphism, CSS Grid, Flexbox
- **Animaciones**: CSS animations y JavaScript
- **CI/CD**: Jenkins Pipeline
- **Containerización**: Docker, Docker Compose
- **Cloud**: Azure App Service
- **Proxy**: Nginx

## 📦 Estructura del proyecto

```
hola-noelia/
├── src/main/java/com/example/
│   ├── HolaNoeliaResource.java    # Endpoints REST
│   └── MainResource.java          # Redirección principal
├── src/main/resources/
│   └── application.properties     # Configuración Quarkus
├── pom.xml                       # Configuración Maven
├── Jenkinsfile                   # Pipeline de Jenkins
├── Jenkinsfile.parameters        # Pipeline con parámetros
├── Dockerfile                    # Configuración Docker
├── docker-compose.yml            # Orquestación Docker
├── nginx.conf                    # Configuración Nginx
├── .dockerignore                 # Excluir archivos Docker
└── README.md                     # Este archivo
```

## 🔧 Configuración de Jenkins

### Requisitos del Sistema Jenkins

- **Java 17** instalado
- **Maven 3.9.6** configurado
- **Git** disponible
- **Plugins** instalados:
  - Pipeline
  - Git
  - Maven Integration
  - Email Extension
  - SpotBugs

### Configuración de Herramientas

En Jenkins: **Manage Jenkins** → **Tools**:

1. **JDK**: Configurar JDK 17
2. **Maven**: Configurar Maven 3.9.6

### Configuración de Email

En Jenkins: **Manage Jenkins** → **Configure System**:

1. **Extended E-mail Notification**
2. Configurar SMTP server
3. Configurar credenciales

## 🎉 ¡Disfruta tu aplicación!

La aplicación ahora tiene una interfaz web hermosa y moderna que hace que tu mensaje "Hola soy NOelia desde Quarkus" se vea espectacular. ¡Perfecta para mostrar las capacidades de Quarkus con CI/CD completo y despliegue en la nube!

### 🌐 Enlaces importantes

- **Aplicación local:** http://localhost:8080
- **Aplicación en Azure:** https://hola-noelia-app.azurewebsites.net
- **Docker Hub:** santiagososam/hola-noelia:latest 