import 'package:flutter/material.dart';
import 'movie_catalog_screen.dart'; // Importa la pantalla de catálogo de películas
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://img.freepik.com/fotos-premium/paisaje-panoramico-al-amanecer_335224-1307.jpg?w=826'), // Reemplaza con tu URL de imagen
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 10, // Sombra suave
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Bordes redondeados
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Título de la pantalla con estilo moderno
                      const Text(
                        'Registrarse',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4A148C), // Color morado suave
                        ),
                      ),
                      const SizedBox(height: 30),
                      // Campo de texto para el nombre de usuario
                      TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          labelText: 'Nombre de usuario',
                          labelStyle: TextStyle(color: Colors.purple.shade200),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Campo de texto para el correo electrónico
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Correo electrónico',
                          labelStyle: TextStyle(color: Colors.purple.shade200),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Campo de texto para la contraseña
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          labelStyle: TextStyle(color: Colors.purple.shade200),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                        ),
                      ),
                      const SizedBox(height: 30),
                      // Botón de registro estilizado
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.lightBlueAccent, // Color celeste
                          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 5, // Sombra
                        ),
                        onPressed: () {
                          // Lógica de registro
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MovieCatalogScreen()),
                          );
                        },
                        child: const Text(
                          'Registrarse',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
