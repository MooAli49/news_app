import 'package:flutter/material.dart';
import 'package:news_app/widgets/categories_section.dart';
import 'package:news_app/widgets/custom_app_bar.dart';
import 'package:news_app/widgets/custom_search_bar.dart';
import 'package:news_app/widgets/latest_news_section.dart';
import 'package:news_app/widgets/news_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0,
            ),
            child: Column(
              children: [
                const CustomAppBar(),
                const SizedBox(height: 20),
                const CustomSearchBar(),
                const SizedBox(height: 20),
                const LatestNewsSection(),
                const SizedBox(height: 20),
                const CategoriesSection(),
                const SizedBox(height: 20),
                const NewsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
