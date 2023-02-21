import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Model/movieModel.dart';
import 'package:movie_app/Secret.dart';
import 'package:movie_app/Widgets/SidebarMenu.dart';
import 'package:movie_app/Widgets/movieWidget.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final dio = Dio();
  List popularmovies = [];
  List topRated = [];
  int page = 1;
  List list = [];
  List nowPlaying = [];
  bool isLoading = false;
  bool loading = true;
  loadMovies() async {
    TMDB first = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));

    Map popular = await first.v3.movies.getPopular();
    Map toprated = await first.v3.movies.getTopRated();
    Map nowplaying = await first.v3.movies.getNowPlaying();

    if (mounted) {
      setState(() {
        popularmovies = popular['results'];
        nowPlaying = nowplaying['results'];
        topRated = toprated['results'];
        loading = false;
      });
    }
  }

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('hi')),
        drawer: SidebarMenu(),
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Popular Movies',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  loading == true
                      ? Container()
                      : Container(
                          height: 280,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: popularmovies.length,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Container(
                                    child: MovieWidget(
                                      movies: popularmovies,
                                      index: index,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                  SizedBox(
                    height: 30,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Highest Rated Movies',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  loading == true
                      ? Container()
                      : Container(
                          height: 280,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: topRated.length,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Container(
                                    child: MovieWidget(
                                      movies: topRated,
                                      index: index,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                  SizedBox(
                    height: 30,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'New Movies',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  loading == true
                      ? Container()
                      : Container(
                          height: 280,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: nowPlaying.length,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Container(
                                    child: MovieWidget(
                                      movies: nowPlaying,
                                      index: index,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                ],
              ),
            ),
          ),
        ));
  }
}
