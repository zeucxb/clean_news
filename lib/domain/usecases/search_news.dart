import 'package:news/domain/entities/news_entity.dart';

abstract class SearchNews {
  Future<List<NewsEntity>> call(String searchText);
}
