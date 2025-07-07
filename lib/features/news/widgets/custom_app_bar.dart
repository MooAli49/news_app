import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/style/app_styles.dart';
import 'package:news_app/core/theme/colors_manger.dart';
import 'package:news_app/core/theme/theme_cubit.dart';

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
          IconButton(
            icon: Icon(
              Icons.dark_mode,
              size: 30,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {
              final themeCubit = context.read<ThemeCubit>();
              themeCubit.toggleTheme();
            },
          ),
        ],
      ),
    );
  }
}
