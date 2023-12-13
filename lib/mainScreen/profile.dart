import 'package:flutter/material.dart';

class ScrProfile extends StatefulWidget {
  final itemName;
  const ScrProfile({super.key, this.itemName = "Profile"});

  @override
  State<ScrProfile> createState() => _ScrProfileState();
}

class _ScrProfileState extends State<ScrProfile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: widget.itemName,
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
        body: const Center(
          child: Text("Profile"),
        ),
      ),
    );
  }
}
