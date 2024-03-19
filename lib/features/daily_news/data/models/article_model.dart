import 'package:photo_proj/features/daily_news/domain/entities/article_entity.dart';

class ArticleModel extends ArticleEntity {

  const ArticleModel({required super.status, required super.totalResults, required super.articles});

  factory ArticleModel.fromJson(Map<String, dynamic> map) => ArticleModel(
    status: map['status'],
    totalResults: map['totalResults'],
    articles: List<ArticleListModel>.from(map["articles"].map((x) => ArticleListModel.fromJson(x))),
//    articles: List<ArticleListModel>.from(map["articles"].map((Map<String, dynamic> map) => ArticleListModel.fromJson(map))),
  );
}

class ArticleListModel extends ArticleSourceEntity {

  ArticleListModel({required super.source, required super.author, required super.title, required super.description, required super.url, required super.urlToImage, required super.publishedAt, required super.content});

  factory ArticleListModel.fromJson(Map<String, dynamic> map) => ArticleListModel(
    source: SourceModel.fromJson(map["source"]),
    author: map['author'],
    title: map['title'],
    description: map['description'],
    url: map['url'],
    urlToImage: map['urlToImage'],
    publishedAt: DateTime.parse(map["publishedAt"]),
    content: map['content'],
  );
}

class SourceModel extends SourceEntity {

  SourceModel({required super.id, required super.name});

  factory SourceModel.fromJson(Map<String, dynamic> map) => SourceModel(
    id: map['id'],
    name: map['name'],
  );
}
