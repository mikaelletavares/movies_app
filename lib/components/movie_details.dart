import 'package:flutter/material.dart';
import 'package:movies_app/components/table_row.dart';
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
            backgroundColor: backgroundColorDark,
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(movie.img),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60, bottom: 60),
                    child: Container(
                      width: 350,
                      decoration: BoxDecoration(
                        color: const Color(0xFF0B0D18),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.arrow_back),
                                  color: backgroundColorLight,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.favorite_border),
                                  color: backgroundColorLight,
                                ),
                              ],
                            ),
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
                              height: 10,
                            ),
                            Text(
                              movie.description,
                              style: descriptionTextStyle,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TableRowDetails(
                              title: 'Ano: ',
                              value: movie.year.toString(),
                            ),
                            TableRowDetails(
                              title: 'Duração: ',
                              value: movie.duration,
                            ),
                            TableRowDetails(
                              title: 'Gênero: ',
                              value: movie.gender,
                            ),
                            TableRowDetails(
                              title: 'País de origem: ',
                              value: movie.country,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: backgroundColorLight,
                                fixedSize: const Size(200, 50),
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
                              height: 10,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
