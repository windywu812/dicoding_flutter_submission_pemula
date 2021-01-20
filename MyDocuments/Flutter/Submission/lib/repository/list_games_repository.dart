import 'package:Submission/models/games_response.dart';
import 'package:Submission/services/api_helper.dart';

class ListGamesRepository {
  final String _urlString = 'https://api.rawg.io/api/games';

  final _helper = ApiHelper();

  Future<List<Game>> fetchGames() async {
    final response = await _helper.get(_urlString);
    return GamesResponse.fromJson(response).games;
  }
}
