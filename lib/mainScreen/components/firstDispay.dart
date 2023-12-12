import 'package:flutter/material.dart';
import '../detail_item.dart';

class FirstDisplay extends StatefulWidget {
  const FirstDisplay({super.key});

  @override
  State<FirstDisplay> createState() => _FirstDisplayState();
}

class _FirstDisplayState extends State<FirstDisplay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "New Arrivals",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "View All",
                    style: TextStyle(color: Color.fromARGB(255, 134, 134, 134)),
                  ))
            ],
          ),
        ),
        Wrap(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              child: InkWell(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                onTap: () {
                                  Navigator.of(context).push(_createRoute());
                                },
                                child: const Image(
                                    fit: BoxFit.fitWidth,
                                    width: 160,
                                    height: 160,
                                    image: AssetImage(
                                      'assets/images/handbag.jpg',
                                    )),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              child: Column(
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    child: const Text(
                                      "The Marc Jacob",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    child: const Text(
                                      "Traveler Tote",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                          fontSize: 11),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    child: const Text(
                                      "\$ 195.00",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              child: InkWell(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                onTap: () {
                                  Navigator.of(context).push(_createRoute());
                                },
                                child: const Image(
                                    fit: BoxFit.fitWidth,
                                    width: 160,
                                    height: 160,
                                    image: AssetImage(
                                      'assets/images/handbag.jpg',
                                    )),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              child: Column(
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    child: const Text(
                                      "The Marc Jacob",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    child: const Text(
                                      "Traveler Tote",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                          fontSize: 11),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    child: const Text(
                                      "\$ 195.00",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              child: InkWell(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                onTap: () {
                                  Navigator.of(context).push(_createRoute());
                                },
                                child: const Image(
                                    fit: BoxFit.fitWidth,
                                    width: 160,
                                    height: 160,
                                    image: AssetImage(
                                      'assets/images/handbag.jpg',
                                    )),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              child: Column(
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    child: const Text(
                                      "The Marc Jacob",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    child: const Text(
                                      "Traveler Tote",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                          fontSize: 11),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    child: const Text(
                                      "\$ 195.00",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              child: InkWell(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                onTap: () {
                                  Navigator.of(context).push(_createRoute());
                                },
                                child: const Image(
                                    fit: BoxFit.fitWidth,
                                    width: 160,
                                    height: 160,
                                    image: AssetImage(
                                      'assets/images/handbag.jpg',
                                    )),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              child: Column(
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    child: const Text(
                                      "The Marc Jacob",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    child: const Text(
                                      "Traveler Tote",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                          fontSize: 11),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    child: const Text(
                                      "\$ 195.00",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              child: InkWell(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                onTap: () {
                                  Navigator.of(context).push(_createRoute());
                                },
                                child: const Image(
                                    fit: BoxFit.fitWidth,
                                    width: 160,
                                    height: 160,
                                    image: AssetImage(
                                      'assets/images/handbag.jpg',
                                    )),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              child: Column(
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    child: const Text(
                                      "The Marc Jacob",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    child: const Text(
                                      "Traveler Tote",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                          fontSize: 11),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    child: const Text(
                                      "\$ 195.00",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              child: InkWell(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                onTap: () {
                                  Navigator.of(context).push(_createRoute());
                                },
                                child: const Image(
                                    fit: BoxFit.fitWidth,
                                    width: 160,
                                    height: 160,
                                    image: AssetImage(
                                      'assets/images/handbag.jpg',
                                    )),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              child: Column(
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    child: const Text(
                                      "The Marc Jacob",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    child: const Text(
                                      "Traveler Tote",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                          fontSize: 11),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    child: const Text(
                                      "\$ 195.00",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ]),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const ScrDetailItem(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
