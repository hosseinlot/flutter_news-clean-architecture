import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/di.dart';
import 'package:news_app/features/bookmark/presentation/bloc/local/bookmark_bloc.dart';
import 'package:news_app/features/bookmark/presentation/bloc/local/bookmark_event.dart';
import 'package:news_app/features/bookmark/presentation/bloc/local/bookmark_state.dart';
import 'package:news_app/features/daily_news/presentation/pages/article_detail_screen.dart';
import 'package:news_app/features/daily_news/presentation/widgets/article_tile.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        var bloc = locator<BookmarkBloc>();
        bloc.add(GetSavedArticlesEvent());
        return bloc;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => Navigator.of(context).pop(),
            child: Icon(Icons.chevron_left, color: Colors.black),
          ),
          title: Text('Bookmarks', style: TextStyle(color: Colors.black)),
        ),
        body: BlocBuilder<BookmarkBloc, BookmarkState>(
          builder: (context, state) {
            // print(state);
            if (state is LocalArticlesLoading) {
              return Center(child: CupertinoActivityIndicator());
            }

            if (state is LocalArticlesDone) {
              if (state.articles.isEmpty) {
                return Center(
                  child: Text(
                    'There is no saved articles',
                    style: TextStyle(color: Colors.black),
                  ),
                );
              }

              return ListView.builder(
                itemCount: state.articles.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (newContext) => BlocProvider.value(
                                value: context.read<BookmarkBloc>(),
                                child: ArticleDetailScreen(article: state.articles[index]),
                              ))),
                      child: ArticleTile(article: state.articles[index]));
                },
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
