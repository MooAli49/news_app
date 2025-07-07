import 'dart:developer';
import 'dart:math' as math;

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app/core/model/news_model.dart';

class NewsApi {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://newsapi.org/v2/',
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'X-API-Key': '3041d7b32cc94df0a59e13bbcb839fa3',
      },
    ),
  );

  Future<Either<List<NewsModel>, String>> fetchLatestNews() async {
    try {
      final response = await _dio.get(
        'everything',
        queryParameters: {
          'q': 'news',
          'pageSize': 20,
          'language': 'en',
          'sortBy': 'publishedAt',
        },
      );

      if (response.statusCode != 200) {
        return Right('HTTP Error: ${response.statusCode}');
      }

      final data = response.data;
      final List<dynamic> articles = data['articles'] ?? [];
      log('Articles count: ${articles.length}', name: 'NewsApi');

      if (articles.isEmpty) {
        return Right('No articles found');
      }

      // Log first article structure for debugging
      if (articles.isNotEmpty) {
        log('First article keys: ${articles[0].keys}', name: 'NewsApi');
      }

      final List<NewsModel> newsList =
          articles
              .map((article) {
                try {
                  final newsModel = NewsModel.fromJson(article);
                  log(
                    'Successfully parsed article: ${newsModel.title.substring(0, math.min(50, newsModel.title.length))}',
                    name: 'NewsApi',
                  );
                  return newsModel;
                } catch (e) {
                  log('Error parsing article: $e', name: 'NewsApi');
                  log('Article data: $article', name: 'NewsApi');
                  return null;
                }
              })
              .where((news) => news != null && news.isValid)
              .cast<NewsModel>()
              .toList();

      log('Valid news count: ${newsList.length}', name: 'NewsApi');

      if (newsList.isEmpty) {
        return Right('No valid articles found');
      }

      log('Returning ${newsList.length} articles', name: 'NewsApi');
      return Left(newsList);
    } catch (e) {
      log('General API Error: $e', name: 'NewsApi');
      return Right('Failed to load general news: $e');
    }
  }

  Future<Either<List<NewsModel>, String>> fetchTopHeadlines({
    String category = 'general',
  }) async {
    try {
      final response = await _dio.get(
        'top-headlines',
        queryParameters: {
          'country': 'us',
          'category': category,
          'pageSize': 20,
        },
      );

      if (response.statusCode != 200) {
        return Right('HTTP Error: ${response.statusCode}');
      }

      final data = response.data;

      final List<dynamic> articles = data['articles'] ?? [];
      log('Articles count: ${articles.length}', name: 'NewsApi');

      if (articles.isEmpty) {
        return Right('No articles found for category: $category');
      }

      final List<NewsModel> newsList =
          articles
              .map((article) {
                try {
                  final newsModel = NewsModel.fromJson(article);
                  return newsModel;
                } catch (e) {
                  log('Error parsing article: $e', name: 'NewsApi');
                  log('Article data: $article', name: 'NewsApi');
                  return null;
                }
              })
              .where((news) => news != null && news.isValid)
              .cast<NewsModel>()
              .toList();

      log('Valid news count: ${newsList.length}', name: 'NewsApi');

      if (newsList.isEmpty) {
        return Right('No valid articles found for category: $category');
      }

      log(
        'Returning ${newsList.length} articles for category: $category',
        name: 'NewsApi',
      );
      return Left(newsList);
    } catch (e) {
      log('Top Headlines API Error: $e', name: 'NewsApi');
      return Right('Failed to load top headlines for $category: $e');
    }
  }
}
