# 🔧 Solución de Problemas - Jenkins Pipeline

## ❌ Error: permission denied while trying to connect to the Docker daemon socket

### Problema
Jenkins no tiene permisos para acceder a Docker.

### Solución 1: Usar Jenkinsfile actualizado (Recomendado)
El **Jenkinsfile** actual ya está configurado para funcionar sin Docker y instala Maven automáticamente.

### Solución 2: Solucionar permisos de Docker
Si quieres usar Docker, ejecuta:
```bash
chmod +x fix-docker-permissions.sh
./fix-docker-permissions.sh
```

### Solución 3: Usar Jenkinsfile sin Docker
El **Jenkinsfile** actual ya usa esta configuración.

## 🎯 Opciones de Jenkinsfile Disponibles

### 1. Jenkinsfile (Actual - Recomendado)
- ✅ Instala Maven automáticamente
- ✅ No requiere Docker
- ✅ Funciona en cualquier Jenkins
- ✅ Incluye todas las características

### 2. Jenkinsfile.no-docker
- ✅ Versión alternativa sin Docker
- ✅ Instala Maven automáticamente
- ✅ Funciona en Jenkins sin Docker

### 3. Jenkinsfile.simple
- ✅ Versión simplificada
- ✅ Parámetros opcionales
- ✅ Ideal para pruebas
- ✅ Requiere Maven instalado

### 4. Jenkinsfile.parameters
- ✅ Versión avanzada con parámetros
- ✅ Múltiples ambientes
- ✅ Configuración flexible

## 🔧 Configuración Rápida

### Paso 1: Crear Pipeline Job
```
Nombre: hola-noelia-pipeline
Tipo: Pipeline
```

### Paso 2: Configurar SCM
```
SCM: Git
Repository: https://github.com/NoeliaGiron/JenkinsAppQuarkus.git
Branch: main
Script Path: Jenkinsfile
```

### Paso 3: Ejecutar
```
Build Now
```

## 📋 Plugins Necesarios

### Mínimos:
- ✅ Pipeline
- ✅ Git

### Opcionales:
- 📧 Email Extension (para notificaciones)
- 📊 Test Results (para reportes)

## 🚀 Verificar Configuración

### Comando de prueba:
```bash
# Verificar que Jenkins responde
curl http://localhost:8090

# Verificar que Maven está disponible
mvn --version

# Verificar que Java está disponible
java --version
```

## 🐳 Configurar Docker (Opcional)

Si quieres usar Docker en el futuro:

1. **Ejecutar script de permisos:**
   ```bash
   ./fix-docker-permissions.sh
   ```

2. **Instalar Docker Pipeline plugin**

3. **Configurar Docker en Jenkins:**
   - Manage Jenkins > Configure System
   - Docker > Add Docker
   - Name: `docker`
   - Docker Host URI: `unix:///var/run/docker.sock`

## 📧 Configurar Email (Opcional)

1. **Manage Jenkins > Configure System**
2. **Extended E-mail Notification**
3. **Configurar SMTP:**
   - SMTP Server: `smtp.gmail.com`
   - Port: `587`
   - Credentials: Tu email y contraseña

## 🎉 ¡Listo!

Una vez configurado, tu pipeline debería ejecutarse sin problemas y generar:
- ✅ Artefactos compilados
- ✅ Reportes de pruebas
- ✅ Notificaciones por email
- ✅ Información de despliegue

## 🔗 Enlaces Útiles

- **Jenkins Dashboard**: http://localhost:8090
- **Pipeline Logs**: http://localhost:8090/job/hola-noelia-pipeline/
- **Artefactos**: Descargables desde Jenkins
- **Email**: Notificaciones automáticas

## 🚨 Solución de Errores Comunes

### Error: Maven no encontrado
**Solución**: El Jenkinsfile actual instala Maven automáticamente

### Error: Docker permisos
**Solución**: Usar `fix-docker-permissions.sh` o usar Jenkinsfile actual

### Error: Plugins faltantes
**Solución**: Instalar plugins necesarios desde Manage Jenkins > Plugins

### Error: Email no enviado
**Solución**: Configurar SMTP en Manage Jenkins > Configure System

## 📊 Estado Actual

✅ **Jenkinsfile actualizado** - Funciona sin Docker
✅ **Instalación automática de Maven**
✅ **Configuración simplificada**
✅ **Listo para usar** 