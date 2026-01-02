class PortfolioItem {
  final String title;
  final String description;
  final String? imagePath;
  final String category;
  final List<String> tags;
  final String? url;

  PortfolioItem({
    required this.title,
    required this.description,
    this.imagePath,
    required this.category,
    this.tags = const [],
    this.url,
  });

  // Factory method untuk membuat dari JSON
  factory PortfolioItem.fromJson(Map<String, dynamic> json) {
    return PortfolioItem(
      title: json['title'] as String,
      description: json['description'] as String,
      imagePath: json['imagePath'] as String?,
      category: json['category'] as String,
      tags: (json['tags'] as List<dynamic>?)?.cast<String>() ?? [],
      url: json['url'] as String?,
    );
  }

  // Convert ke JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'imagePath': imagePath,
      'category': category,
      'tags': tags,
      'url': url,
    };
  }
}
