import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/news/controller/news_cubit.dart';
import 'package:news_app/features/news/widgets/categories_section.dart';
import 'package:news_app/features/news/widgets/custom_app_bar.dart';
import 'package:news_app/features/news/widgets/custom_search_bar.dart';
import 'package:news_app/features/news/widgets/latest_news_section.dart';
import 'package:news_app/features/news/widgets/news_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = [
    'general',
    'business',
    'entertainment',
    'health',
    'science',
    'sports',
    'technology',
  ];
  String selectedCategory = 'general';

  void onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
    });
    context.read<NewsCubit>().fetchCategoryNews(category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: const CustomAppBar()),
              SliverToBoxAdapter(child: const SizedBox(height: 20)),
              SliverToBoxAdapter(child: const CustomSearchBar()),
              SliverToBoxAdapter(child: const SizedBox(height: 20)),
              SliverList(
                delegate: SliverChildListDelegate([LatestNewsSection()]),
              ),
              SliverToBoxAdapter(child: const SizedBox(height: 20)),
              SliverList(
                delegate: SliverChildListDelegate([
                  CategoriesSection(
                    categories: categories,
                    onCategorySelected: onCategorySelected,
                    selectedCategory: selectedCategory,
                  ),
                ]),
              ),
              SliverToBoxAdapter(child: const SizedBox(height: 20)),
              SliverFillViewport(
                delegate: SliverChildListDelegate([const NewsSection()]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
