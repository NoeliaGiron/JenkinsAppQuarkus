#!/bin/bash

echo "🚀 Configurando Jenkins con Docker"
echo "=================================="

# Función para mostrar menú
show_menu() {
    echo ""
    echo "🎯 Selecciona una opción:"
    echo "1) Jenkins con ROOT (Más fácil - Recomendado para desarrollo)"
    echo "2) Jenkins con PERMISOS (Más seguro - Para producción)"
    echo "3) Solo configurar permisos (Jenkins ya ejecutándose)"
    echo "4) Salir"
    echo ""
    read -p "Opción: " choice
}

# Función para Jenkins con root
setup_jenkins_root() {
    echo "🔧 Configurando Jenkins con ROOT..."
    
    # Detener Jenkins actual si existe
    echo "🛑 Deteniendo Jenkins actual..."
    sudo systemctl stop jenkins 2>/dev/null || true
    sudo docker stop jenkins-docker 2>/dev/null || true
    sudo docker rm jenkins-docker 2>/dev/null || true
    
    # Ejecutar Jenkins con root
    echo "🚀 Iniciando Jenkins con Docker y ROOT..."
    sudo docker run -d \
        --name jenkins-docker \
        -p 8090:8080 \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -v jenkins_home:/var/jenkins_home \
        --user root \
        jenkins/jenkins:lts
    
    echo "✅ Jenkins iniciado con ROOT"
    echo "🌐 Accede a: http://localhost:8090"
    echo "🔑 Contraseña inicial: $(sudo docker exec jenkins-docker cat /var/jenkins_home/secrets/initialAdminPassword)"
}

# Función para Jenkins con permisos
setup_jenkins_permissions() {
    echo "🔧 Configurando Jenkins con PERMISOS..."
    
    # Detener Jenkins actual si existe
    echo "🛑 Deteniendo Jenkins actual..."
    sudo systemctl stop jenkins 2>/dev/null || true
    sudo docker stop jenkins-docker 2>/dev/null || true
    sudo docker rm jenkins-docker 2>/dev/null || true
    
    # Configurar permisos de Docker
    echo "🔧 Configurando permisos de Docker..."
    sudo chmod 666 /var/run/docker.sock
    sudo groupadd docker 2>/dev/null || true
    
    # Ejecutar Jenkins con permisos
    echo "🚀 Iniciando Jenkins con Docker y PERMISOS..."
    sudo docker run -d \
        --name jenkins-docker \
        -p 8090:8080 \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -v jenkins_home:/var/jenkins_home \
        --group-add docker \
        jenkins/jenkins:lts
    
    echo "✅ Jenkins iniciado con PERMISOS"
    echo "🌐 Accede a: http://localhost:8090"
    echo "🔑 Contraseña inicial: $(sudo docker exec jenkins-docker cat /var/jenkins_home/secrets/initialAdminPassword)"
}

# Función para solo configurar permisos
setup_permissions_only() {
    echo "🔧 Configurando permisos de Docker..."
    
    # Verificar que Docker esté instalado
    if ! command -v docker &> /dev/null; then
        echo "❌ Docker no está instalado"
        echo "Instalando Docker..."
        curl -fsSL https://get.docker.com -o get-docker.sh
        sh get-docker.sh
        sudo usermod -aG docker $USER
    fi
    
    # Configurar permisos
    echo "🔧 Configurando permisos..."
    sudo chmod 666 /var/run/docker.sock
    sudo groupadd docker 2>/dev/null || true
    sudo usermod -aG docker jenkins 2>/dev/null || true
    
    echo "✅ Permisos configurados"
    echo "🔄 Reinicia Jenkins para aplicar cambios"
}

# Función para verificar estado
check_status() {
    echo "📊 Estado actual:"
    echo ""
    
    # Verificar Docker
    if command -v docker &> /dev/null; then
        echo "✅ Docker instalado: $(docker --version)"
    else
        echo "❌ Docker no instalado"
    fi
    
    # Verificar Jenkins Docker
    if sudo docker ps | grep jenkins-docker > /dev/null; then
        echo "✅ Jenkins Docker ejecutándose"
        echo "🌐 URL: http://localhost:8090"
    else
        echo "❌ Jenkins Docker no ejecutándose"
    fi
    
    # Verificar permisos
    if docker ps > /dev/null 2>&1; then
        echo "✅ Permisos de Docker OK"
    else
        echo "❌ Problemas con permisos de Docker"
    fi
}

# Menú principal
while true; do
    show_menu
    
    case $choice in
        1)
            setup_jenkins_root
            break
            ;;
        2)
            setup_jenkins_permissions
            break
            ;;
        3)
            setup_permissions_only
            break
            ;;
        4)
            echo "👋 ¡Hasta luego!"
            exit 0
            ;;
        *)
            echo "❌ Opción inválida"
            ;;
    esac
done

echo ""
echo "🎉 ¡Configuración completada!"
echo ""
echo "📋 Próximos pasos:"
echo "1. Ve a http://localhost:8090"
echo "2. Instala los plugins sugeridos"
echo "3. Crea tu usuario administrador"
echo "4. Configura tu pipeline con Jenkinsfile"
echo ""
echo "🔧 Para verificar estado:"
echo "   sudo docker ps"
echo "   sudo docker logs jenkins-docker" 