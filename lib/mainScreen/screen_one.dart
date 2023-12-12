import 'package:flutter/material.dart';
import 'components/salesBanner.dart';
import 'components/searchBar.dart';
import 'components/header.dart';
import 'components/firstDispay.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "screen one",
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
        body: ListView(
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
        ),
      ),
    );
  }
}
