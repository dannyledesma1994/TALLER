import 'package:flutter/material.dart';
import 'movie_player_screen.dart'; // Importa la pantalla de reproducción de películas

class Movie {
  final String title;
  final String description;
  final String imageUrl;

  Movie({required this.title, required this.description, required this.imageUrl});
}

class MovieCatalogScreen extends StatelessWidget {
  final List<Movie> popularMovies = [
    Movie(
      title: 'Deadpool Arte Digital',
      description: 'Deadpool Arte Digital.',
      imageUrl: 'https://www.xtrafondos.com/wallpapers/deadpool-arte-digital-12894.jpg',
    ),
    Movie(
      title: 'Hombres del Caribe',
      description: 'Película que te llevará al mar.',
      imageUrl: 'https://c4.wallpaperflare.com/wallpaper/742/232/991/caribe-del-pelicula-piratas-wallpaper-preview.jpg',
    ),
  ];

  final List<Movie> trendingMovies = [
    Movie(
      title: 'I LOVE',
      description: 'Una pareja de enamorados.',
      imageUrl: 'https://img2.wallspic.com/crops/0/4/7/6/56740/56740-la_mitologia-dos_mil_catorce-pel-musculos-cine-3840x2160.jpg',
    ),
    Movie(
      title: 'El Fiel Compañero',
      description: 'Leyenda de un perrito de casa y sus amigos que lo rodean.',
      imageUrl: 'https://img1.wallspic.com/crops/8/5/7/3/2/123758/123758-perro-pel-perro_como_el_de_los_mamiferos-diversion-el_vello_facial-3840x2160.jpg',
    ),
  ];

  final List<Movie> newArrivals = [
    Movie(
      title: 'El peligro',
      description: 'El peligro te espera en esta película de acción.',
      imageUrl: 'https://wallpapers.com/images/high/action-movie-1920-x-1080-wallpaper-ljlo9vly2lu1bgxo.webp',
    ),
    Movie(
      title: 'Aventurade',
      description: 'Película llena de acción.',
      imageUrl: 'https://wallpapers.com/images/high/action-movie-2000-x-1125-wallpaper-vr3gurrmvp8hrtyk.webp',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[850], // Fondo gris oscuro para el AppBar
        title: const Text('Catálogo de Películas', style: TextStyle(color: Color(0xFF87CEEB))),
      ),
      body: Container(
        color: Colors.grey[900], // Fondo gris oscuro para toda la pantalla
        child: ListView(
          children: [
            _buildMovieCategory('Populares', popularMovies, context),
            _buildMovieCategory('Tendencias', trendingMovies, context),
            _buildMovieCategory('Nuevas Llegadas', newArrivals, context),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieCategory(String category, List<Movie> movies, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF87CEEB), // Azul claro para los títulos de las categorías
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return _buildMovieCard(movies[index], context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMovieCard(Movie movie, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MoviePlayerScreen(
              movie: movie,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: NetworkImage(movie.imageUrl),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 5,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            padding: const EdgeInsets.all(8),
            color: Colors.black.withOpacity(0.6),
            child: Text(
              movie.title,
              style: const TextStyle(
                color: Colors.white, // Blanco para el texto sobre las imágenes
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
