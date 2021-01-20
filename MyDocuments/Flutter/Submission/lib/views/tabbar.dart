import 'package:Submission/views/home_page.dart';
import 'package:Submission/views/search_page.dart';
import 'package:flutter/material.dart';

class BottomNavPage extends StatefulWidget {
  @override
  _BottomNavPage createState() {
    // TODO: implement createState
    return _BottomNavPage();
  }
}

class _BottomNavPage extends State<BottomNavPage> {
  int _selectedIndex = 0;

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _listPage = <Widget>[
      HomePage(),
      SearchPage(),
    ];

    final _bottomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.games),
        label: "Explore",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: "Search",
      ),
    ];

    final _bottomNavBar = BottomNavigationBar(
      items: _bottomNavBarItems,
      currentIndex: _selectedIndex,
      onTap: _onNavBarTapped,
    );

    return Scaffold(
      body: _listPage[_selectedIndex],
      bottomNavigationBar: _bottomNavBar,
    );
  }
}
