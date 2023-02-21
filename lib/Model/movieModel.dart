class MovieModel {
  final int id;
  final String title;
  final String? imageUrl;
  final String year;
  String overview;
  double rating;
  List<String> genres;

  MovieModel({
    required this.id,
    required this.title,
    this.imageUrl,
    required this.year,
    required this.overview,
    required this.rating,
    required this.genres,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    List<String> genres = [];
    if (json['genres'] != null) {
      for (var genre in json['genres']) {
        genres.add(genre['name']);
      }
    }

    return MovieModel(
      id: json['id'],
      title: json['original_title'],
      imageUrl: json['poster_path'],
      year: json['release_date'].substring(0, 4),
      overview: json['overview'],
      rating: (json['vote_average'] as num).toDouble(),
      genres: genres,
    );
  }
}
