import 'package:flutter/material.dart';
import 'package:news_app/core/style/app_styles.dart';
import 'package:news_app/core/theme/colors_manger.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      'general',
      'business',
      'entertainment',
      'health',
      'science',
      'sports',
      'technology',
    ];

    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                color: ColorsManger.whiteColor,
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(color: ColorsManger.lightGreyColor),
              ),
              alignment: Alignment.center,
              child: Text(
                categories[index],
                style: AppStyles.font14Weight600.copyWith(
                  color: ColorsManger.darkGreyColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
