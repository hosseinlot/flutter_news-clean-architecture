import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';

abstract class ArticleState extends Equatable {
  // final List<ArticleEntity>? articles;
  // final DioException? error;

  // const RemoteArticleState({this.articles, this.error});
  // List<Object?> get props => [articles!, error!];

  @override
  List<Object?> get props => throw UnimplementedError();
}

class RemoteArticlesLoading extends ArticleState {}

class RemoteArticlesDone extends ArticleState {
  final List<ArticleEntity> articles;
  RemoteArticlesDone(this.articles);
}

class RemoteArticlesError extends ArticleState {
  final DioException error;
  RemoteArticlesError(this.error);
}
