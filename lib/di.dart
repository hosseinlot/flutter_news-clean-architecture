import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/features/bookmark/data/data_sources/local/DAO/app_database.dart';
import 'package:news_app/features/bookmark/data/repository/bookmark_repository_impl.dart';
import 'package:news_app/features/bookmark/domain/repository/bookmark_repository.dart';
import 'package:news_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_app/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_article_usecase.dart';
import 'package:news_app/features/bookmark/domain/usecases/get_saved_article_usecase.dart';
import 'package:news_app/features/bookmark/domain/usecases/toggle_bookmark_usecase.dart';
import 'package:news_app/features/bookmark/presentation/bloc/local/bookmark_bloc.dart';
import 'package:news_app/features/daily_news/presentation/bloc/remote/article_bloc.dart';

final locator = GetIt.instance;

Future<void> getItInit() async {
  // Floor
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  locator.registerSingleton<AppDatabase>(database);

  // Dio
  locator.registerSingleton<Dio>(Dio());

  // Dependencies
  locator.registerSingleton<NewsApiService>(NewsApiService(locator.get()));

  locator.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(locator.get()));

  locator.registerSingleton<BookmarkRepository>(BookmarkRepositoryImpl(locator.get()));

  // UseCases
  locator.registerSingleton<GetArticleUsecase>(GetArticleUsecase(locator.get()));

  locator.registerSingleton<GetSavedArticleUsecase>(GetSavedArticleUsecase(locator.get()));

  locator.registerSingleton<ToggleBookmarkUsecase>(ToggleBookmarkUsecase(locator.get()));

  // Blocs
  locator.registerFactory<ArticleBloc>(() => ArticleBloc(locator.get()));
  locator.registerFactory<BookmarkBloc>(() => BookmarkBloc(locator.get(), locator.get()));
}
