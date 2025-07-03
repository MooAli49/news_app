import 'package:flutter/material.dart';
import 'package:news_app/core/style/app_styles.dart';
import 'package:news_app/features/news/widgets/latest_news_item.dart';

class LatestNewsSection extends StatelessWidget {
  const LatestNewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Latest News', style: AppStyles.font16Weight800Blue),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) => LatestNewsItem(),
          ),
        ),
      ],
    );
  }
}
