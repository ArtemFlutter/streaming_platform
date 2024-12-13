class Movie {
  final String title;
  final String imageUrl;
  final String year;
  final String imdbID;

  Movie({
    required this.title,
    required this.imageUrl,
    required this.year,
    required this.imdbID,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['Title'],
      imageUrl: json['Poster'],
      year: json['Year'],
      imdbID: json['imdbID'],
    );
  }
}