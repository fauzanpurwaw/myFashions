import 'dart:convert';
import 'package:flutter/material.dart';
import '../screens/detail_item.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:latihan_dua/album/products.dart';
import 'package:latihan_dua/routes/routes.dart';
import 'package:latihan_dua/screens/category.dart';

class FirstDisplay extends StatefulWidget {
  const FirstDisplay({super.key, required this.category});

  @override
  State<FirstDisplay> createState() => _FirstDisplayState();

  final String category;
}

class _FirstDisplayState extends State<FirstDisplay> {
  List? products;

  Future<List> fetchData() async {
    final response = await http.get(
        Uri.parse('https://dummyjson.com/product/category/${widget.category}'));
    // print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['products'];
      setState(() {
        products = data.map((item) => Product.fromJson(item)).toList();
        print(
            'Data fetched successfully! -------------------------------------');
      });

      print(data);

      return data;
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
              Text(
                widget.category.toUpperCase(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(AnimationRoute(
                        CategoryScreen(category: widget.category)));
                  },
                  child: const Text(
                    "View All",
                    style: TextStyle(color: Color.fromARGB(255, 134, 134, 134)),
                  ))
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 20),
            height: MediaQuery.of(context).size.width / 3 * 2.2,
            child: products == null
                ? Wrap(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 40),
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      )
                    ],
                  )
                : Container(
                    child: GridView.count(
                      controller: ScrollController(keepScrollOffset: false),
                      crossAxisCount: 3,
                      childAspectRatio: .5,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      physics: RangeMaintainingScrollPhysics(),
                      children: List.generate(
                        products!.length,
                        (index) {
                          return Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Container(
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      child: InkWell(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20)),
                                        onTap: () {
                                          Navigator.of(context).push(
                                              AnimationRoute(ScrDetailItem(
                                                  id: products![index].id)));
                                          // Navigator.of(context).pop();
                                        },
                                        child: Flexible(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      products![index]
                                                          .thumbnail),
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4),
                                  constraints: BoxConstraints(maxHeight: 70),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              child: InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  AnimationRoute(ScrDetailItem(
                                                      id: products![index]
                                                          .id)));
                                              // Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              products![index].title.toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )),
                                          Container(
                                            child: Text(
                                              products![index]
                                                  .category
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey,
                                                  fontSize: 11),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        child: Text(
                                          "\$" +
                                              numFormat.format(
                                                  products![index].price),
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
                          );
                        },
                      ),
                    ),
                  )),
      ],
    );
  }
}
