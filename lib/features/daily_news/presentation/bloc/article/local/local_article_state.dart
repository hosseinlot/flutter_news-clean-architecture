import 'package:news_app/features/daily_news/domain/entities/article.dart';

abstract class LocalArticleState {}

class LocalArticlesLoading extends LocalArticleState {}

class LocalArticlesDone extends LocalArticleState {
  final List<ArticleEntity> articles;
  LocalArticlesDone(this.articles);
}

class LocalArticleBookmark extends LocalArticleState {
  final String bookmarkMesssage;
  LocalArticleBookmark(this.bookmarkMesssage);
}
