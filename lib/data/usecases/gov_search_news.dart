import 'package:news/domain/entities/news_entity.dart';
import 'package:news/domain/usecases/usecases.dart';

class GovSearchNews implements SearchNews {
  @override
  Future<List<NewsEntity>> call(String searchText) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
