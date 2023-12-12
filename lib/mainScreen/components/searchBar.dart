import 'package:flutter/material.dart';

class SearchingBar extends StatelessWidget {
  const SearchingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          width: 280,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromARGB(233, 233, 233, 233)),
                width: 260,
                height: 50,
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                      color: Colors.black,
                    ),
                    const Text(
                      "search...",
                      style:
                          TextStyle(color: Color.fromARGB(255, 156, 156, 156)),
                    )
                  ],
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
