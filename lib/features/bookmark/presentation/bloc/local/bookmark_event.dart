import 'package:news_app/features/daily_news/domain/entities/article.dart';

abstract class BookmarkEvent {}

class GetSavedArticlesEvent extends BookmarkEvent {}

class BookmarkArticleEvent extends BookmarkEvent {
  final ArticleEntity article;
  BookmarkArticleEvent(this.article);
}

class RemoveSavedArticleEvent extends BookmarkEvent {
  final ArticleEntity article;
  RemoveSavedArticleEvent(this.article);
}
