import 'package:flutter/material.dart';
import 'package:movies_app/components/movie/movie_list.dart';
import 'package:movies_app/screens/movieScreens/movie_view_model.dart';
import 'package:provider/provider.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MovieViewModel(),
      child: const Scaffold(
        backgroundColor: Color(0xFF0B0D18),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 70.0),
            child: MovieList(),
          ),
        ),
      ),
    );
  }
}
