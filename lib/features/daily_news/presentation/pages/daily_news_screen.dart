import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/di.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:news_app/features/daily_news/presentation/pages/article_detail_screen.dart';
import 'package:news_app/features/daily_news/presentation/pages/bookmark_screen.dart';
import 'package:news_app/features/daily_news/presentation/widgets/article_tile.dart';

class DailyNewsScreen extends StatelessWidget {
  const DailyNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All News', style: TextStyle(color: Colors.black)),
        actions: [
          GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BookmarkScreen(),
            )),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.bookmark_outline, color: Colors.black),
            ),
          )
        ],
      ),
      body: BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
        builder: (context, state) {
          if (state is RemoteArticlesLoading) {
            return Center(child: CupertinoActivityIndicator());
          }
          if (state is RemoteArticlesError) {
            return Center(child: Icon(Icons.refresh));
          }
          if (state is RemoteArticlesDone) {
            return ListView.builder(
              itemCount: state.articles.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BlocProvider(
                              create: (context) => LocalArticleBloc(locator.get(), locator.get(), locator.get()),
                              child: ArticleDetailScreen(article: state.articles[index]),
                            ))),
                    child: ArticleTile(article: state.articles[index]));
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
