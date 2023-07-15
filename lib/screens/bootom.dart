import 'package:flutter/material.dart';
import 'package:pandabar/pandabar.dart';
import 'package:rhss/screens/post.dart';
import 'package:rhss/screens/search.dart';

import 'home.dart';

class Bottom extends StatefulWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  String selectedPage = 'Grey';

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomePage(),
      SearchPage(),
      HomePage(),
      HomePage(),
    ];


    int _getPageIndex(String id) {
      switch (id) {
        case 'Grey':
          return 0;
        case 'Blue':
          return 1;
        case 'Red':
          return 2;
        case 'Yellow':
          return 3;
        default:
          return 0;
      }
    }


    return Scaffold(
      extendBody: true,
      bottomNavigationBar: PandaBar(
        buttonData: [
          PandaBarButtonData(
            id: 'Grey',
            icon: Icons.home,
           // title: 'Home',
          ),
          PandaBarButtonData(
            id: 'Blue',
            icon: Icons.search,
            //title: 'Search',
          ),
          PandaBarButtonData(
            id: 'Red',
            icon: Icons.mail,
            //title: 'Profile',
          ),
          PandaBarButtonData(
            id: 'Yellow',
            icon: Icons.person,
            //title: 'Settings',
          ),
        ],
        //buttonColor: Color(0xFFf5844a), // Set the icon color to blue
        //backgroundColor: Color(0xFF5c233b),
        backgroundColor: Colors.white,
        onChange: (id) {
          setState(() {
            selectedPage = id;
          });
        },
        onFabButtonPressed: () {
          Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostPage(),
          ),
        );},
      ),
      body: IndexedStack(
        index: _getPageIndex(selectedPage),
        children: pages,
      ),
    );
  }
}
