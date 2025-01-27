import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/features/daily_news/data/data_sources/local/DAO/app_database.dart';
import 'package:news_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_app/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_article_usecase.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_saved_article_usecase.dart';
import 'package:news_app/features/daily_news/domain/usecases/remove_article_usecase.dart';
import 'package:news_app/features/daily_news/domain/usecases/save_article_usecase.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

final locator = GetIt.instance;

Future<void> getItInit() async {
  // Floor
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  locator.registerSingleton<AppDatabase>(database);

  // Dio
  locator.registerSingleton<Dio>(Dio());

  // Dependencies
  locator.registerSingleton<NewsApiService>(NewsApiService(locator.get()));

  locator.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(locator.get(), locator.get()));

  // UseCases
  locator.registerSingleton<GetArticleUsecase>(GetArticleUsecase(locator.get()));

  locator.registerSingleton<GetSavedArticleUsecase>(GetSavedArticleUsecase(locator.get()));

  locator.registerSingleton<SaveArticleUsecase>(SaveArticleUsecase(locator.get()));

  locator.registerSingleton<RemoveArticleUsecase>(RemoveArticleUsecase(locator.get()));

  // Blocs
  locator.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(locator.get()));
  locator.registerFactory<LocalArticleBloc>(() => LocalArticleBloc(locator.get(), locator.get(), locator.get()));
}
