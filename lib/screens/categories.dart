import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:latihan_dua/routes/routes.dart';
import 'category.dart';
import 'package:http/http.dart' as http;
import 'package:latihan_dua/album/categories.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final TextEditingController searchBarController = TextEditingController();

  String? _categoryInput;
  List? categories;

  void onSearchBarChanged() {
    setState(() {
      _categoryInput = searchBarController.text;
    });
    print(_categoryInput);
  }

  Future<List> getCategories() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products/categories'));

    if (response.statusCode == 200) {
      setState(() {
        categories = jsonDecode(response.body);
      });

      print("fetching clear");
      return jsonDecode(response.body);
    } else {
      throw Exception("Fetc Categories Failed");
    }
  }

  @override
  void initState() {
    super.initState();
    print("start fetching");
    getCategories();
  }

  Widget build(BuildContext context) {
    if (categories == null) {
      return Center(
        child: CircularProgressIndicator(
          color: Colors.black,
        ),
      );
    }
    return Container(
      alignment: Alignment.center,
      child: Container(
        constraints: BoxConstraints(maxWidth: 680),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            SearchBar(
              controller: searchBarController,
              onSubmitted: (values) => onSearchBarChanged(),
              backgroundColor: MaterialStateColor.resolveWith(
                  (states) => Color.fromARGB(233, 233, 233, 233)),
              elevation: MaterialStateProperty.all(0),
              hintText: "Search...",
              leading: const Icon(Icons.search),
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 20)),
              hintStyle:
                  MaterialStateProperty.all(TextStyle(color: Colors.grey)),
            ),
            Flexible(
                child: Container(
              margin: const EdgeInsets.only(top: 20),
              child: ListView.builder(
                itemCount: categories!.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(AnimationRoute(CategoryScreen(
                          category: categories![index],
                        )));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        padding: const EdgeInsets.symmetric(horizontal: 28),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(25)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    categories![index],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ))
          ],
        ),
      ),
    );
  }
}
