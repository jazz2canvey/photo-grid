import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:photo_proj/features/daily_news/data/data_sources/news_api_service.dart';
import 'package:photo_proj/features/daily_news/data/repository/article_repo_implementation.dart';
import 'package:photo_proj/features/daily_news/domain/repository/article_repository.dart';
import 'package:photo_proj/features/daily_news/domain/usecases/get_article_use_case.dart';
import 'package:photo_proj/features/daily_news/presentation/bloc/article_bloc.dart';

final di = GetIt.instance;

Future<void> initializeDependencies() async {

  di.registerSingleton<Dio>(Dio());

  di.registerSingleton<NewsApiService>(NewsApiService(di()));

  di.registerSingleton<ArticleRepository>(ArticleRepoImplementation(di()));

  di.registerSingleton<GetArticleUseCase>(GetArticleUseCase(di()));

  di.registerSingleton<ArticleBloc>(ArticleBloc(di()));
}