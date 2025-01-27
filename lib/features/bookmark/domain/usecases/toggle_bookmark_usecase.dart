import 'package:news_app/core/usecases/usecase.dart';
import 'package:news_app/features/bookmark/domain/repository/bookmark_repository.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';

class ToggleBookmarkUsecase implements Usecase<void, ArticleEntity> {
  final BookmarkRepository _bookmarkRepository;

  ToggleBookmarkUsecase(this._bookmarkRepository);
  @override
  Future<String> call({ArticleEntity? params}) {
    return _bookmarkRepository.toggleBookmark(params!);
  }
}
