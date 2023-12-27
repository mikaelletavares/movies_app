import 'package:flutter/material.dart';
import 'package:movies_app/screens/movieScreens/movie_details.dart';
import 'package:movies_app/model/movie.dart';
import 'package:movies_app/screens/movieScreens/movie_view_model.dart';
import 'package:provider/provider.dart';

class TerrorMovies extends StatelessWidget {
  const TerrorMovies({super.key});

  @override
  Widget build(BuildContext context) {
    final movieVM = Provider.of<MovieViewModel>(context);

    return FutureBuilder<List<Movie>>(
      future: movieVM.getMovies(genre: 'Terror'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('No books available.'),
          );
        } else {
          List<Movie> movies = snapshot.data ?? [];
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: movies.map((movie) {
                return Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MovieDetails(movie: movie)));
                      },
                      child: Image.network(
                        movie.img,
                        width: 140,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                );
              }).toList(),
            ),
          );
        }
      },
    );
  }
}
