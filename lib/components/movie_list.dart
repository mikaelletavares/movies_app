import 'package:flutter/material.dart';
import 'package:movies_app/components/movie_card.dart';
import 'package:movies_app/components/movie_details.dart';
import 'package:movies_app/model/movie.dart';
import 'package:movies_app/screens/movieScreens/movie_view_model.dart';
import 'package:provider/provider.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key});

  @override
  Widget build(BuildContext context) {
    final movieVM = Provider.of<MovieViewModel>(context);

    return FutureBuilder<List<Movie>>(
      future: movieVM.getMovies(),
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
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.7,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var movie = snapshot.data![index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetails(movie: movie),
                    ),
                  );
                },
                child: MovieCard(movie: movie),
              );
            },
          );
        }
      },
    );
  }
}
