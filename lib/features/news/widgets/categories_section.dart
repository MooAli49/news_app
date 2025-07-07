import 'package:flutter/material.dart';
import 'package:news_app/core/style/app_styles.dart';
import 'package:news_app/core/theme/colors_manger.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
    required this.categories,
  });
  final String selectedCategory;
  final Function(String) onCategorySelected;
  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Row(
            children: [
              Container(
                width: 4,
                height: 16,
                decoration: BoxDecoration(
                  color: ColorsManger.yellowColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Categories',
                style: AppStyles.font16Weight800Blue.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        // Categories List
        SizedBox(
          height: 45,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              final isCategorySelected = selectedCategory == category;

              return Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color:
                        isCategorySelected
                            ? ColorsManger.yellowColor
                            : ColorsManger.whiteColor,
                    borderRadius: BorderRadius.circular(25.0),
                    border: Border.all(
                      color:
                          isCategorySelected
                              ? ColorsManger.yellowColor
                              : ColorsManger.lightGreyColor,
                      width: 1.5,
                    ),
                    boxShadow:
                        isCategorySelected
                            ? [
                              BoxShadow(
                                color: ColorsManger.yellowColor.withOpacity(
                                  0.3,
                                ),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                                spreadRadius: 0,
                              ),
                            ]
                            : [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 4,
                                offset: const Offset(0, 1),
                                spreadRadius: 0,
                              ),
                            ],
                  ),
                  child: GestureDetector(
                    onTap: () {
                      onCategorySelected(category);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (isCategorySelected) ...[
                          Icon(
                            Icons.check_circle,
                            size: 14,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 6),
                        ],
                        Text(
                          _capitalizeFirst(category),
                          style:
                              isCategorySelected
                                  ? AppStyles.font12Weight800White.copyWith(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  )
                                  : AppStyles.font14Weight600.copyWith(
                                    color: ColorsManger.darkGreyColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  String _capitalizeFirst(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }
}
