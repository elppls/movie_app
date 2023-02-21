import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MovieWidget extends StatelessWidget {
  final List movies;
  final int index;
  const MovieWidget({super.key, required this.movies, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print(index),
      child: Container(
        width: 140,
        child: Column(
          children: [
            Image.network('http://image.tmdb.org/t/p/w500' +
                movies[index]['poster_path']),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    movies[index]['original_title'],
                    textAlign: TextAlign.start,
                  ),
                ),
                Spacer(),
                Text(
                  movies[index]['vote_average'].toString() as String,
                  textAlign: TextAlign.center,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
