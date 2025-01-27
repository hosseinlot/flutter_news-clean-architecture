import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  // API methods
  Future<DataState<List<ArticleEntity>>> getNewsArticles();

  // Floor methods
  Future<List<ArticleEntity>> getSavedArticles();

  Future<String> toggleBookmark(ArticleEntity article);

  // Future<void> saveArticle(ArticleEntity article);

  // Future<void> removeArticle(ArticleEntity article);
}
