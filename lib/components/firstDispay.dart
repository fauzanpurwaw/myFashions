import 'dart:convert';
import 'package:flutter/material.dart';
import '../screens/detail_item.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:latihan_dua/album/products.dart';
import 'package:latihan_dua/routes/routes.dart';

class FirstDisplay extends StatefulWidget {
  const FirstDisplay({super.key});

  @override
  State<FirstDisplay> createState() => _FirstDisplayState();
}

class _FirstDisplayState extends State<FirstDisplay> {
  List products = [];

  Future<List> fetchData() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products?limit=6'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['products'];
      setState(() {
        products = data.map((item) => Product.fromJson(item)).toList();
        print('Data fetched successfully!');
      });

      return products;
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
      throw Exception("gagal");
    }
  }

  final numFormat = new NumberFormat("#,##0.00", "en_US");

  @override
  void initState() {
    super.initState();
    print('Init State Run');
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "New Arrivals",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "View All",
                    style: TextStyle(color: Color.fromARGB(255, 134, 134, 134)),
                  ))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          height: MediaQuery.of(context).size.height / 1.5,
          child: products.isEmpty
              ? Wrap(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    )
                  ],
                )
              : GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: .5,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: List.generate(
                    products.length,
                    (index) {
                      return Container(
                        child: Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  child: Flexible(
                                    child: InkWell(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20)),
                                        onTap: () {
                                          Navigator.of(context).push(
                                              AnimationRoute(ScrDetailItem(
                                                  id: products[index].id)));
                                          // Navigator.of(context).pop();
                                        },
                                        child: Image.network(
                                          products[index].thumbnail.toString(),
                                          fit: BoxFit.cover,
                                          height: 300,
                                        )),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 2),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                AnimationRoute(ScrDetailItem(
                                                    id: products[index].id)));
                                            // Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            products[index].title.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                        )),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 2),
                                      child: Text(
                                        products[index].category.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                            fontSize: 11),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 2),
                                      child: Text(
                                        "\$" +
                                            numFormat
                                                .format(products[index].price),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 14),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ),
      ],
    );
  }
}
