import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_proj/core/utils/injection_container.dart';
import 'package:photo_proj/features/daily_news/presentation/bloc/article_bloc.dart';
import 'package:photo_proj/features/daily_news/presentation/bloc/articles_event.dart';
import 'package:photo_proj/features/daily_news/presentation/pages/daily_news.dart';
import 'package:photo_proj/features/daily_news/presentation/pages/image_in_detail.dart';

Future<void> main() async {

  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return BlocProvider<ArticleBloc>(
      create: (context) => di()..add(const GetArticles()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const DailyNews(),
        routes: {
          ImageInDetail.routeName: (context) => const ImageInDetail()
        },
      ),
    );
  }
}
