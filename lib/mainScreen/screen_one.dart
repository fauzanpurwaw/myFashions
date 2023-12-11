import 'package:flutter/material.dart';

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
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
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
              child: const Wrap(
                children: [
                  Wrap(
                    direction: Axis.vertical,
                    children: [
                      Text(
                        "Welcome",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Our Fashions App",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(102, 102, 102, 102),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              alignment: Alignment.center,
              child: Wrap(
                children: [
                  Container(
                    width: 280,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Color.fromARGB(233, 233, 233, 233)),
                          width: 260,
                          height: 50,
                          padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.search),
                                onPressed: () {},
                                color: Colors.black,
                              ),
                              Text(
                                "search...",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 156, 156, 156)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Ink(
                    height: 50,
                    width: 50,
                    decoration: const ShapeDecoration(
                      color: Colors.black,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.filter_list_rounded),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              color: Colors.amber[100],
              child: const Center(child: Text('column C')),
            ),
          ],
        ),
      ),
    );
  }
}
