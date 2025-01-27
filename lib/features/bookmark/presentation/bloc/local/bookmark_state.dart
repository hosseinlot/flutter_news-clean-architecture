import 'package:news_app/features/daily_news/domain/entities/article.dart';

abstract class BookmarkState {}

class LocalArticlesLoading extends BookmarkState {}

class LocalArticlesDone extends BookmarkState {
  final List<ArticleEntity> articles;
  LocalArticlesDone(this.articles);
}

class LocalArticleBookmark extends BookmarkState {
  final String bookmarkMesssage;
  LocalArticleBookmark(this.bookmarkMesssage);
}
