import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/local/local_article_state.dart';

class ArticleDetailScreen extends HookWidget {
  final ArticleEntity article;

  const ArticleDetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return NewWid(article: article);
  }
}

class NewWid extends StatelessWidget {
  const NewWid({
    super.key,
    required this.article,
  });

  final ArticleEntity article;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocalArticleBloc, LocalArticleState>(
      listener: (newContext, state) {
        if (state is LocalArticleBookmark) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.bookmarkMesssage), duration: Duration(milliseconds: 500), backgroundColor: Colors.black));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (newContext) => GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.chevron_left, color: Colors.black),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            // var bloc = locator<LocalArticleBloc>();
            // bloc.add(SaveArticleEvent(article));
            context.read<LocalArticleBloc>().add(SaveArticleEvent(article));
            context.read<LocalArticleBloc>().add(GetSavedArticlesEvent());
          },
          child: Icon(Icons.bookmark, color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title!,
                      style: TextStyle(fontFamily: 'Bulter', fontSize: 20),
                    ),
                    SizedBox(height: 14),
                    Row(
                      children: [
                        Icon(Icons.timer_outlined, size: 16),
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
              Container(
                width: double.maxFinite,
                height: 250,
                margin: EdgeInsets.only(top: 14),
                child: Image.network(article.urlToImage!, fit: BoxFit.cover),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                child: Text(
                  '${article.description ?? ''}\n\n${article.content ?? ''}',
                  style: TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
