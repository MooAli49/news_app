class NewsModel {
  final String id;
  final String title;
  final String description;
  final String content;
  final String imageUrl;
  final String author;
  final String publishedAt;
  final String url;

  NewsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.imageUrl,
    required this.author,
    required this.publishedAt,
    required this.url,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    // Safely extract source information
    final source = json['source'];
    String sourceId = 'Unknown ID';
    if (source != null && source is Map<String, dynamic>) {
      sourceId = source['id'] ?? source['name'] ?? 'Unknown ID';
    }

    // Safely extract other fields with proper null handling
    return NewsModel(
      id: sourceId,
      title: json['title']?.toString() ?? 'No Title',
      description:
          json['description']?.toString() ?? 'No description available',
      imageUrl: json['urlToImage']?.toString() ?? '',
      author: json['author']?.toString() ?? 'Unknown Author',
      publishedAt: json['publishedAt']?.toString() ?? '',
      url: json['url']?.toString() ?? '',
      content: json['content']?.toString() ?? 'No content available',
    );
  }

  // Add a method to check if the news item is valid
  bool get isValid => title.isNotEmpty && title != 'No Title';
  // Temporarily removed description check to debug
  // description.isNotEmpty &&
  // description != 'No description available';
}
