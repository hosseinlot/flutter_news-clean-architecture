import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_saved_article_usecase.dart';
import 'package:news_app/features/daily_news/domain/usecases/remove_article_usecase.dart';
import 'package:news_app/features/daily_news/domain/usecases/save_article_usecase.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/local/local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticleUsecase _getSavedArticleUsecase;
  final SaveArticleUsecase _saveArticleUsecase;
  final RemoveArticleUsecase _removeArticleUsecase;

  LocalArticleBloc(
    this._getSavedArticleUsecase,
    this._saveArticleUsecase,
    this._removeArticleUsecase,
  ) : super(LocalArticlesLoading()) {
    // load articles
    on<GetSavedArticlesEvent>(
      (event, emit) async {
        emit(LocalArticlesLoading());
        final articles = await _getSavedArticleUsecase();
        emit(LocalArticlesDone(articles));
      },
    );

    // save article
    on<SaveArticleEvent>(
      (event, emit) async {
        var result = await _saveArticleUsecase(params: event.article);
        final articles = await _getSavedArticleUsecase();
        emit(LocalArticleBookmark(result));
        emit(LocalArticlesDone(articles));
      },
    );

    // remove articles
    on<RemoveSavedArticleEvent>(
      (event, emit) async {
        await _removeArticleUsecase(params: event.article);
        final articles = await _getSavedArticleUsecase();
        emit(LocalArticlesDone(articles));
      },
    );
  }
}
