import 'package:news_app/features/bookmark/data/data_sources/local/DAO/app_database.dart';
import 'package:news_app/features/bookmark/domain/repository/bookmark_repository.dart';
import 'package:news_app/features/daily_news/data/models/article.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';

class BookmarkRepositoryImpl implements BookmarkRepository {
  final AppDatabase _appDatabase;

  BookmarkRepositoryImpl(this._appDatabase);

  @override
  Future<List<ArticleModel>> getSavedArticles() async {
    return _appDatabase.articleDAO.getArticles();
  }

  @override
  Future<String> toggleBookmark(ArticleEntity article) async {
    // Check if article exists
    final existingArticle = await _appDatabase.articleDAO.getArticleByUrl(article.url!);

    if (existingArticle != null) {
      // remove bookmark
      await _appDatabase.articleDAO.deleteArticle(ArticleModel.fromEntity(article));
      return 'Bookmarked removed successfully';
    } else {
      // add bookmark
      await _appDatabase.articleDAO.insertArticle(ArticleModel.fromEntity(article));
      return 'Article bookmarked successfully';
    }
  }
}
