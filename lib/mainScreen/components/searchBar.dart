import 'package:flutter/material.dart';

class SearchingBar extends StatelessWidget {
  const SearchingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 280,
                height: 50,
                child: SearchBar(
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
              ),
            ],
          ),
        ),
        Ink(
          height: 50,
          width: 50,
          decoration: const ShapeDecoration(
            color: Colors.black,
            shape: CircleBorder(),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_list_rounded),
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
