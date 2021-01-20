import 'package:Submission/models/games_response.dart';
import 'package:Submission/repository/list_games_repository.dart';
import 'package:Submission/repository/most_popular_repository.dart';
import 'package:Submission/repository/upcoming_repository.dart';
import 'package:Submission/reusables/large_cell.dart';
import 'package:Submission/reusables/small_cell.dart';
import 'package:Submission/reusables/shimmering_box.dart';
import 'package:Submission/views/detail_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 8),
                    child: Text(
                      'Popular Games',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  FutureBuilder<List<Game>>(
                    future: MostPopularRepository().fetchGames(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          height: 210,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            physics: ScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                        idGame: snapshot.data[index].id,
                                      ),
                                    ),
                                  );
                                },
                                child: LargeCell(
                                  name: snapshot.data[index].name,
                                  backgroundImage:
                                      snapshot.data[index].backgroundImage,
                                  height: 170,
                                  width: 300,
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return ShimmeringBox();
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 8),
                    child: Text(
                      'Upcoming Games',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  FutureBuilder<List<Game>>(
                    future: UpcomingRepository().fetchGames(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          height: 170,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            physics: ScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                        idGame: snapshot.data[index].id,
                                      ),
                                    ),
                                  );
                                },
                                child: LargeCell(
                                  name: snapshot.data[index].name,
                                  backgroundImage:
                                      snapshot.data[index].backgroundImage,
                                  height: 130,
                                  width: 250,
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return ShimmeringBox();
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 8),
                    child: Text(
                      'Popular Games',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  FutureBuilder<List<Game>>(
                    future: ListGamesRepository().fetchGames(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data.length,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                      idGame: snapshot.data[index].id,
                                    ),
                                  ),
                                );
                              },
                              child: SmallCell(
                                name: snapshot.data[index].name,
                                backgroundImage:
                                    snapshot.data[index].backgroundImage,
                                rating: snapshot.data[index].rating,
                              ),
                            );
                          },
                        );
                      } else {
                        return ShimmeringBox();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
