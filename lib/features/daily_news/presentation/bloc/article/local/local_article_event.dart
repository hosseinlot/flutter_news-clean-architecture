import 'package:news_app/features/daily_news/domain/entities/article.dart';

abstract class LocalArticleEvent {}

class GetSavedArticlesEvent extends LocalArticleEvent {}

class SaveArticleEvent extends LocalArticleEvent {
  final ArticleEntity article;
  SaveArticleEvent(this.article);
}

class RemoveSavedArticleEvent extends LocalArticleEvent {
  final ArticleEntity article;
  RemoveSavedArticleEvent(this.article);
}
