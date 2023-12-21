import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:latihan_dua/album/products.dart';
import 'dart:convert';
import 'package:latihan_dua/routes/routes.dart';
import '../screens/detail_item.dart';
import 'package:intl/intl.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();

  final String category;
}

class _CategoryScreenState extends State<CategoryScreen> {
  List? products;

  Future<List> fetchData() async {
    final response = await http.get(
        Uri.parse('https://dummyjson.com/product/category/${widget.category}'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['products'];
      setState(
        () {
          products = data.map((item) => Product.fromJson(item)).toList();
          print(
              'Data fetched successfully! -------------------------------------');
        },
      );

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
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Category | ${widget.category}',
      theme: ThemeData(appBarTheme: const AppBarTheme(color: Colors.white)),
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
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: Text(
                    widget.category.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
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
            ),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Container(
            constraints: BoxConstraints(maxWidth: 680),
            height: MediaQuery.of(context).size.height,
            child: products == null
                ? Center(
                    child: CircularProgressIndicator(
                    color: Colors.black,
                  ))
                : GridView.count(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    crossAxisCount: 4,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.5,
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
                                                    products![index].thumbnail),
                                                fit: BoxFit.fill),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                constraints: BoxConstraints(maxHeight: 70),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                                    id: products![index].id)));
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
                                            numFormat
                                                .format(products![index].price),
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
          ),
        ),
      ),
    );
  }
}
