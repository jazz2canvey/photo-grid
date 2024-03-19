import 'package:dio/dio.dart';
import 'package:photo_proj/core/constants/constants.dart';
import 'package:photo_proj/features/daily_news/data/models/article_model.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class NewsApiService {

  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET(everything)
  Future<HttpResponse<ArticleModel>> getNewsArticles({
    @Query("q") String ? q,
    @Query("from") String ? from,
    @Query("sortBy") String ? sortBy,
    @Query("apiKey") String ? apiKey,
  });
}