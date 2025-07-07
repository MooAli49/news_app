import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/news/controller/news_state.dart';
import 'package:news_app/features/news/services/news_api.dart';

// Cubit
class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  final NewsApi _newsApi = NewsApi();

  // For latest news section
  Future<void> fetchLatestNews() async {
    try {
      log('NewsCubit: Starting fetchLatestNews', name: 'NewsCubit');
      emit(NewsLoading());
      log('NewsCubit: Emitted NewsLoading', name: 'NewsCubit');

      final response = await _newsApi.fetchLatestNews();
      log('NewsCubit: Got response from API', name: 'NewsCubit');

      response.fold(
        (newsList) {
          log(
            'NewsCubit: Success - Got ${newsList.length} articles',
            name: 'NewsCubit',
          );
          if (newsList.isNotEmpty) {
            emit(NewsLoaded(newsList));
            log(
              'NewsCubit: Emitted NewsLoaded with ${newsList.length} articles',
              name: 'NewsCubit',
            );
          } else {
            emit(NewsError('No latest news available'));
            log(
              'NewsCubit: Emitted NewsError - No articles',
              name: 'NewsCubit',
            );
          }
        },
        (error) {
          log('NewsCubit: Error - $error', name: 'NewsCubit');
          emit(NewsError(error.toString()));
        },
      );
    } catch (e) {
      log('NewsCubit: Exception - $e', name: 'NewsCubit');
      emit(NewsError('Failed to fetch latest news: $e'));
    }
  }

  // For category-based news
  Future<void> fetchCategoryNews(String category) async {
    try {
      log(
        'NewsCubit: Starting fetchCategoryNews for $category',
        name: 'NewsCubit',
      );
      emit(NewsLoading());
      log('NewsCubit: Emitted NewsLoading for category', name: 'NewsCubit');

      final response = await _newsApi.fetchTopHeadlines(category: category);
      log('NewsCubit: Got response from API for category', name: 'NewsCubit');

      response.fold(
        (newsList) {
          log(
            'NewsCubit: Success - Got ${newsList.length} articles for $category',
            name: 'NewsCubit',
          );
          if (newsList.isNotEmpty) {
            emit(NewsLoaded(newsList));
            log(
              'NewsCubit: Emitted NewsLoaded with ${newsList.length} articles for $category',
              name: 'NewsCubit',
            );
          } else {
            emit(NewsError('No news available for $category'));
            log(
              'NewsCubit: Emitted NewsError - No articles for $category',
              name: 'NewsCubit',
            );
          }
        },
        (error) {
          log('NewsCubit: Error for category - $error', name: 'NewsCubit');
          emit(NewsError(error.toString()));
        },
      );
    } catch (e) {
      log('NewsCubit: Exception for category - $e', name: 'NewsCubit');
      emit(NewsError('Failed to fetch category news: $e'));
    }
  }
}
