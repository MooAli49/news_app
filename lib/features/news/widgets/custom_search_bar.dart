import 'package:flutter/material.dart';
import 'package:news_app/core/style/app_styles.dart';
import 'package:news_app/core/theme/colors_manger.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorsManger.whiteColor,
          hintText: 'Search',
          hintStyle: AppStyles.font16Weight500.copyWith(
            color: ColorsManger.lightGreyColor,
          ),
          prefixIcon: Icon(
            Icons.search,
            size: 30,
            color: ColorsManger.lightGreyColor,
          ),
          suffixIcon: IconButton(
            iconSize: 30,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                ColorsManger.yellowColor,
              ),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35.0),
                ),
              ),
            ),
            onPressed: () {},
            icon: Icon(Icons.arrow_right_alt, color: ColorsManger.whiteColor),
            color: ColorsManger.lightGreyColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
