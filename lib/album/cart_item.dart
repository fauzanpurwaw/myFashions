class CartItem {
  final int id;
  final String title;
  final String category;
  int qty;
  final String thumbnail;
  final int price;

  CartItem({
    required this.id,
    required this.title,
    required this.category,
    required this.qty,
    required this.thumbnail,
    required this.price,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      qty: json['qty'],
      thumbnail: json['thumbnail'],
      price: json['price'],
    );
  }
}
