class Category {
  final int id;
  final String title;
  final String category;

  Category({
    required this.id,
    required this.title,
    required this.category,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      title: json['title'],
      category: json['category'],
    );
  }
}
