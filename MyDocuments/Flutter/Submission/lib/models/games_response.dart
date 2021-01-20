class GamesResponse {
  List<Game> games;

  GamesResponse({this.games});

  GamesResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      games = new List<Game>();
      json['results'].forEach((v) {
        games.add(new Game.fromJson(v));
      });
    }
  }
}

class Game {
  int id;
  String name;
  String description;
  String released;
  double rating;
  String backgroundImage;

  Game(
      {this.id,
      this.name,
      this.description,
      this.released,
      this.rating,
      this.backgroundImage});

  Game.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    released = json['released'];
    rating = json['rating'];
    backgroundImage = json['background_image'];
  }
}
