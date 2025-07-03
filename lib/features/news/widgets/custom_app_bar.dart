import 'package:flutter/material.dart';
import 'package:news_app/core/style/app_styles.dart';
import 'package:news_app/core/theme/colors_manger.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.isDeatailsScreen = false});
  final bool isDeatailsScreen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          isDeatailsScreen
              ? IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: ColorsManger.darkGreyColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
              : Image.asset(
                'assets/images/grid_icon.png',
                fit: BoxFit.cover,
                height: 30,
              ),
          const Spacer(),
          const Text('News', style: AppStyles.font17Weight800Red),
          const Spacer(),
          Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(
                Icons.notifications,
                size: 30,
                color: ColorsManger.darkGreyColor,
              ),
              Positioned(
                right: 0,
                top: 13,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorsManger.blackColor,
                      width: 1.5,
                    ),
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    '3',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: ColorsManger.redColor,
                      fontFamily: AppStyles.fontFamily,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
