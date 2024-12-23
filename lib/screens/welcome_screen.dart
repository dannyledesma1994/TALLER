import 'package:flutter/material.dart';
import 'login_screen.dart'; // Importa la pantalla de login
import 'register_screen.dart'; // Importa la pantalla de registro

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Título en la parte superior
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Text(
                    'BIENVENIDOS A LAS PELÍCULAS DEL AÑO',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                      letterSpacing: 2,
                      fontFamily: 'Montserrat',
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black.withOpacity(0.5),
                          offset: const Offset(4.0, 4.0),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                // Ícono y texto en el centro
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.movie, // Ícono de películas
                      size: 100,
                      color: const Color.fromARGB(255, 117, 218, 22), // Color del ícono
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'LAS MEJORES DEL CINE',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),

                // Sección inferior con los botones
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildIconButton(
                        context,
                        'Iniciar sesión',
                        Icons.login,
                        LoginScreen(),
                        Colors.greenAccent,
                      ),
                      _buildIconButton(
                        context,
                        'Registrarse',
                        Icons.person_add,
                        RegisterScreen(),
                        Colors.blueAccent,
                      ),
                      IconButton(
                        icon: Icon(isDark ? Icons.wb_sunny : Icons.nightlight_round, size: 24),
                        color: Colors.white,
                        onPressed: () {
                          // Cambiar entre modo claro y oscuro
                          if (isDark) {
                            // Cambiar a modo claro
                            Theme.of(context).setBrightness(Brightness.light);
                          } else {
                            // Cambiar a modo oscuro
                            Theme.of(context).setBrightness(Brightness.dark);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Función para crear un botón con ícono
  Widget _buildIconButton(
      BuildContext context, String text, IconData icon, Widget nextScreen, Color color) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, // Color del texto e ícono
        backgroundColor: color, // Color personalizado del botón
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
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
      icon: Icon(icon, size: 24),
      label: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }
}

extension on ThemeData {
  void setBrightness(Brightness light) {}
}
