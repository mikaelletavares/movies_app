import 'package:flutter/material.dart';
import 'package:movies_app/components/moviesGenders/comedy_movies.dart';
import 'package:movies_app/components/moviesGenders/romance_movies.dart';
import 'package:movies_app/components/moviesGenders/terror_movies.dart';
import 'package:movies_app/screens/movieScreens/movie_view_model.dart';
import 'package:movies_app/utils/constants.dart';
import 'package:provider/provider.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MovieViewModel(),
      child: const Scaffold(
        backgroundColor: backgroundColorDark,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 70.0, left: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Terror',
                    style: movieTitleTextStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TerrorMovies(),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Comédia',
                    style: movieTitleTextStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ComedyMovies(),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Romance',
                    style: movieTitleTextStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RomanceMovies(),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
