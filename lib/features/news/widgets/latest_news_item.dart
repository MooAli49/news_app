import 'package:flutter/material.dart';
import 'package:news_app/core/style/app_styles.dart';
import 'package:news_app/core/theme/colors_manger.dart';

class LatestNewsItem extends StatelessWidget {
  const LatestNewsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
    margin: const EdgeInsets.only(left: 10.0),
    width: MediaQuery.of(context).size.width * 0.75,
    height: 200,
    decoration: BoxDecoration(
      color: ColorsManger.greyColor,
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: Column(
      children: [
        Image.asset(
          'assets/images/test_news.png',
          fit: BoxFit.cover,
          height: 120,
          width: double.infinity,
          // width: 150,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Crystals dancing to the tune of light might replace batteries',
            style: AppStyles.font14Weight600,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'By John Doe',
                style: AppStyles.font9Weight800.copyWith(
                  color: ColorsManger.lightGreyColor,
                ),
              ),
              Text('2 min read', style: AppStyles.font9Weight800Yellow),
            ],
          ),
        ),
      ],
    ),
  );
  }
}