import 'package:Submission/models/games_response.dart';
import 'package:Submission/reusables/small_cell.dart';
import 'package:flutter/material.dart';
import 'package:Submission/repository/search_repository.dart';
import 'detail_page.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String keyword;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Search",
                hintText: "Enter a keyword",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                ),
              ),
              onChanged: (text) {
                setState(() {
                  this.keyword = text;
                });
              },
            ),
            SizedBox(
              height: 16,
            ),
            FutureBuilder<List<Game>>(
              future: SearchRepository().fetchGames(keyword),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
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
                    ),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Expanded(
//               child: ListView.builder(
//                 itemCount: listGame.length,
//                 shrinkWrap: true,
//                 physics: ScrollPhysics(),
//                 itemBuilder: (BuildContext context, int index) {
//                   return InkWell(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => DetailPage(
//                             idGame: listGame[index].id,
//                           ),
//                         ),
//                       );
//                     },
//                     child: SmallCell(
//                       name: listGame[index].name,
//                       backgroundImage: listGame[index].backgroundImage,
//                       rating: listGame[index].rating,
//                     ),
//                   );
//                 },
//               ),
//             ),
