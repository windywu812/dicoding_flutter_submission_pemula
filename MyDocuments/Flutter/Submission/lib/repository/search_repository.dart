import 'package:Submission/models/games_response.dart';
import 'package:Submission/services/api_helper.dart';

class SearchRepository {
  final String _urlString = 'https://api.rawg.io/api/games?search=';

  final _helper = ApiHelper();

  Future<List<Game>> fetchGames(String keyword) async {
    final response = await _helper.get(_urlString + '$keyword');
    return GamesResponse.fromJson(response).games;
  }
}
