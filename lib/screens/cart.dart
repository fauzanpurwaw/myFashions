import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:latihan_dua/album/cart_item.dart';
import 'package:latihan_dua/stores/cart.dart';
// import 'package:latihan_dua/controllers/cart_controller.dart' as cartController;
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    super.key,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int stockCounter = 1;
  int price = 198;

  final numFormat = NumberFormat("#,##0.00", "en_US");

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 680),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      child: const Text(
                        "My Cart",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: cartItems!.isEmpty
                          ? const Visibility(
                              child: Center(
                                child: Text('data not found'),
                              ),
                            )
                          : ListView(
                              children: List.generate(
                                cartItems.length,
                                (index) => Container(
                                  height: 100,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: const BoxDecoration(border: Border()),
                                  child: Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                width: 60,
                                                margin: const EdgeInsets.only(
                                                    right: 20),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10)),
                                                  child: InkWell(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                    child: Image(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                          cartItems[index]
                                                              .thumbnail,
                                                        )),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            cartItems[index]
                                                                .title,
                                                            style: const TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            cartItems[index]
                                                                .category,
                                                            style: const TextStyle(
                                                              fontSize: 10,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Text(
                                                      "\$${numFormat.format(
                                                              cartItems[index]
                                                                      .price *
                                                                  cartItems[
                                                                          index]
                                                                      .qty)}",
                                                      style: const TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                        Icons.remove_circle)),
                                                Container(
                                                  width: 80,
                                                  height: 20,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10),
                                                  decoration:
                                                      const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          25)),
                                                          color: Color.fromARGB(
                                                              255,
                                                              223,
                                                              222,
                                                              222)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            if (stockCounter !=
                                                                1) {
                                                              stockCounter--;
                                                            }
                                                          });
                                                        },
                                                        child: const Text("-"),
                                                      ),
                                                      Text(stockCounter
                                                          .toString()),
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            if (stockCounter !=
                                                                15) {
                                                              stockCounter++;
                                                            }
                                                          });
                                                        },
                                                        child: const Text("+"),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Container(
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Subtotal:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      "\$296",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Shipping:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      "\$17",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Subtotal:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: const Text(
                                            "(2 items)",
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16,
                                                color: Colors.grey),
                                          ),
                                        ),
                                        const Text(
                                          "\$413",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: InkWell(
                            onTap: () {
                              CartItem item = CartItem(
                                  id: 1,
                                  title: "title",
                                  category: "category",
                                  qty: 1,
                                  thumbnail: "assets/images/handbag.jpg",
                                  price: 1);
                              setState(() {
                                addItem(item);
                              });
                              print(cartItems);
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              margin: const EdgeInsets.only(bottom: 20),
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.black,
                              ),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Proceed to Checkout",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                  Icon(
                                    Icons.chevron_right_rounded,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }
}
