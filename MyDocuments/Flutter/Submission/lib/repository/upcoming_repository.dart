import 'package:Submission/models/games_response.dart';
import 'package:Submission/services/api_helper.dart';

class UpcomingRepository {
  final String _urlString =
      'https://api.rawg.io/api/games?dates=2019-10-10,2020-10-10&ordering=-added';

  final _helper = ApiHelper();

  Future<List<Game>> fetchGames() async {
    final response = await _helper.get(_urlString);
    return GamesResponse.fromJson(response).games;
  }
}
