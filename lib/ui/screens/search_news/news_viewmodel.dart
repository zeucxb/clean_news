import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsViewModel {
  final String title;
  final String content;
  final String url;

  Function get link => () => launch(this.url);

  NewsViewModel({
    @required this.title,
    @required this.content,
    @required this.url,
  });
}
