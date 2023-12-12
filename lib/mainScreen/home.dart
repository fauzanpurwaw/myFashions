import 'package:flutter/material.dart';
import 'package:latihan_dua/mainScreen/categories.dart';
import 'package:latihan_dua/mainScreen/profile.dart';
import 'components/salesBanner.dart';
import 'components/searchBar.dart';
import 'components/header.dart';
import 'components/firstDispay.dart';
import 'detail_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const List<Widget> display = [
    HomeBody(),
    CategoriesScreen(),
    ProfileScreen(),
  ];

  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "E-Commerce",
      theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.white)),
      home: Scaffold(
        appBar: AppBar(
            toolbarHeight: 80,
            elevation: 0,
            flexibleSpace: Container(
                // color: Colors.amber,
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Ink(
                        decoration: const ShapeDecoration(
                          color: Colors.black,
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.menu_open),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Center(
                      child: Ink(
                        decoration: const ShapeDecoration(
                          color: Color.fromARGB(221, 221, 221, 221),
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.person_3),
                          color: Colors.black54,
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ))),
        body: display.elementAt(selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onItemTapped,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.black,
          currentIndex: selectedIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.tag),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          height: 100,
          child: const HeaderScreenOne(),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 30),
          alignment: Alignment.center,
          child: const SearchingBar(),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          height: 190,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const <Widget>[
              SalesBanner(),
              SalesBanner(),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: const FirstDisplay(),
        ),
      ],
    );
  }
}
