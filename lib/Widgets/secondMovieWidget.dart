import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_app/Model/movieModel.dart';
import 'package:movie_app/Widgets/detailed_movieWidget.dart';

class secondMovieWidget extends StatelessWidget {
  final List<MovieModel> movies;
  final int index;
  const secondMovieWidget(
      {super.key, required this.movies, required this.index});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = screenWidth * 0.5;
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => detailedMovieWidget(movie: movies[index]),
        ),
      ),
      child: Container(
        width: containerWidth,
        child: Column(
          children: [
            movies[index].imageUrl.toString() == "null"
                ? Image.asset("Images/Image_not_available.png")
                : Image.network('http://image.tmdb.org/t/p/w500' +
                    movies[index].imageUrl.toString()),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 8,
                  child: Text(
                    movies[index].title.toString().length < 40
                        ? movies[index].title
                        : '${movies[index].title.substring(1, 40)}...',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  movies[index].year.toString(),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Text(
                  movies[index].rating.toString(),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
