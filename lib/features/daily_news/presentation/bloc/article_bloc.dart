import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_proj/core/resources/data_state.dart';
import 'package:photo_proj/features/daily_news/data/models/article_model.dart';
import 'package:photo_proj/features/daily_news/domain/entities/article_entity.dart';
import 'package:photo_proj/features/daily_news/domain/usecases/get_article_use_case.dart';
import 'package:photo_proj/features/daily_news/presentation/bloc/article_state.dart';
import 'package:photo_proj/features/daily_news/presentation/bloc/articles_event.dart';

class ArticleBloc extends Bloc<ArticlesEvent, ArticleState> {

  final GetArticleUseCase _getArticleUseCase;

  ArticleBloc(this._getArticleUseCase) : super(const ArticleLoading()) {

    print("first call");

    on<GetArticles> (onGetArticles);
  }

  void onGetArticles(GetArticles event, Emitter<ArticleState> emitter) async {

    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data != null) {

      print("Data: ${dataState.data}");

      emitter(ArticleDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emitter(ArticleException(dataState.dioException!));
    }

  }

}