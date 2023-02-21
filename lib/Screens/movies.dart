import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/Model/movieModel.dart';
import 'package:movie_app/Secret.dart';
import 'package:movie_app/Widgets/SidebarMenu.dart';
import 'package:movie_app/Widgets/secondMovieWidget.dart';

class moviesScreen extends StatefulWidget {
  const moviesScreen({super.key});

  @override
  State<moviesScreen> createState() => _moviesScreenState();
}

class _moviesScreenState extends State<moviesScreen> {
  int page = 1;

  String? _selectedItem1;
  String? _genre;
  String? _yearTo;
  String? _yearFrom;
  final scrollController = ScrollController();
  bool loading = true;
  List<MovieModel> list = [];
  _fetchData(
      [String _genre = '', String _yearTo = '', String _yearFrom = '']) async {
    if (_yearTo == null || _yearTo == "null" || _yearTo == '') {
      _yearTo = '';
    }
    if (_yearFrom == null || _yearFrom == "null" || _yearFrom == '') {
      _yearFrom = '';
    }
    if (_genre == null || _genre == "null" || _genre == '') {
      _genre = '';
    }

    final response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/discover/movie?api_key=${apiKey}&with_genres=${_genre}&primary_release_date.gte=${_yearFrom}&primary_release_date.lte=${_yearTo}&page=${page}&language=ar"));
    print(response);

    if (response.statusCode == 200) {
      print(json
          .decode(response.body)
          .runtimeType); // _InternalLinkedHashMap<String, dynamic>

      list = list +
          (json.decode(response.body)['results'] as List)
              .map((data) => MovieModel.fromJson(data))
              .toList();
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    } else {
      throw Exception('Failed to load');
    }
  }

  _scrollController() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      page = page + 1;
      _fetchData(_genre ?? '', _yearTo ?? '', _yearFrom ?? '');
    }
  }

  _loadNumOfMovies() {
    page = page + 1;
    _fetchData(_genre!, _yearTo!, _yearFrom!);
  }

  _reload() {
    list = [];
    page = 1;
  }

  @override
  void initState() {
    _fetchData();
    scrollController.addListener(_scrollController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> _items1 = ['Genres', 'From', 'To'];
    final List<String> _years = [
      '1950',
      '1951',
      '1952',
      '1953',
      '1954',
      '1955',
      '1956',
      '1957',
      '1958',
      '1959',
      '1960',
      '1961',
      '1962',
      '1963',
      '1964',
      '1965',
      '1966',
      '1967',
      '1968',
      '1969',
      '1970',
      '1971',
      '1972',
      '1973',
      '1974',
      '1975',
      '1976',
      '1977',
      '1978',
      '1979',
      '1980',
      '1981',
      '1982',
      '1983',
      '1984',
      '1985',
      '1986',
      '1987',
      '1988',
      '1989',
      '1990',
      '1991',
      '1992',
      '1993',
      '1994',
      '1995',
      '1996',
      '1997',
      '1998',
      '1999',
      '2000',
      '2001',
      '2002',
      '2003',
      '2004',
      '2005',
      '2006',
      '2007',
      '2008',
      '2009',
      '2010',
      '2011',
      '2012',
      '2013',
      '2014',
      '2015',
      '2016',
      '2017',
      '2018',
      '2019',
      '2020',
      '2021',
      '2022',
      '2023'
    ];
    List<List> _genres = [
      [0, "28", "Action"],
      [1, "12", "Adventure"],
      [2, "16", "Animation"],
      [3, "35", "Comedy"],
      [4, "80", "Crime"],
      [5, "99", "Documentary"],
      [6, "18", "Drama"],
      [7, "82", "Family"],
      [8, "14", "Fantasy"],
      [9, "36", "History"],
      [10, "27", "Horror"],
      [11, "10402", "Music"],
      [12, "9648", "Mystery"],
      [13, "10749", "Romance"],
      [14, "878", "Science Fiction"],
      [15, "10770", "TV Movie"],
      [16, "53", "Thriller"],
      [17, "10752", "War"],
      [18, "37", "Western"]
    ];

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 65, 64, 64),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            DropdownButton(
              items: _items1.map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Row(
                    children: [
                      Text(item),
                      SizedBox(width: 8),
                      if (item == "To")
                        DropdownButton(
                          hint: Text(
                              _yearTo == null ? 'select' : _yearTo as String),
                          value: _yearTo,
                          items: _years.map((subitem) {
                            return DropdownMenuItem(
                              value: subitem,
                              child: Container(child: new Text(subitem)),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _yearTo = value as String?;
                            });
                            _reload();
                            _fetchData(_genre.toString(), _yearTo.toString(),
                                _yearFrom.toString());
                          },
                        ),
                      if (item == "From")
                        DropdownButton(
                          hint: Text(_yearFrom == null
                              ? 'select'
                              : _yearFrom as String),
                          value: _yearFrom,
                          items: _years.map((subitem) {
                            return DropdownMenuItem(
                              value: subitem,
                              child: Container(child: new Text(subitem)),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _yearFrom = value as String?;
                            });
                            _reload();
                            _fetchData(_genre.toString(), _yearTo.toString(),
                                _yearFrom.toString());
                          },
                        ),
                      if (item == "Genres")
                        DropdownButton(
                          hint: Text(
                              _genre == null ? 'select' : _genre as String),
                          value: _genre != null
                              ? _genres.indexWhere((item) => item[1] == _genre)
                              : null,
                          items: _genres.map((subitem) {
                            return DropdownMenuItem(
                              value: subitem[0],
                              child: Text(subitem[2]),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              final selectedItem = _genres
                                  .firstWhere((item) => item[0] == value);
                              _genre = selectedItem[1];
                            });
                            Navigator.pop(context);
                            _reload();
                            _fetchData(_genre.toString(), _yearTo.toString(),
                                _yearFrom.toString());
                          },
                        )
                    ],
                  ),
                );
              }).toList(),
              onChanged: (value) {},
            )
          ],
          title: Text('Movies')),
      drawer: SidebarMenu(),
      body: SafeArea(
        child: loading == true
            ? Container()
            : Container(
                child: Center(
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height),
                    ),
                    itemCount: list.length,
                    controller: scrollController,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: secondMovieWidget(
                          movies: list,
                          index: index,
                        ),
                      );
                    },
                  ),
                ),
              ),
      ),
    );
  }
}
