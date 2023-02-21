import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_app/Model/movieModel.dart';

class detailedMovieWidget extends StatelessWidget {
  final MovieModel movie;
  const detailedMovieWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 65, 64, 64),
        body: SingleChildScrollView(
          child: Column(
            children: [
              movie.imageUrl.toString() == "null"
                  ? Image.asset("Images/Image_not_available.png")
                  : Center(
                      child: Container(
                        height: 370,
                        width: double.infinity,
                        child: Image.network(
                            'http://image.tmdb.org/t/p/w500' +
                                movie.imageUrl.toString(),
                            fit: BoxFit.fitWidth),
                      ),
                    ),
              Container(
                transform: Matrix4.translationValues(0, -40, 0),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Row(
                    children: [
                      Stack(
                        children: <Widget>[
                          // Stroked text as border.
                          Text(
                            movie.year,
                            style: TextStyle(
                              fontSize: 30,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 6
                                ..color = Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          // Solid text as fill.
                          Text(
                            movie.year,
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.grey[300],
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Stack(
                        children: <Widget>[
                          // Stroked text as border.
                          Text(
                            movie.rating.toString(),
                            style: TextStyle(
                              fontSize: 30,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 6
                                ..color = Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          // Solid text as fill.
                          Text(
                            movie.rating.toString(),
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.grey[300],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  textAlign: TextAlign.center,
                  movie.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: Offset(5.0, 5.0),
                        blurRadius: 39.0,
                        color: Color.fromARGB(255, 184, 163, 163),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  textAlign: TextAlign.center,
                  movie.overview,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
