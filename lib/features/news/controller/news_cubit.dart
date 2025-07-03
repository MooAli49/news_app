import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/news/controller/news_state.dart';
import 'package:news_app/features/news/services/news_api.dart';

// Cubit
class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  final NewsApi _newsApi = NewsApi();

  Future<void> fetchNews({
    String category = 'general',
    String country = 'us',
  }) async {
    emit(NewsLoading());
    final response = await _newsApi.fetchNews(
      country: country,
      category: category,
    );
    response.fold(
      (newsList) {
        emit(NewsLoaded(newsList));
      },
      (error) {
        emit(NewsError(error.toString()));
      },
    );
  }
}
