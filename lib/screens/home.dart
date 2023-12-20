import 'package:flutter/material.dart';
import 'package:latihan_dua/screens/categories.dart';
import 'package:latihan_dua/screens/cart.dart';
import 'package:latihan_dua/screens/profile.dart';
import '../components/salesBanner.dart';
import '../components/searchBar.dart';
import '../components/header.dart';
import '../components/firstDispay.dart';
import 'package:latihan_dua/routes/routes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //init
  int selectedIndex = 0;

  //function
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> display = [
      HomeBody(
        setSelectedIndex: onItemTapped,
      ),
      const CategoriesScreen(),
      const CartScreen(),
    ];
    //variable
    print("im here");

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
                      onPressed: () {
                        Navigator.of(context)
                            .push(AnimationRoute(const ScrProfile()));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: display.elementAt(selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onItemTapped,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.black,
          // selectedIconTheme: IconThemeData(size: 10),
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
              icon: Icon(Icons.shopping_basket),
              label: 'Cart',
            ),
          ],
        ),
      ),
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({super.key, required this.setSelectedIndex});

  @override
  State<HomeBody> createState() => _HomeBodyState();

  final Function setSelectedIndex;
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 680),
        child: ListView(
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
              child: SearchingBar(
                setSelectedIndex: widget.setSelectedIndex,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              height: 190,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(5, (index) {
                  return const SalesBanner();
                }),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: const FirstDisplay(
                category: "smartphones",
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: const FirstDisplay(
                category: "laptops",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
