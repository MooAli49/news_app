import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_item.dart';

class NewsSection extends StatelessWidget {
  const NewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) => NewsItem(),
    );
  }
}
