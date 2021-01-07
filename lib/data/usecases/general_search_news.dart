import 'package:news/data/helpers/parsers.dart';
import 'package:news/data/helpers/validators.dart';
import 'package:news/data/http/http.dart';
import 'package:news/data/models/models.dart';
import 'package:news/domain/entities/news_entity.dart';
import 'package:news/domain/helpers/helpers.dart';
import 'package:news/domain/usecases/usecases.dart';

class GeneralSearchNews implements SearchNews {
  final HttpClient httpClient;
  final Validator validator;
  final StringParser stringParser;

  GeneralSearchNews(this.httpClient, {this.validator, this.stringParser});

  @override
  Future<List<NewsEntity>> call(String searchText) async {
    String parsedValue = searchText;

    if (validator != null) {
      if (!validator(searchText)) throw SearchError.invalid;
    }

    if (stringParser != null) {
      parsedValue = stringParser(searchText);
    }

    var response = await httpClient.get(
        'http://newsapi.org/v2/everything?q=$parsedValue&apiKey=a09f7b6a94824149a0fa562779cdd201');

    return GeneralNewsModel.fromJson(response).toEntityList();
  }
}
