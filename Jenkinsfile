pipeline {
    agent any
    
    tools {
        maven 'Maven 3.9.6'
        jdk 'JDK 17'
    }
    
    environment {
        APP_NAME = 'hola-noelia'
        APP_VERSION = '1.0.0-SNAPSHOT'
        QUARKUS_VERSION = '3.6.3'
        JAVA_HOME = tool('JDK 17')
    }
    
    stages {
        stage('Checkout') {
            steps {
                echo '🔍 Verificando código fuente...'
                checkout scm
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
        
        stage('Quality Check') {
            steps {
                echo '🔍 Verificando calidad del código...'
                sh 'mvn spotbugs:check'
            }
        }
        
        stage('Build Native (Optional)') {
            when {
                expression { params.BUILD_NATIVE == true }
            }
            steps {
                echo '🚀 Construyendo imagen nativa...'
                sh 'mvn clean package -Pnative -Dquarkus.native.container-build=true'
            }
        }
        
        stage('Archive Artifacts') {
            steps {
                echo '📁 Archivando artefactos...'
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
                archiveArtifacts artifacts: 'target/quarkus-app/**/*', fingerprint: true
            }
        }
        
        stage('Deploy to Dev') {
            when {
                branch 'develop'
            }
            steps {
                echo '🚀 Desplegando a ambiente de desarrollo...'
                script {
                    // Aquí puedes agregar lógica de despliegue
                    // Por ejemplo, copiar a un servidor o contenedor
                    sh '''
                        echo "Aplicación compilada exitosamente!"
                        echo "Artefactos disponibles en: target/quarkus-app/"
                        echo "Para ejecutar: java -jar target/quarkus-app/quarkus-run.jar"
                    '''
                }
            }
        }
        
        stage('Deploy to Prod') {
            when {
                branch 'main'
            }
            steps {
                echo '🚀 Desplegando a producción...'
                script {
                    // Aquí puedes agregar lógica de despliegue a producción
                    sh '''
                        echo "¡Despliegue a producción completado!"
                        echo "Aplicación disponible en: http://localhost:8080"
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