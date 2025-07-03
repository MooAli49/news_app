import 'package:flutter/material.dart';
import 'package:news_app/core/style/app_styles.dart';
import 'package:news_app/core/theme/colors_manger.dart';
import 'package:news_app/features/news/screens/details_screen.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailsScreen()),
          ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: ColorsManger.greyColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/images/test_news.png',
              fit: BoxFit.cover,
              height: 80,
              width: 80,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Crystals dancing to the tune of light might replace batteries',
                    style: AppStyles.font14Weight600,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'By John Doe',
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
