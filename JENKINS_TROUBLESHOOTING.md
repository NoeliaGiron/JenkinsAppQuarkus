# 🔧 Solución de Problemas - Jenkins Pipeline

## ❌ Error: Tool type "maven" does not have an install of "Maven 3.9.6" configured

### Problema
Jenkins no tiene configuradas las herramientas Maven y JDK específicas.

### Solución 1: Usar Jenkinsfile simplificado
Cambia el **Script Path** en tu Pipeline Job a:
```
Jenkinsfile.simple
```

### Solución 2: Configurar herramientas en Jenkins

1. **Ir a Manage Jenkins > Tools**
2. **Configurar JDK:**
   - Name: `JDK 17`
   - JAVA_HOME: `/path/to/your/java17`
   - O usar instalación automática

3. **Configurar Maven:**
   - Name: `Maven 3.9.6`
   - MAVEN_HOME: `/path/to/your/maven`
   - O usar instalación automática

### Solución 3: Usar Jenkinsfile sin herramientas
El `Jenkinsfile` actualizado ya no requiere herramientas específicas.

## 🎯 Opciones de Jenkinsfile Disponibles

### 1. Jenkinsfile (Recomendado)
- ✅ No requiere herramientas específicas
- ✅ Funciona con cualquier configuración de Jenkins
- ✅ Incluye todas las características

### 2. Jenkinsfile.simple
- ✅ Versión simplificada
- ✅ Parámetros opcionales
- ✅ Ideal para pruebas

### 3. Jenkinsfile.parameters
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
- 🔍 SpotBugs (para calidad)

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