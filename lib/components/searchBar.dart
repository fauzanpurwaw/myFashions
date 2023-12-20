import 'package:flutter/material.dart';

class SearchingBar extends StatefulWidget {
  SearchingBar({super.key, required this.setSelectedIndex});

  @override
  State<SearchingBar> createState() => _SearchingBarState();

  Function setSelectedIndex;
}

class _SearchingBarState extends State<SearchingBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: [
          Container(
            child: Container(
              constraints: BoxConstraints(maxWidth: 500),
              width: MediaQuery.of(context).size.width / 2,
              height: 50,
              child: Flexible(
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
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.black),
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
