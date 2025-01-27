import 'package:news_app/core/usecases/usecase.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';

class SaveArticleUsecase implements Usecase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;

  SaveArticleUsecase(this._articleRepository);
  @override
  Future<String> call({ArticleEntity? params}) {
    return _articleRepository.toggleBookmark(params!);
  }
}
