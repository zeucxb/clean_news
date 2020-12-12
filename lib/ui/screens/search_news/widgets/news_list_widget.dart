import 'package:flutter/material.dart';
import 'package:news/ui/screens/search_news/news_viewmodel.dart';

class NewsListWidget extends StatelessWidget {
  const NewsListWidget({
    Key key,
    @required this.news,
  }) : super(key: key);

  final List<NewsViewModel> news;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (_, index) {
        var item = news[index];
        return ListTile(
          title: Text(item.title),
          subtitle: Text(item.content),
          onTap: item.link,
        );
      },
    );
  }
}
