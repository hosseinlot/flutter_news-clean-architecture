import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';

class ArticleTile extends StatelessWidget {
  final ArticleEntity article;
  const ArticleTile({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(start: 14, end: 14, bottom: 14),
      height: MediaQuery.of(context).size.width / 2.2,
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: article.urlToImage!,
            imageBuilder: (context, imageProvider) => Padding(
              padding: EdgeInsetsDirectional.only(end: 14),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.08),
                    image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            progressIndicatorBuilder: (context, url, progress) => Padding(
              padding: EdgeInsetsDirectional.only(end: 14),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: double.maxFinite,
                  decoration: BoxDecoration(color: Colors.black.withOpacity(0.08)),
                  child: CupertinoActivityIndicator(),
                ),
              ),
            ),
            errorWidget: (context, url, error) => Padding(
              padding: EdgeInsetsDirectional.only(end: 14),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.08),
                  ),
                  child: Icon(Icons.error),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 7),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    article.title!,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Muli',
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Text(
                        article.description!,
                        maxLines: 2,
                      ),
                    ),
                  ),

                  Row(
                    children: [
                      Icon(Icons.timeline_outlined, size: 16),
                      SizedBox(width: 4),
                      Text(
                        article.publishedAt!,
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
