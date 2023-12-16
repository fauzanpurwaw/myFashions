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
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
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
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                child: Column(
                  children: [
                    Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(border: Border(),color: Colors.white),
                      child: Card(
                        elevation: 10,
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
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(border: Border()),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        right: 10, top: 2),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 20),
                                        child: Icon(Icons.person_2),
                                      ),
                                      Text(
                                        "Personal Details",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ]),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.chevron_right_rounded))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        right: 10, top: 2),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 20),
                                        child: Icon(Icons.shopping_bag_rounded),
                                      ),
                                      Text(
                                        "My Order",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ]),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.chevron_right_rounded))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        right: 10, top: 2),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 20),
                                        child: Icon(Icons.favorite_rounded),
                                      ),
                                      Text(
                                        "Favorites",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ]),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.chevron_right_rounded))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        right: 10, top: 2),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 20),
                                        child: Icon(Icons.credit_card_rounded),
                                      ),
                                      Text(
                                        "My Card",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ]),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.chevron_right_rounded))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        right: 10, top: 2),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 20),
                                        child: Icon(Icons.settings_rounded),
                                      ),
                                      Text(
                                        "Settings",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ]),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.chevron_right_rounded))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(border: Border()),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          right: 10, top: 2),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Row(children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 20),
                                          child: Icon(Icons.person_2),
                                        ),
                                        Text(
                                          "Personal Details",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ]),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.chevron_right_rounded))
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        right: 10, top: 2),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 20),
                                        child: Icon(Icons.shopping_bag_rounded),
                                      ),
                                      Text(
                                        "My Order",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ]),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.chevron_right_rounded))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        right: 10, top: 2),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 20),
                                        child: Icon(Icons.favorite_rounded),
                                      ),
                                      Text(
                                        "Favorites",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ]),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.chevron_right_rounded))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        right: 10, top: 2),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 20),
                                        child: Icon(Icons.credit_card_rounded),
                                      ),
                                      Text(
                                        "My Card",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ]),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.chevron_right_rounded))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        right: 10, top: 2),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 20),
                                        child: Icon(Icons.settings_rounded),
                                      ),
                                      Text(
                                        "Settings",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ]),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.chevron_right_rounded))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
