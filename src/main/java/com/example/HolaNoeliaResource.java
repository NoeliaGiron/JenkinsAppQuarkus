package com.example;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

@Path("/hola")
public class HolaNoeliaResource {

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String hola() {
        return "Hola soy NOelia desde Quarkus";
    }

    @GET
    @Path("/json")
    @Produces(MediaType.APPLICATION_JSON)
    public Mensaje holaJson() {
        return new Mensaje("Hola soy NOelia desde Quarkus", "¡Bienvenida a Quarkus!");
    }

    @GET
    @Path("/web")
    @Produces(MediaType.TEXT_HTML)
    public String holaWeb() {
        return """
            <!DOCTYPE html>
            <html lang="es">
            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Hola NOelia - Quarkus App</title>
                <style>
                    * {
                        margin: 0;
                        padding: 0;
                        box-sizing: border-box;
                    }
                    
                    body {
                        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                        min-height: 100vh;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        color: white;
                    }
                    
                    .container {
                        text-align: center;
                        background: rgba(255, 255, 255, 0.1);
                        backdrop-filter: blur(10px);
                        border-radius: 20px;
                        padding: 3rem;
                        box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
                        border: 1px solid rgba(255, 255, 255, 0.2);
                        max-width: 600px;
                        width: 90%;
                    }
                    
                    .logo {
                        font-size: 4rem;
                        margin-bottom: 1rem;
                        animation: bounce 2s infinite;
                    }
                    
                    .title {
                        font-size: 2.5rem;
                        margin-bottom: 1rem;
                        font-weight: 300;
                        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
                    }
                    
                    .subtitle {
                        font-size: 1.2rem;
                        margin-bottom: 2rem;
                        opacity: 0.9;
                    }
                    
                    .message {
                        font-size: 1.5rem;
                        margin-bottom: 2rem;
                        padding: 1rem;
                        background: rgba(255, 255, 255, 0.2);
                        border-radius: 10px;
                        border-left: 4px solid #ff6b6b;
                    }
                    
                    .features {
                        display: grid;
                        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                        gap: 1rem;
                        margin-top: 2rem;
                    }
                    
                    .feature {
                        background: rgba(255, 255, 255, 0.1);
                        padding: 1rem;
                        border-radius: 10px;
                        border: 1px solid rgba(255, 255, 255, 0.2);
                        transition: transform 0.3s ease;
                    }
                    
                    .feature:hover {
                        transform: translateY(-5px);
                    }
                    
                    .feature-icon {
                        font-size: 2rem;
                        margin-bottom: 0.5rem;
                    }
                    
                    .feature-title {
                        font-weight: bold;
                        margin-bottom: 0.5rem;
                    }
                    
                    .feature-desc {
                        font-size: 0.9rem;
                        opacity: 0.8;
                    }
                    
                    .api-links {
                        margin-top: 2rem;
                        display: flex;
                        gap: 1rem;
                        justify-content: center;
                        flex-wrap: wrap;
                    }
                    
                    .api-link {
                        background: rgba(255, 255, 255, 0.2);
                        color: white;
                        text-decoration: none;
                        padding: 0.8rem 1.5rem;
                        border-radius: 25px;
                        border: 1px solid rgba(255, 255, 255, 0.3);
                        transition: all 0.3s ease;
                        font-weight: 500;
                    }
                    
                    .api-link:hover {
                        background: rgba(255, 255, 255, 0.3);
                        transform: translateY(-2px);
                        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
                    }
                    
                    .footer {
                        margin-top: 2rem;
                        font-size: 0.9rem;
                        opacity: 0.7;
                    }
                    
                    @keyframes bounce {
                        0%, 20%, 50%, 80%, 100% {
                            transform: translateY(0);
                        }
                        40% {
                            transform: translateY(-10px);
                        }
                        60% {
                            transform: translateY(-5px);
                        }
                    }
                    
                    @keyframes fadeIn {
                        from {
                            opacity: 0;
                            transform: translateY(20px);
                        }
                        to {
                            opacity: 1;
                            transform: translateY(0);
                        }
                    }
                    
                    .container {
                        animation: fadeIn 1s ease-out;
                    }
                    
                    @media (max-width: 768px) {
                        .container {
                            padding: 2rem;
                        }
                        
                        .title {
                            font-size: 2rem;
                        }
                        
                        .logo {
                            font-size: 3rem;
                        }
                        
                        .api-links {
                            flex-direction: column;
                            align-items: center;
                        }
                    }
                </style>
            </head>
            <body>
                <div class="container">
                    <div class="logo">🚀</div>
                    <h1 class="title">¡Hola NOelia!</h1>
                    <p class="subtitle">Bienvenida a tu aplicación Quarkus</p>
                    
                    <div class="message">
                        <strong>Hola soy NOelia desde Quarkus</strong>
                    </div>
                    
                    <div class="features">
                        <div class="feature">
                            <div class="feature-icon">⚡</div>
                            <div class="feature-title">Rápido</div>
                            <div class="feature-desc">Arranque súper rápido con Quarkus</div>
                        </div>
                        <div class="feature">
                            <div class="feature-icon">🎯</div>
                            <div class="feature-title">Eficiente</div>
                            <div class="feature-desc">Bajo consumo de memoria</div>
                        </div>
                        <div class="feature">
                            <div class="feature-icon">🛠️</div>
                            <div class="feature-title">Moderno</div>
                            <div class="feature-desc">Tecnologías de vanguardia</div>
                        </div>
                    </div>
                    
                    <div class="api-links">
                        <a href="/hola" class="api-link">📝 Texto Plano</a>
                        <a href="/hola/json" class="api-link">📊 JSON API</a>
                    </div>
                    
                    <div class="footer">
                        <p>Desarrollado con ❤️ usando Quarkus 3.6.3</p>
                        <p>Java 17 • Maven • REST API</p>
                    </div>
                </div>
                
                <script>
                    // Efectos adicionales
                    document.addEventListener('DOMContentLoaded', function() {
                        const features = document.querySelectorAll('.feature');
                        features.forEach((feature, index) => {
                            feature.style.animationDelay = (index * 0.2) + 's';
                            feature.style.animation = 'fadeIn 0.8s ease-out forwards';
                            feature.style.opacity = '0';
                        });
                        
                        // Efecto de escritura para el mensaje
                        const message = document.querySelector('.message strong');
                        const text = message.textContent;
                        message.textContent = '';
                        
                        let i = 0;
                        const typeWriter = () => {
                            if (i < text.length) {
                                message.textContent += text.charAt(i);
                                i++;
                                setTimeout(typeWriter, 100);
                            }
                        };
                        
                        setTimeout(typeWriter, 1000);
                    });
                </script>
            </body>
            </html>
            """;
    }

    public static class Mensaje {
        private String mensaje;
        private String descripcion;

        public Mensaje() {}

        public Mensaje(String mensaje, String descripcion) {
            this.mensaje = mensaje;
            this.descripcion = descripcion;
        }

        public String getMensaje() {
            return mensaje;
        }

        public void setMensaje(String mensaje) {
            this.mensaje = mensaje;
        }

        public String getDescripcion() {
            return descripcion;
        }

        public void setDescripcion(String descripcion) {
            this.descripcion = descripcion;
        }
    }
} 