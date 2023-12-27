import 'package:flutter/material.dart';
import 'package:movies_app/components/buttonColumn.dart';
import 'package:movies_app/model/movie.dart';
import 'package:movies_app/screens/movieScreens/movie_view_model.dart';
import 'package:movies_app/utils/constants.dart';
import 'package:provider/provider.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;

  const MovieDetails({
    super.key,
    required this.movie,
  });

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
            child: Text('No movies available.'),
          );
        } else {
          return Scaffold(
            backgroundColor: const Color(0xFF0B0D18),
            appBar: AppBar(
              backgroundColor: const Color(0xFF0B0D18),
              foregroundColor: backgroundColorLight,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
                child: Column(
                  children: [
                    Image(
                      width: 200,
                      image: NetworkImage(
                        movie.img,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      movie.title,
                      style: movieTitleTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          movie.year.toString(),
                          style: smallTextStyle,
                        ),
                        Text(
                          movie.duration.toUpperCase(),
                          style: smallTextStyle,
                        ),
                        Text(
                          movie.gender.toUpperCase(),
                          style: smallTextStyle,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: backgroundColorLight,
                        fixedSize: const Size(double.infinity, 45),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                            bottomLeft: Radius.circular(25),
                          ),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.play_arrow_rounded,
                            color: backgroundColorDark,
                          ),
                          Text(
                            'Assistir',
                            style: buttonTextStyleDark,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonColumn(
                          text: 'Minha Lista',
                          defaultIcon: Icons.add,
                          selectedIcon: Icons.check,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        ButtonColumn(
                          text: 'Favoritos',
                          defaultIcon: Icons.favorite_border,
                          selectedIcon: Icons.favorite,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      movie.description,
                      style: descriptionTextStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
