import 'package:flutter/material.dart';

class ScrDetailItem extends StatefulWidget {
  final itemName;
  const ScrDetailItem({super.key, this.itemName = "test one"});

  @override
  State<ScrDetailItem> createState() => _ScrDetailItemState();
}

class _ScrDetailItemState extends State<ScrDetailItem> {
  int stockCounter = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: widget.itemName,
      theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.white)),
      home: Scaffold(
        body: ListView(children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                alignment: Alignment.topCenter,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Wrap(children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/handbag.jpg"),
                            fit: BoxFit.cover)),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 18),
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: const Icon(Icons.chevron_left),
                        color: const Color.fromARGB(255, 0, 0, 0),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  )
                ]),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.9,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25))),
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(25, 40, 25, 10),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "The March Jacobs",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  "Traveller Tote",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(right: 4),
                                      child: const Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Text(
                                      "(320 Review)",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Wrap(
                            children: [
                              Container(
                                height: 80,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 30,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25)),
                                          color: Color.fromARGB(
                                              255, 223, 222, 222)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                if (stockCounter != 1) {
                                                  stockCounter--;
                                                }
                                              });
                                            },
                                            child: Text("-"),
                                          ),
                                          Text(stockCounter.toString()),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                if (stockCounter != 15) {
                                                  stockCounter++;
                                                }
                                              });
                                            },
                                            child: Text("+"),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Text(
                                      "15 available in stok",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: [
                      //     Container(
                      //       height: 80,
                      //       child: const Column(
                      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Text(
                      //             "Size",
                      //             style: TextStyle(
                      //                 fontSize: 20,
                      //                 fontWeight: FontWeight.bold),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     Wrap(
                      //       children: [
                      //         Container(
                      //           height: 80,
                      //           child: Column(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceAround,
                      //             children: [
                      //               Container(
                      //                 width: 80,
                      //                 height: 30,
                      //                 padding: const EdgeInsets.symmetric(
                      //                     horizontal: 10),
                      //                 decoration: const BoxDecoration(
                      //                     borderRadius: BorderRadius.all(
                      //                         Radius.circular(25)),
                      //                     color: Color.fromARGB(
                      //                         255, 223, 222, 222)),
                      //                 child: Row(
                      //                   mainAxisAlignment:
                      //                       MainAxisAlignment.spaceBetween,
                      //                   children: [
                      //                     InkWell(
                      //                       onTap: () {
                      //                         setState(() {
                      //                           if (stockCounter != 1) {
                      //                             stockCounter--;
                      //                           }
                      //                         });
                      //                       },
                      //                       child: Text("-"),
                      //                     ),
                      //                     Text(stockCounter.toString()),
                      //                     InkWell(
                      //                       onTap: () {
                      //                         setState(() {
                      //                           stockCounter++;
                      //                         });
                      //                       },
                      //                       child: Text("+"),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ),
                      //               const Text(
                      //                 "available in stok",
                      //                 style: TextStyle(
                      //                     fontSize: 12,
                      //                     fontWeight: FontWeight.bold),
                      //               )
                      //             ],
                      //           ),
                      //         )
                      //       ],
                      //     ),
                      //   ],
                      // )
                    ],
                  ),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
