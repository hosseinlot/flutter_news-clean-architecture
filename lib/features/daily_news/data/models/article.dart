import 'package:news_app/features/daily_news/domain/entities/article.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'article', primaryKeys: ['url'])
class ArticleModel extends ArticleEntity {
  const ArticleModel({
    // int? id,
    String? author,
    String? title,
    String? description,
    @PrimaryKey() String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) : super(
          // id: id,
          author: author,
          title: title,
          description: description,
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          content: content,
        );

  factory ArticleModel.fromJson(Map<String, dynamic> jsonObject) {
    return ArticleModel(
      author: jsonObject['author'] ?? "",
      title: jsonObject['title'] ?? "",
      description: jsonObject['description'] ?? "",
      url: jsonObject['url'] ?? "",
      urlToImage: jsonObject['urlToImage'] ?? "",
      publishedAt: jsonObject['publishedAt'] ?? "",
      content: jsonObject['content'] ?? "",
    );
  }

  factory ArticleModel.fromEntity(ArticleEntity entity) {
    return ArticleModel(
      // id: entity.id,
      author: entity.author,
      title: entity.title,
      description: entity.description,
      url: entity.url,
      urlToImage: entity.urlToImage,
      publishedAt: entity.publishedAt,
      content: entity.content,
    );
  }
}
