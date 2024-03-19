import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:photo_proj/features/daily_news/domain/entities/article_entity.dart';

abstract class ArticleState extends Equatable {

  final ArticleEntity ? articles;
  final DioException ? exception;

  const ArticleState({this.articles, this.exception});

  @override
  List<Object> get props => [articles!, exception!];
}

class ArticleLoading extends ArticleState {

  const ArticleLoading();
}

class ArticleDone extends ArticleState {

  const ArticleDone(ArticleEntity articles) : super(articles: articles);
}

class ArticleException extends ArticleState {

  const ArticleException(DioException exception) : super(exception: exception);
}