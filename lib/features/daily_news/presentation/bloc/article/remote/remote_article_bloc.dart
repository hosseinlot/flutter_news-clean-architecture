import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_article_usecase.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUsecase _getArticleUsecase;

  RemoteArticleBloc(this._getArticleUsecase) : super(RemoteArticlesLoading()) {
    on<GetArticlesEvent>(
      (event, emit) async {
        final dataState = await _getArticleUsecase();

        if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
          emit(RemoteArticlesDone(dataState.data!));
        }

        if (dataState is DataFailed) {
          emit(RemoteArticlesError(dataState.error!));
        }
      },
    );
  }
}
