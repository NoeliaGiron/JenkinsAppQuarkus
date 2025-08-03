# 🔧 Solución de Problemas - Jenkins Pipeline

## ❌ Error: mvn: not found

### Problema
Jenkins no tiene Maven instalado en el contenedor.

### Solución 1: Usar Jenkinsfile con Docker (Recomendado)
Cambia el **Script Path** en tu Pipeline Job a:
```
Jenkinsfile
```
Este usa una imagen Docker con Maven pre-instalado.

### Solución 2: Usar Jenkinsfile sin Docker
Cambia el **Script Path** a:
```
Jenkinsfile.no-docker
```
Este instala Maven automáticamente.

### Solución 3: Usar Jenkinsfile simplificado
Cambia el **Script Path** a:
```
Jenkinsfile.simple
```
Este es la versión más básica.

## 🎯 Opciones de Jenkinsfile Disponibles

### 1. Jenkinsfile (Recomendado - Con Docker)
- ✅ Usa imagen Docker con Maven pre-instalado
- ✅ No requiere configuración adicional
- ✅ Funciona en cualquier Jenkins
- ✅ Incluye todas las características

### 2. Jenkinsfile.no-docker
- ✅ Instala Maven automáticamente
- ✅ No requiere Docker
- ✅ Funciona en Jenkins sin Docker
- ✅ Descarga e instala herramientas

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
Script Path: Jenkinsfile (o Jenkinsfile.no-docker)
```

### Paso 3: Ejecutar
```
Build Now
```

## 📋 Plugins Necesarios

### Mínimos:
- ✅ Pipeline
- ✅ Git

### Para Docker (Jenkinsfile):
- 🐳 Docker Pipeline

### Opcionales:
- 📧 Email Extension (para notificaciones)
- 📊 Test Results (para reportes)

## 🚀 Verificar Configuración

### Comando de prueba:
```bash
# Verificar que Jenkins responde
curl http://localhost:8090

# Verificar que Docker está disponible (para Jenkinsfile)
docker --version

# Verificar que Maven está disponible (para Jenkinsfile.simple)
mvn --version

# Verificar que Java está disponible
java --version
```

## 🐳 Configurar Docker en Jenkins

Si usas `Jenkinsfile` (con Docker):

1. **Instalar Docker Pipeline plugin**
2. **Configurar Docker en Jenkins:**
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

### Error: Docker no disponible
**Solución**: Usar `Jenkinsfile.no-docker`

### Error: Maven no encontrado
**Solución**: Usar `Jenkinsfile` (con Docker) o `Jenkinsfile.no-docker`

### Error: Permisos de Docker
**Solución**: Agregar usuario Jenkins al grupo docker:
```bash
sudo usermod -aG docker jenkins
sudo systemctl restart jenkins
```

### Error: Plugins faltantes
**Solución**: Instalar plugins necesarios desde Manage Jenkins > Plugins 