import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/bookmark/domain/usecases/get_saved_article_usecase.dart';
import 'package:news_app/features/bookmark/domain/usecases/toggle_bookmark_usecase.dart';
import 'package:news_app/features/bookmark/presentation/bloc/local/bookmark_event.dart';
import 'package:news_app/features/bookmark/presentation/bloc/local/bookmark_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  final GetSavedArticleUsecase _getSavedArticleUsecase;
  final ToggleBookmarkUsecase _toggleBookmarkUsecase;

  BookmarkBloc(
    this._getSavedArticleUsecase,
    this._toggleBookmarkUsecase,
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
    on<BookmarkArticleEvent>(
      (event, emit) async {
        var result = await _toggleBookmarkUsecase(params: event.article);
        final articles = await _getSavedArticleUsecase();
        emit(LocalArticleBookmark(result));
        emit(LocalArticlesDone(articles));
      },
    );
  }
}
