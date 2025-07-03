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
    return NewsModel(
      id: json['source']['id'] ?? json['source']['name'] ?? 'Unknown ID',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['urlToImage'] ?? '',
      author: json['author'] ?? 'Unknown Author',
      publishedAt: json['publishedAt'] ?? '',
      url: json['url'] ?? 'Invalid URL',
      content: json['content'] ?? 'No content available',
    );
  }
}
