import 'package:news/data/helpers/parsers.dart';
import 'package:news/data/helpers/validators.dart';
import 'package:news/data/http/http.dart';
import 'package:news/data/models/gov_news_model.dart';
import 'package:news/domain/entities/news_entity.dart';
import 'package:news/domain/usecases/usecases.dart';

class GovSearchNews implements SearchNews {
  final HttpClient httpClient;
  final Validator validator;
  final StringParser stringParser;

  GovSearchNews(this.httpClient, {this.validator, this.stringParser});

  @override
  Future<List<NewsEntity>> call(String searchText) async {
    final response = await httpClient.get('http://noticias.gov.br/noticias-api/noticias/busca?b=$searchText&wt=json');

    return GovNewsModel.fromJson(response).toEntityList();
  }
}
