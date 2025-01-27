import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/config/theme/app_theme.dart';
import 'package:news_app/di.dart';
import 'package:news_app/features/daily_news/presentation/bloc/remote/article_bloc.dart';
import 'package:news_app/features/daily_news/presentation/bloc/remote/article_event.dart';
import 'package:news_app/features/daily_news/presentation/pages/daily_news_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getItInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: BlocProvider(
        create: (context) {
          var bloc = ArticleBloc(locator.get());
          bloc.add(GetArticlesEvent());
          return bloc;
        },
        child: DailyNewsScreen(),
      ),
    );
  }
}
