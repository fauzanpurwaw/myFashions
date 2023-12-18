import 'package:flutter/material.dart';

class SearchingBar extends StatelessWidget {
  const SearchingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
<<<<<<< HEAD
      child: Wrap(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
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
                      hintStyle: MaterialStateProperty.all(
                          TextStyle(color: Colors.grey)),
                    ),
                  ),
=======
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 260,
                height: 50,
                margin: const EdgeInsets.only(right: 6),
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
>>>>>>> 77d94fcbd3ea9e8398d33aa3fe2fac8eff554853
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Ink(
              height: 50,
              width: 50,
              decoration: const ShapeDecoration(
                color: Colors.black,
                shape: CircleBorder(),
              ),
<<<<<<< HEAD
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.filter_list_rounded),
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
=======
            ],
          ),
        ),
        Container(
          width: 50,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.black),
          child: Ink(
          height: 40,
          width: 40,
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
        )
      ],
    ),);
>>>>>>> 77d94fcbd3ea9e8398d33aa3fe2fac8eff554853
  }
}
