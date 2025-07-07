import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/theme/theme_cubit.dart';
import 'package:news_app/features/news/controller/news_cubit.dart';
import 'package:news_app/features/news/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(
          create:
              (_) =>
                  NewsCubit()
                    ..fetchLatestNews()
                    ..fetchCategoryNews('general'),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
