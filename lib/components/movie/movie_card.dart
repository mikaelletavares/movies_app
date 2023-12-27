import 'package:flutter/material.dart';
import 'package:movies_app/model/movie.dart';
import 'package:movies_app/utils/constants.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColorDark,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            movie.img,
            height: 210.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: movieTextStyleBold,
                ),
                Text(
                  'Year: ${movie.year}',
                  style: descriptionTextStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
