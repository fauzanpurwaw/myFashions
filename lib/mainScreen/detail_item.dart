import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:latihan_dua/album/products.dart';
import 'dart:convert';

class ScrDetailItem extends StatefulWidget {
  final int? id;
  const ScrDetailItem({super.key, @required this.id});

  @override
  State<ScrDetailItem> createState() => _ScrDetailItemState();
}

class _ScrDetailItemState extends State<ScrDetailItem> {
  int stockCounter = 1;
  int price = 198;
  Product? product;

  Future<Product> fetchData() async {
    final response = await http
        .get(Uri.parse('https://dummyjson.com/products/${widget.id}'));

    if (response.statusCode == 200) {
      final result = Product.fromJson(json.decode(response.body));

      // List<Product> productList = jsonList
      //     .map((item) => Product.fromJson(item))
      //     .toList(); // Convert each item in the JSON array to a Product object

      setState(() {
        product = result;
        print('Data fetched successfully!');
      });

      return result;
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
      throw Exception("gagal");
    }
  }

  final numFormat = new NumberFormat("#,##0.00", "en_US");

  void initState() {
    super.initState();
    print('Init State Run');
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    if (product == null) {
      return Flexible(
        child: Container(
          color: Colors.white,
          child: const Center(child: CircularProgressIndicator()),
        ),
      );
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: product!.title,
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
                                      width: 90,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 90,
                            margin: EdgeInsets.only(top: 20),
                            width: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Color",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                              color: Colors.grey, width: 2),
                                          color: Colors.amber,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                              color: Colors.grey, width: 2),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                              color: Colors.grey, width: 2),
                                          color: Colors.black,
                                        ),
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 90,
                            margin: EdgeInsets.only(top: 20),
                            width: MediaQuery.of(context).size.width - 50,
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Description",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Get a little lift from these Sam Edelman sandals featuring ruched straps and leather lace-up ties, while a braided jute sole makes a fresh statement for summer.",
                                  // overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ]),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ))),
          padding: const EdgeInsets.symmetric(horizontal: 25),
          height: 90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Price",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        "\$" + numFormat.format(product!.price * stockCounter),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    highlightColor: Colors.white,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(right: 4),
                            child: Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Add to cart",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
