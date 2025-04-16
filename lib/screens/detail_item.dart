import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:latihan_dua/album/products.dart';
import 'dart:convert';
import 'package:latihan_dua/routes/routes.dart';
import 'home.dart';

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

  final numFormat = NumberFormat("#,##0.00", "en_US");

  @override
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
          child: const Center(
              child: CircularProgressIndicator(
            color: Colors.black,
          )),
        ),
      );
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: product!.title,
      theme: ThemeData(appBarTheme: const AppBarTheme(color: Colors.white)),
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 680),
            child: ListView(children: [
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
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(product!.thumbnail),
                                fit: BoxFit.cover)),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 18),
                          alignment: Alignment.topLeft,
                          child: InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.black),
                              child: IconButton(
                                icon: const Icon(Icons.chevron_left),
                                color: Colors.white,
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                              ),
                            ),
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
                              Flexible(
                                child: SizedBox(
                                  height: 80,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product!.title,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        product!.category,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.grey),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding:
                                                const EdgeInsets.only(right: 4),
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
                                          Text(
                                            product!.rating.toString(),
                                            style: const TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Wrap(
                                children: [
                                  SizedBox(
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
                                                child: const Text("-"),
                                              ),
                                              Text(stockCounter.toString()),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    if (stockCounter !=
                                                        product!.stock) {
                                                      stockCounter++;
                                                    }
                                                  });
                                                },
                                                child: const Text("+"),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          "${product!.stock} available in stok",
                                          style: const TextStyle(
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
                                margin: const EdgeInsets.only(top: 20),
                                width: 100,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
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
                                            child: const Icon(
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
                              Flexible(
                                child: Container(
                                  height: 90,
                                  margin: const EdgeInsets.only(top: 20),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Description",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        product!.description,
                                        maxLines: 6,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ]),
          ),
        ),
        bottomNavigationBar: Container(
          constraints: const BoxConstraints(maxWidth: 680),
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
                      const Text(
                        "Total Price",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        "\$${numFormat.format(product!.price * stockCounter)}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    highlightColor: Colors.white,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 6),
                            child: const Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
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
