import 'package:news/data/http/http_client.dart';
import 'package:news/domain/entities/news_entity.dart';
import 'package:news/domain/usecases/usecases.dart';

class SearchNewsCompose implements SearchNews {
  final HttpClient httpClient;
  final List<SearchNews> searchNews;

  SearchNewsCompose(this.httpClient, this.searchNews);

  @override
  Future<List<NewsEntity>> call(String searchText) async {
    List<NewsEntity> newsList = [];

    await Future.wait(searchNews.map((usecase) async {
      final news = await usecase(searchText);

      return newsList.addAll(news);
    }).toList());

    return newsList;
  }
}
