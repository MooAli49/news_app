import 'package:flutter/material.dart';
import 'package:news_app/core/model/news_model.dart';
import 'package:news_app/core/style/app_styles.dart';
import 'package:news_app/core/theme/colors_manger.dart';
import 'package:news_app/features/news/screens/details_screen.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.news});
  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailsScreen(
              news:news,
            )),
          ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
        child: Row(
          children: [
            Image.network(
              news.imageUrl,
              fit: BoxFit.cover,
              height: 80,
              width: 80,
              errorBuilder:
                  (context, error, stackTrace) => Image.network(
                    'https://i.quotev.com/b2gtjqawaaaa.jpg',
                    fit: BoxFit.cover,
                    height: 80,
                    width: 80,
                  ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.font14Weight600,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    news.author,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.font9Weight800.copyWith(
                      color: ColorsManger.lightGreyColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
