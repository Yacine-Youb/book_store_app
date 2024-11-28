class BookData {
  final String title;
  final String author;
  final String description;
  final double rating;
  final double price;
  int quantite;
  final String imageUrl;

  BookData({
    required this.title,
    required this.author,
    required this.description,
    required this.rating,
    required this.price,
    required this.imageUrl,
    this.quantite = 1,
  });

  void increment() {
    quantite++;
  }

  void decrement() {
    if (quantite > 1) {
      quantite--;
    }
  }

  double priceIncrement() {
    double result = price * quantite;
    return double.parse(result.toStringAsFixed(2));
  }

  // Override equality and hashCode
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookData && other.title == title;
  }

  @override
  int get hashCode => title.hashCode;
}
