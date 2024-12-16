import 'package:flutter/material.dart';
import 'login_screen.dart'; // Importa la pantalla de login
import 'register_screen.dart'; // Importa la pantalla de registro

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Image.network(
              'https://wallpapers.com/images/hd/glowing-batman-suit-4k-3y4dk223snh6bb47.webp', // URL de la imagen
              fit: BoxFit.cover,
            ),
          ),
          // Contenido principal con transparencia
          Container(
            color: Colors.black.withOpacity(0.5), // Capa semitransparente
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Título con estilo
                  Text(
                    'BIENVENIDOS A LAS PELÍCULAS DEL AÑO',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow, // Color amarillo para el texto
                      letterSpacing: 2,
                      fontFamily: 'Montserrat', // Fuente Montserrat
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black.withOpacity(0.5),
                          offset: const Offset(4.0, 4.0),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center, // Asegura que el texto esté centrado
                  ),
                  const SizedBox(height: 30),

                  const SizedBox(height: 40),

                  // Botón de inicio de sesión con estilo
                  _buildStyledButton(
                    context,
                    'Iniciar sesión',
                    LoginScreen(),
                    Colors.greenAccent, // Color personalizado para este botón
                  ),

                  const SizedBox(height: 20),

                  // Botón de registro con estilo
                  _buildStyledButton(
                    context,
                    'Registrarse',
                    RegisterScreen(),
                    Colors.blueAccent, // Color personalizado para este botón
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Función para crear un botón estilizado con colores personalizados
  Widget _buildStyledButton(
      BuildContext context, String text, Widget nextScreen, Color color) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, // Color del texto
        backgroundColor: color, // Color personalizado del botón
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // Bordes redondeados
        ),
        elevation: 5, // Sombra
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextScreen),
        );
      },
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }
}
