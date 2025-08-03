pipeline {
    agent any
    
    environment {
        APP_NAME = 'hola-noelia'
        APP_VERSION = '1.0.0-SNAPSHOT'
        QUARKUS_VERSION = '3.6.3'
        MAVEN_VERSION = '3.9.6'
    }
    
    stages {
        stage('Setup Tools') {
            steps {
                echo '🔧 Configurando herramientas...'
                script {
                    sh '''
                        # Verificar si curl está disponible
                        if command -v curl &> /dev/null; then
                            DOWNLOAD_CMD="curl -L -o"
                        elif command -v wget &> /dev/null; then
                            DOWNLOAD_CMD="wget -O"
                        else
                            echo "📦 Instalando curl..."
                            apt-get update && apt-get install -y curl
                            DOWNLOAD_CMD="curl -L -o"
                        fi
                        
                        if ! command -v mvn &> /dev/null; then
                            echo "📦 Instalando Maven..."
                            $DOWNLOAD_CMD apache-maven-${MAVEN_VERSION}-bin.tar.gz https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz
                            tar -xzf apache-maven-${MAVEN_VERSION}-bin.tar.gz
                            export PATH=$PATH:$(pwd)/apache-maven-${MAVEN_VERSION}/bin
                            echo "✅ Maven instalado en: $(pwd)/apache-maven-${MAVEN_VERSION}/bin"
                        else
                            echo "✅ Maven ya está instalado"
                        fi
                        
                        if ! command -v java &> /dev/null; then
                            echo "❌ Java no está instalado. Instalando OpenJDK..."
                            apt-get update && apt-get install -y openjdk-17-jdk
                        else
                            echo "✅ Java está disponible"
                        fi
                        
                        echo "🔧 Verificando herramientas:"
                        java --version
                        mvn --version
                        git --version
                    '''
                }
            }
        }
        
        stage('Checkout') {
            steps {
                echo '🔍 Verificando código fuente...'
                checkout scm
                script {
                    echo """
                        📋 Información del Build:
                        - Proyecto: ${env.JOB_NAME}
                        - Build: ${env.BUILD_NUMBER}
                        - Branch: ${env.GIT_BRANCH}
                        - Commit: ${env.GIT_COMMIT}
                        - Versión: ${env.APP_VERSION}
                        - Quarkus: ${env.QUARKUS_VERSION}
                    """
                }
            }
        }
        
        stage('Validate') {
            steps {
                echo '✅ Validando proyecto Maven...'
                script {
                    sh '''
                        # Usar Maven instalado en el workspace
                        ./apache-maven-${MAVEN_VERSION}/bin/mvn validate
                    '''
                }
            }
        }
        
        stage('Compile') {
            steps {
                echo '🔨 Compilando aplicación Quarkus...'
                script {
                    sh '''
                        # Usar Maven instalado en el workspace
                        ./apache-maven-${MAVEN_VERSION}/bin/mvn compile
                    '''
                }
            }
        }
        
        stage('Test') {
            steps {
                echo '🧪 Ejecutando pruebas...'
                script {
                    sh '''
                        # Usar Maven instalado en el workspace
                        ./apache-maven-${MAVEN_VERSION}/bin/mvn test
                    '''
                }
            }
            post {
                always {
                    echo '📊 Generando reportes de pruebas...'
                    script {
                        // Solo ejecutar junit si hay archivos de reportes
                        def testFiles = findFiles(glob: '**/target/surefire-reports/*.xml')
                        if (testFiles.length > 0) {
                            junit '**/target/surefire-reports/*.xml'
                        } else {
                            echo 'ℹ️ No se encontraron reportes de pruebas (normal para proyectos nuevos)'
                        }
                    }
                }
            }
        }
        
        stage('Package') {
            steps {
                echo '📦 Empaquetando aplicación...'
                script {
                    sh '''
                        # Usar Maven instalado en el workspace
                        ./apache-maven-${MAVEN_VERSION}/bin/mvn clean package -DskipTests
                    '''
                }
            }
        }
        
        stage('Archive Artifacts') {
            steps {
                echo '📦 Archivando artefactos...'
                archiveArtifacts artifacts: 'target/*.jar,target/quarkus-app/**/*', fingerprint: true
            }
        }
        
        stage('Success Info') {
            steps {
                echo '🎉 ¡Build completado exitosamente!'
                script {
                    sh '''
                        echo ""
                        echo "📦 Artefactos disponibles:"
                        echo "  - JAR: target/hola-noelia-1.0.0-SNAPSHOT.jar"
                        echo "  - App: target/quarkus-app/"
                        echo ""
                        echo "🚀 Para ejecutar localmente:"
                        echo "  java -jar target/quarkus-app/quarkus-run.jar"
                        echo ""
                        echo "🌐 Endpoints disponibles:"
                        echo "  - http://localhost:8080/ (redirect)"
                        echo "  - http://localhost:8080/hola/web (interfaz web)"
                        echo "  - http://localhost:8080/hola (texto)"
                        echo "  - http://localhost:8080/hola/json (JSON)"
                        echo ""
                        echo "🐳 Para Docker:"
                        echo "  docker build -t hola-noelia ."
                        echo "  docker run -p 8080:8080 hola-noelia"
                        echo ""
                        echo "📊 Build completado en: ${BUILD_URL}"
                        echo "=========================================="
                    '''
                }
            }
        }
    }
    
    post {
        always {
            echo '🧹 Limpiando workspace...'
            cleanWs()
        }
        success {
            echo '✅ Pipeline completado exitosamente!'
            echo '🎉 ¡Todo funcionó perfectamente!'
        }
        failure {
            echo '❌ Pipeline falló!'
            echo '🔍 Revisa los logs para más detalles'
        }
        cleanup {
            echo '🧹 Limpieza final...'
        }
    }
} 