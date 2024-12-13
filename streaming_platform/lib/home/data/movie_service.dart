import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:streaming_platform/home/domain/entity/movie.dart';

class MovieService {
  final String baseUrl = 'http://www.omdbapi.com/';

  Future<List<Movie>> getPopularMovies() async {
    final response = await http.get(Uri.parse('$baseUrl?apikey=655a273f&s=matrix'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['Search'];
      return jsonResponse.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load popular movies');
    }
  }
}