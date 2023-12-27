import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/model/movie.dart';
import 'package:movies_app/service/movie_service.dart';

class MovieViewModel extends ChangeNotifier {
  final service = MovieService();
  late List<Movie> movies;

  Future<List<Movie>> getMovies({String? genre}) async {
    try {
      movies = await service.getMovies(genre: genre);
      for (var movie in movies) {
        print('Title: ${movie.title}');
      }
    } catch (e) {
      print('Error: $e');
    }
    return movies;
  }
}
