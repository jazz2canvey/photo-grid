import 'package:flutter_test/flutter_test.dart';
import 'package:photo_proj/core/utils/injection_container.dart';
import 'package:photo_proj/features/daily_news/data/repository/article_repo_implementation.dart';

void main() {

  test("api execution test", () {

    initializeDependencies();
    ArticleRepoImplementation(di()).getNewsArticles().then((value) {

      expect(value.data!.status, "ok");
    });

  });
}