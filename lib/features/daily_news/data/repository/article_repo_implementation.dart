import 'dart:io';

import 'package:dio/dio.dart';
import 'package:photo_proj/core/constants/constants.dart';
import 'package:photo_proj/core/resources/data_state.dart';
import 'package:photo_proj/features/daily_news/data/data_sources/news_api_service.dart';
import 'package:photo_proj/features/daily_news/domain/repository/article_repository.dart';

import '../models/article_model.dart';

class ArticleRepoImplementation extends ArticleRepository {

  final NewsApiService _newsApiService;

  ArticleRepoImplementation(this._newsApiService);

  @override
  Future<DataState<ArticleModel>> getNewsArticles() async {
    // TODO: implement getNewsArticles

    print("Fourth call");

    try {

      final httpResponse = await _newsApiService.getNewsArticles(apiKey: apiKey, q: q, from: from, sortBy: sortBy);

      if (httpResponse.response.statusCode == HttpStatus.ok) {

        return DataSuccess(httpResponse.data);

      } else {

        return DataFailed(
            DioException(
                error: httpResponse.response.statusMessage,
                response: httpResponse.response,
                type: DioExceptionType.badResponse,
                requestOptions: httpResponse.response.requestOptions
            )
        );
      }

    } on DioException catch (e) {

      return DataFailed(e);
    }

  }

}