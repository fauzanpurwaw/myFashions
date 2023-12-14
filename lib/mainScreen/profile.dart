import 'package:flutter/material.dart';

class ScrProfile extends StatefulWidget {
  final itemName;
  const ScrProfile({super.key, this.itemName = "Profile"});

  @override
  State<ScrProfile> createState() => _ScrProfileState();
}

class _ScrProfileState extends State<ScrProfile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: widget.itemName,
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
                            icon: const Icon(Icons.chevron_left_rounded),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.pop(context);
                            },
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
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                child: Column(
                  children: [
                    Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                width: 60,
                                margin: const EdgeInsets.only(right: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: InkWell(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    child: const Image(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          'assets/images/handbag.jpg',
                                        )),
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Fauzan Purwa W",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "fauzanpurwaw@gmail.com",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
