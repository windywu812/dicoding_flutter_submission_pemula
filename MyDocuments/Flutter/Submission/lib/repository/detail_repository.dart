import 'package:Submission/models/games_response.dart';
import 'package:Submission/services/api_helper.dart';

class DetailGamesRepository {
  final String _urlString = 'https://api.rawg.io/api/games/';

  final _helper = ApiHelper();

  Future<Game> fetchDetail(int id) async {
    final response = await _helper.get(_urlString + '$id');
    return Game.fromJson(response);
  }
}
