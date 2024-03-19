import 'package:equatable/equatable.dart';

/*class ArticleEntity extends Equatable {

  final String ? id;
  final String ? author;
  final String ? title;
  final String ? description;
  final String ? url;
  final String ? urlToImage;
  final String ? publishedAt;
  final String ? content;

  const ArticleEntity({
      this.id,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, author, title, description, url, urlToImage, publishedAt, content];
}*/

class ArticleEntity extends Equatable {
  final String status;
  final int totalResults;
  final List<ArticleSourceEntity> articles;

  const ArticleEntity({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [status, totalResults, articles];
}

class ArticleSourceEntity {
  SourceEntity source;
  String? author;
  String title;
  String? description;
  String url;
  String? urlToImage;
  DateTime publishedAt;
  String? content;

  ArticleSourceEntity({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });
}

class SourceEntity {
  String? id;
  String name;

  SourceEntity({
    required this.id,
    required this.name,
  });
}
