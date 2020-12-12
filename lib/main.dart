import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news/data/helpers/parsers.dart';
import 'package:news/data/helpers/validators.dart';
import 'package:news/data/usecases/usecases.dart';
import 'package:news/infra/http/http.dart';
import 'package:news/presentation/search_news_store.dart';
import 'package:news/ui/screens/search_news/search_news_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',
      theme: ThemeData.dark(),
      initialRoute: '/news',
      routes: {
        '/news': (_) => SearchNewsScreen(
              SearchNewsStore(
                GovSearchNews(
                  HttpAdapter(
                    Client(),
                  ),
                  stringParser: UrlParamsParser(),
                  // validator: StringValidator(),
                ),
              ),
            ),
      },
    );
  }
}
