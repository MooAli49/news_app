import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/news/controller/news_cubit.dart';
import 'package:news_app/features/news/controller/news_state.dart';
import 'package:news_app/features/news/widgets/news_item.dart';

class NewsSection extends StatelessWidget {
  const NewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NewsError) {
          return _newsError(state);
        } else if (state is NewsLoaded) {
          return _newsLoaded(state);
        }
        return const Center(child: Text('No news available'));
      },
    );
  }

  Center _newsError(NewsError state) {
    return Center(
      child: Text(
        state.errorMessage,
        style: const TextStyle(color: Colors.red),
      ),
    );
  }

  Widget _newsLoaded(NewsLoaded state) {
    final newsList = state.newsList;
    if (newsList.isEmpty) {
      return const Center(child: Text('No news available'));
    }

    return ListView.builder(
      itemCount: newsList.length,
      physics: const NeverScrollableScrollPhysics(),
      // shrinkWrap: true,
      itemBuilder: (context, index) {
        return NewsItem(news: newsList[index]);
      },
    );
  }
}
