import 'package:flutter/material.dart';
import 'package:news_app/core/model/news_model.dart';
import 'package:news_app/core/style/app_styles.dart';
import 'package:news_app/features/news/widgets/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.news});
  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CustomAppBar(
                isDeatailsScreen: true, // Pass true to indicate details screen
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        news.title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            news.author,
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          const Spacer(),
                          Text(
                            news.publishedAt,
                            style: AppStyles.font9Weight800Yellow,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Image.network(
                        news.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (context, error, stackTrace) => Image.network(
                              'https://i.quotev.com/b2gtjqawaaaa.jpg',
                              fit: BoxFit.cover,
                            ),
                      ),
                      const SizedBox(height: 20),
                      Text(news.description, style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
