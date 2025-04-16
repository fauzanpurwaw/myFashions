import 'package:flutter/material.dart';

class SalesBanner extends StatelessWidget {
  const SalesBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(14, 24, 14, 20),
          margin: const EdgeInsets.fromLTRB(0, 10, 20, 0),
          width: 260,
          decoration: const BoxDecoration(
              color: Color.fromARGB(245, 226, 226, 226),
              borderRadius: BorderRadius.all(Radius.circular(25))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "50% Off",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Text(
                "On Everything Today",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 4, 0, 10),
                child: const Text(
                  "With code:FSCREATION",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.grey),
                ),
              ),
              Wrap(
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          backgroundColor: Colors.black),
                      child: const Text(
                        "Get Now",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
