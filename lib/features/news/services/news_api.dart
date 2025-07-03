import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app/core/model/news_model.dart';

class NewsApi {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://newsapi.org/v2/',
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 5),
      headers: {
        //TODO maybe remove it 'Content-Type': 'application/json',
        'Authorization':
            '3041d7b32cc94df0a59e13bbcb839fa3', // Replace with your actual API key
      },
    ),
  );

  Future<Either<List<NewsModel>, String>> fetchNews({
    String country = 'us',
    String category = 'general',
  }) async {
    try {
      final response = await _dio.get(
        'top-headlines',
        queryParameters: {'country': country, 'category': category},
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
