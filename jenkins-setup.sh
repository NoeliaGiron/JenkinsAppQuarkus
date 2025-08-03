#!/bin/bash

# Script de configuración para Jenkins
# Este script ayuda a configurar Jenkins para el proyecto Quarkus

echo "🚀 Configurando Jenkins para Hola NOelia Quarkus App"
echo "=================================================="

# Verificar que Jenkins esté corriendo
echo "🔍 Verificando que Jenkins esté corriendo..."
if curl -s http://localhost:8090 > /dev/null; then
    echo "✅ Jenkins está corriendo en http://localhost:8090"
else
    echo "❌ Jenkins no está corriendo en http://localhost:8090"
    echo "Por favor, asegúrate de que Jenkins esté ejecutándose"
    exit 1
fi

echo ""
echo "📋 Pasos para configurar el Pipeline:"
echo ""

echo "1️⃣ Crear un nuevo Pipeline Job:"
echo "   - Ir a Jenkins Dashboard"
echo "   - Click en 'New Item'"
echo "   - Nombre: 'hola-noelia-pipeline'"
echo "   - Tipo: 'Pipeline'"
echo ""

echo "2️⃣ Configurar el Pipeline:"
echo "   - En 'Pipeline', seleccionar 'Pipeline script from SCM'"
echo "   - SCM: 'Git'"
echo "   - Repository URL: [tu-repositorio-git]"
echo "   - Branch: 'main' o 'master'"
echo "   - Script Path: 'Jenkinsfile'"
echo ""

echo "3️⃣ Configurar herramientas (Manage Jenkins > Tools):"
echo "   - JDK: 'JDK 17'"
echo "   - Maven: 'Maven 3.9.6'"
echo ""

echo "4️⃣ Instalar plugins necesarios:"
echo "   - Pipeline"
echo "   - Git"
echo "   - Maven Integration"
echo "   - Email Extension"
echo "   - SpotBugs"
echo ""

echo "5️⃣ Configurar email (Manage Jenkins > Configure System):"
echo "   - Extended E-mail Notification"
echo "   - SMTP Server: [tu-smtp-server]"
echo "   - Credentials: [tu-email-credentials]"
echo ""

echo "6️⃣ Ejecutar el Pipeline:"
echo "   - Ir al job creado"
echo "   - Click en 'Build with Parameters'"
echo "   - Configurar parámetros según necesites"
echo ""

echo "🎯 Parámetros disponibles:"
echo "   - BUILD_NATIVE: false (por defecto)"
echo "   - DEPLOY_ENVIRONMENT: dev/staging/prod"
echo "   - APP_VERSION: 1.0.0-SNAPSHOT"
echo "   - SEND_NOTIFICATIONS: true"
echo ""

echo "📊 El Pipeline incluye:"
echo "   ✅ Validación del proyecto"
echo "   🔨 Compilación"
echo "   🧪 Pruebas"
echo "   📦 Empaquetado"
echo "   🔍 Verificación de calidad"
echo "   🚀 Construcción nativa (opcional)"
echo "   📁 Archivado de artefactos"
echo "   🌍 Despliegue a ambientes"
echo "   📧 Notificaciones por email"
echo ""

echo "🎉 ¡Configuración completada!"
echo "Tu aplicación Quarkus está lista para CI/CD con Jenkins" 