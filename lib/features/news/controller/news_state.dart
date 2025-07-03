import 'package:news_app/core/model/news_model.dart';

sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

final class NewsLoaded extends NewsState {
  final List<NewsModel> newsList;

  NewsLoaded(this.newsList);
}

final class NewsError extends NewsState {
  final String errorMessage;

  NewsError(this.errorMessage);
}
