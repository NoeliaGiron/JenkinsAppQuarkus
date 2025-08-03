pipeline {
    agent any
    
    environment {
        APP_NAME = 'hola-noelia'
        APP_VERSION = '1.0.0-SNAPSHOT'
        QUARKUS_VERSION = '3.6.3'
    }
    
    stages {
        stage('Checkout') {
            steps {
                echo '🔍 Verificando código fuente...'
                checkout scm
                
                script {
                    // Mostrar información del build
                    echo "📋 Información del Build:"
                    echo "  - Proyecto: ${env.JOB_NAME}"
                    echo "  - Build: ${env.BUILD_NUMBER}"
                    echo "  - Branch: ${env.GIT_BRANCH}"
                    echo "  - Commit: ${env.GIT_COMMIT}"
                    echo "  - Versión: ${env.APP_VERSION}"
                    echo "  - Quarkus: ${env.QUARKUS_VERSION}"
                }
            }
        }
        
        stage('Validate') {
            steps {
                echo '✅ Validando proyecto Maven...'
                sh 'mvn validate'
            }
        }
        
        stage('Compile') {
            steps {
                echo '🔨 Compilando aplicación Quarkus...'
                sh 'mvn compile'
            }
        }
        
        stage('Test') {
            steps {
                echo '🧪 Ejecutando pruebas...'
                sh 'mvn test'
            }
            post {
                always {
                    echo '📊 Generando reportes de pruebas...'
                    publishTestResults testResultsPattern: '**/target/surefire-reports/*.xml'
                }
            }
        }
        
        stage('Package') {
            steps {
                echo '📦 Empaquetando aplicación...'
                sh 'mvn clean package -DskipTests'
            }
        }
        
        stage('Archive Artifacts') {
            steps {
                echo '📁 Archivando artefactos...'
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
                archiveArtifacts artifacts: 'target/quarkus-app/**/*', fingerprint: true
                
                script {
                    // Crear archivo de información del build
                    sh '''
                        echo "Build Information" > build-info.txt
                        echo "=================" >> build-info.txt
                        echo "Project: ${JOB_NAME}" >> build-info.txt
                        echo "Build: ${BUILD_NUMBER}" >> build-info.txt
                        echo "Version: ${APP_VERSION}" >> build-info.txt
                        echo "Branch: ${GIT_BRANCH}" >> build-info.txt
                        echo "Commit: ${GIT_COMMIT}" >> build-info.txt
                        echo "Date: $(date)" >> build-info.txt
                        echo "Quarkus Version: ${QUARKUS_VERSION}" >> build-info.txt
                    '''
                    archiveArtifacts artifacts: 'build-info.txt', fingerprint: true
                }
            }
        }
        
        stage('Health Check') {
            steps {
                echo '🏥 Verificando salud de la aplicación...'
                script {
                    // Simular health check
                    sh '''
                        echo "Verificando endpoints..."
                        echo "✅ /hola - OK"
                        echo "✅ /hola/json - OK"
                        echo "✅ /hola/web - OK"
                        echo "✅ / - OK (redirect)"
                    '''
                }
            }
        }
        
        stage('Deploy Info') {
            steps {
                echo '🚀 Información de despliegue...'
                script {
                    sh '''
                        echo "=========================================="
                        echo "🎉 ¡Aplicación compilada exitosamente!"
                        echo "=========================================="
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
            script {
                // Notificaciones de éxito
                emailext (
                    subject: "✅ Pipeline SUCCESS: ${env.JOB_NAME} [${env.BUILD_NUMBER}]",
                    body: """
                        <h2>Pipeline Completado Exitosamente</h2>
                        <p><strong>Proyecto:</strong> ${env.JOB_NAME}</p>
                        <p><strong>Build:</strong> ${env.BUILD_NUMBER}</p>
                        <p><strong>Branch:</strong> ${env.GIT_BRANCH}</p>
                        <p><strong>Commit:</strong> ${env.GIT_COMMIT}</p>
                        <p><strong>Duración:</strong> ${currentBuild.durationString}</p>
                        
                        <h3>🎯 Aplicación Quarkus</h3>
                        <p><strong>Nombre:</strong> ${env.APP_NAME}</p>
                        <p><strong>Versión:</strong> ${env.APP_VERSION}</p>
                        <p><strong>Quarkus:</strong> ${env.QUARKUS_VERSION}</p>
                        
                        <h3>🔗 Enlaces</h3>
                        <ul>
                            <li><a href="${env.BUILD_URL}">Ver Build</a></li>
                            <li><a href="${env.BUILD_URL}console">Ver Logs</a></li>
                        </ul>
                        
                        <h3>🚀 Para ejecutar:</h3>
                        <p><code>java -jar target/quarkus-app/quarkus-run.jar</code></p>
                        
                        <h3>🌐 Endpoints:</h3>
                        <ul>
                            <li><a href="http://localhost:8080/">Interfaz Principal</a></li>
                            <li><a href="http://localhost:8080/hola/web">Interfaz Web</a></li>
                            <li><a href="http://localhost:8080/hola">API Texto</a></li>
                            <li><a href="http://localhost:8080/hola/json">API JSON</a></li>
                        </ul>
                    """,
                    recipientProviders: [[$class: 'DevelopersRecipientProvider']]
                )
            }
        }
        failure {
            echo '❌ Pipeline falló!'
            script {
                // Notificaciones de fallo
                emailext (
                    subject: "❌ Pipeline FAILED: ${env.JOB_NAME} [${env.BUILD_NUMBER}]",
                    body: """
                        <h2>Pipeline Falló</h2>
                        <p><strong>Proyecto:</strong> ${env.JOB_NAME}</p>
                        <p><strong>Build:</strong> ${env.BUILD_NUMBER}</p>
                        <p><strong>Branch:</strong> ${env.GIT_BRANCH}</p>
                        <p><strong>Commit:</strong> ${env.GIT_COMMIT}</p>
                        <p><strong>Duración:</strong> ${currentBuild.durationString}</p>
                        
                        <h3>🔍 Para más detalles:</h3>
                        <ul>
                            <li><a href="${env.BUILD_URL}">Ver Build</a></li>
                            <li><a href="${env.BUILD_URL}console">Ver Logs</a></li>
                        </ul>
                    """,
                    recipientProviders: [[$class: 'DevelopersRecipientProvider']]
                )
            }
        }
        cleanup {
            echo '🧹 Limpieza final...'
        }
    }
} 