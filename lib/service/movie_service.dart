import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:movies_app/model/movie.dart';

class MovieService {
  Future<List<Movie>> getMovies({String? genre}) async {
    String jsonString = await rootBundle.loadString('assets/movies.json');

    List<Movie> movies =
        List<Movie>.from(json.decode(jsonString).map((x) => Movie.fromJson(x)));

    if (genre != null) {
      movies = movies.where((movie) => movie.gender == genre).toList();
    }

    return movies;
  }
}
