import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();

  final String category;
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Category | ${widget.category}',
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
        body: Center(
          child: Text('${widget.category}'),
        ),
      ),
    );
  }
}
