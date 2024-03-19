import 'package:photo_proj/core/resources/data_state.dart';
import 'package:photo_proj/features/daily_news/domain/entities/article_entity.dart';

abstract class ArticleRepository {

  Future<DataState<ArticleEntity>> getNewsArticles();
}

