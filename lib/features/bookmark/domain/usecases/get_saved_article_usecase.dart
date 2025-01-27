import 'package:news_app/core/usecases/usecase.dart';
import 'package:news_app/features/bookmark/domain/repository/bookmark_repository.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';

class GetSavedArticleUsecase implements Usecase<List<ArticleEntity>, void> {
  final BookmarkRepository _bookmarkRepository;

  GetSavedArticleUsecase(this._bookmarkRepository);
  @override
  Future<List<ArticleEntity>> call({void params}) {
    return _bookmarkRepository.getSavedArticles();
  }
}
