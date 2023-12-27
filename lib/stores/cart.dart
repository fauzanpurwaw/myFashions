import 'package:latihan_dua/album/cart_item.dart';

List<CartItem> cartItems = [];

void addItem(CartItem value) {
  var isDeclared = false;
  cartItems.forEach((element) {
    if (element.id == value.id) {
      isDeclared = true;
    }
  });

  if (isDeclared) {
    cartItems.add(value);
  } else {
    updateItemQty(value.id, value.qty);
  }
}

void deleteItem(id) {
  for (int i = 0; i < cartItems.length; i++) {
    if (cartItems[i].id == id) {
      cartItems.removeAt(i);
    }
  }
}

void updateItemQty(id, int qty) {
  for (int i = 0; i < cartItems.length; i++) {
    if (cartItems[i].id == id) {
      cartItems[i].qty += qty;
    }
  }
}
