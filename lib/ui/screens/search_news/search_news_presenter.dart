import 'package:news/ui/screens/search_news/news_viewmodel.dart';

abstract class SearchNewsPresenter {
  List<NewsViewModel> news;

  bool isLoading;

  String errorMessage;

  void search(String searchText);
}
