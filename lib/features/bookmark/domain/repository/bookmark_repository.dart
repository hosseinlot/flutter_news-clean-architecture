import 'package:news_app/features/daily_news/domain/entities/article.dart';

abstract class BookmarkRepository {
  // Floor methods
  Future<List<ArticleEntity>> getSavedArticles();

  Future<String> toggleBookmark(ArticleEntity article);
}
