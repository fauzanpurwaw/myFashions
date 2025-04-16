import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latihan_dua/album/products.dart';

class SearchingBar extends StatefulWidget {
  const SearchingBar(
      {super.key,
      required this.setSelectedIndex,
      required this.setProducts,
      required this.focusNode,
      required this.setVisibleContainer});

  @override
  State<SearchingBar> createState() => _SearchingBarState();

  final Function setSelectedIndex;
  final Function setVisibleContainer;
  final Function setProducts;
  final FocusNode focusNode;
}

class _SearchingBarState extends State<SearchingBar> {
  List? products;

  Future<List> fetchData(String keyword) async {
    setState(() {
      products = null;
    });

    final response = await http.get(
        Uri.parse('https://dummyjson.com/product/search?q=$keyword&limit=6'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['products'];
      setState(() {
        products = data.map((item) => Product.fromJson(item)).toList();
        print(
            'Data fetched successfully! -------------------------------------');
      });

      return data;
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
      throw Exception("gagal");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Flex(
        mainAxisAlignment: MainAxisAlignment.center,
        direction: Axis.horizontal,
        children: [
          Flexible(
            child: SizedBox(
              height: 50,
              child: Flexible(
                child: SearchBar(
                  focusNode: widget.focusNode,
                  onChanged: (value) async {
                    bool isSearchBarEmpty = value.isEmpty;

                    widget.setVisibleContainer(!isSearchBarEmpty);

                    if (isSearchBarEmpty == false) {
                      widget.setProducts(null);
                      await fetchData(value.toLowerCase());
                    }
                    widget.setProducts(products);
                  },
                  backgroundColor: WidgetStateColor.resolveWith(
                      (states) => const Color.fromARGB(233, 233, 233, 233)),
                  elevation: WidgetStateProperty.all(0),
                  hintText: "Search...",
                  leading: const Icon(Icons.search),
                  padding: WidgetStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 20)),
                  hintStyle:
                      WidgetStateProperty.all(const TextStyle(color: Colors.grey)),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.black),
            child: Ink(
              height: 50,
              width: 50,
              decoration: const ShapeDecoration(
                color: Colors.black,
                shape: CircleBorder(),
              ),
              child: IconButton(
                onPressed: () {
                  widget.setSelectedIndex(1);
                },
                icon: const Icon(Icons.filter_list_rounded),
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
