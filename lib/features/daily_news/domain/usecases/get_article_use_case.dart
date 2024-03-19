import 'package:photo_proj/core/resources/data_state.dart';
import 'package:photo_proj/core/usecases/usecase.dart';
import 'package:photo_proj/features/daily_news/domain/entities/article_entity.dart';
import 'package:photo_proj/features/daily_news/domain/repository/article_repository.dart';

class GetArticleUseCase implements UseCase {

  final ArticleRepository _articleRepository;
  
  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<ArticleEntity>> call({void params}) async {

    DataState<ArticleEntity> dataState =  await _articleRepository.getNewsArticles();

    print("_articleRepository.getNewsArticles(): ${dataState.data}");

    return _articleRepository.getNewsArticles();
  }

}