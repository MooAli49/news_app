import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app/core/model/news_model.dart';

class NewsApi {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://newsapi.org/v2/',
      connectTimeout: Duration(seconds: 7),
      receiveTimeout: Duration(seconds: 7),
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            '3041d7b32cc94df0a59e13bbcb839fa3',
      },
    ),
  );

  Future<Either<List<NewsModel>, String>> fetchGeneral() async {
    try {
      final response = await _dio.get(
        'everything',
        queryParameters: {'pageSize': 20, 'pageCount': 1, 'country': 'us'},
      );
      log('Response: ${response.data}', name: 'NewsApi');

      final List<dynamic> articles = response.data['articles'];
      final List<NewsModel> newsList =
          articles.map((article) => NewsModel.fromJson(article)).toList();
      return Left(newsList);
    } catch (e) {
      return Right('Failed to load top headlines: $e');
    }
  }

  Future<Either<List<NewsModel>, String>> fetchTopHeadlines({
    String category = 'general',
  }) async {
    try {
      final response = await _dio.get(
        'top-headlines',
        queryParameters: {'country': 'us', 'category': category},
      );
      log('Response: ${response.data}', name: 'NewsApi');

      final List<dynamic> articles = response.data['articles'];
      final List<NewsModel> newsList =
          articles.map((article) => NewsModel.fromJson(article)).toList();
      return Left(newsList);
    } catch (e) {
      return Right('Failed to load top headlines: $e');
    }
  }
}
