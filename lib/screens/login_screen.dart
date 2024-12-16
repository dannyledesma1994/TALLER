import 'package:flutter/material.dart';
import 'movie_catalog_screen.dart'; // Importa la pantalla de catálogo de películas
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fondo con imagen
      body: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Image.network(
              'https://wallpapers.com/images/high/4k-ultra-hd-transformers-optimus-prime-sword-gun-yc73hmp2f784bf2o.webp', // URL de la imagen
              fit: BoxFit.cover,
            ),
          ),
          // Capa semitransparente para mejorar la legibilidad
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          // Contenido principal
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
                        'Iniciar sesión',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4A148C), // Color morado suave
                        ),
                      ),
                      const SizedBox(height: 30),
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
                      // Botón de inicio de sesión estilizado
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: const Color(0xFF002366), // Azul marino
                          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 5, // Sombra
                        ),
                        onPressed: () {
                          // Lógica de inicio de sesión
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MovieCatalogScreen()),
                          );
                        },
                        child: const Text(
                          'Iniciar sesión',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Botón adicional con estilo plomo claro
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black87, backgroundColor: const Color(0xFFD3D3D3), // Plomo claro
                          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 3, // Sombra ligera
                        ),
                        onPressed: () {
                          // Lógica para otro botón
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Botón adicional presionado')),
                          );
                        },
                        child: const Text(
                          'REGISTRO',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
Future<void> login(email,pass) async {
  try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: pass
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
}