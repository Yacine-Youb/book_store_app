class BookData {
  final String title;
  final String author;
  final String description;
  final double rating;
  final double price;
  final String imageUrl;
  final String category;

  const BookData({
    required this.title,
    required this.author,
    required this.description,
    required this.rating,
    required this.price,
    required this.imageUrl,
    this.category = 'General',
  });

  // Override equality and hashCode
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookData && other.title == title;
  }

  @override
  int get hashCode => title.hashCode;
}
