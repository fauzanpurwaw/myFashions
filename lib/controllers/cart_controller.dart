import 'package:flutter/material.dart';
import 'package:latihan_dua/album/cart_item.dart';

class MyCart extends ChangeNotifier {
  List<CartItem> cartList;

  MyCart({
    this.cartList = const [],
  });

  void addItem(CartItem value) {
    var isDeclared = false;
    for (var element in cartList) {
      if (element.id == value.id) {
        isDeclared = true;
      }
    }

    if (isDeclared) {
      cartList.add(value);
    } else {
      updateItemQty(value.id, value.qty);
    }

    notifyListeners();
  }

  void deleteItem(id) {
    for (int i = 0; i < cartList.length; i++) {
      if (cartList[i].id == id) {
        cartList.removeAt(i);
      }
    }

    notifyListeners();
  }

  void updateItemQty(id, int qty) {
    for (int i = 0; i < cartList.length; i++) {
      if (cartList[i].id == id) {
        cartList[i].qty += qty;
      }
    }

    notifyListeners();
  }
}
