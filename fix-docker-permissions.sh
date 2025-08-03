#!/bin/bash

# Script para solucionar permisos de Docker en Jenkins
echo "🔧 Solucionando permisos de Docker para Jenkins..."

# Verificar si Docker está instalado
if ! command -v docker &> /dev/null; then
    echo "❌ Docker no está instalado"
    echo "Instalando Docker..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    sudo usermod -aG docker $USER
    echo "✅ Docker instalado. Reinicia tu sesión para aplicar cambios."
    exit 1
fi

# Verificar si Jenkins está ejecutándose
if ! pgrep -f jenkins > /dev/null; then
    echo "❌ Jenkins no está ejecutándose"
    echo "Inicia Jenkins primero:"
    echo "  docker run -p 8090:8080 -v /var/run/docker.sock:/var/run/docker.sock jenkins/jenkins:lts"
    exit 1
fi

echo "🔧 Configurando permisos de Docker..."

# Agregar usuario jenkins al grupo docker
sudo usermod -aG docker jenkins

# Cambiar permisos del socket de Docker
sudo chmod 666 /var/run/docker.sock

# Crear grupo docker si no existe
sudo groupadd docker 2>/dev/null || true

# Agregar usuario actual al grupo docker
sudo usermod -aG docker $USER

echo "✅ Permisos configurados"
echo ""
echo "🔄 Reiniciando Jenkins..."
sudo systemctl restart jenkins

echo ""
echo "📋 Verificando configuración..."
echo "Docker version:"
docker --version

echo ""
echo "🔍 Verificando acceso a Docker:"
if docker ps > /dev/null 2>&1; then
    echo "✅ Docker accesible"
else
    echo "❌ Docker no accesible"
    echo "Reinicia tu sesión o ejecuta: newgrp docker"
fi

echo ""
echo "🎉 ¡Configuración completada!"
echo "Ahora puedes usar Jenkinsfile con Docker" 