import 'package:flutter/material.dart';

class HeaderScreenOne extends StatelessWidget {
  const HeaderScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      children: [
        Wrap(
          direction: Axis.vertical,
          children: [
            Text(
              "Welcome to",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Text(
              "Our Fashions App",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(102, 102, 102, 102),
                  fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    );
  }
}
