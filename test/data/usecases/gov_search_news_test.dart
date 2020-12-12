import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:news/data/http/http.dart';
import 'package:news/data/usecases/gov_search_news.dart';
import 'package:news/domain/entities/entities.dart';

import '../../mocks/fake_gov_search_news_response.dart';

class HttpClientMock extends Mock implements HttpClient {}

main() {
  GovSearchNews usecase;
  HttpClient httpClient;
  String searchText;

  setUp(() {
    httpClient = HttpClientMock();
    usecase = GovSearchNews(httpClient);
    searchText = faker.randomGenerator.string(20);
  });

  group('GovSearchNews', () {
    test('Quanndo tiver sucesso, deve retornar uma lista de NewsEntity', () async {
      final jsonMock = FakeGovSearchNewsResponse.jsonMock();
      when(httpClient.get(any)).thenAnswer((_) async => jsonMock);

      final response = await usecase(searchText);
      final newsJsonList = jsonMock['resultado']['noticias']['noticia'];

      expect(
        response,
        [
          NewsEntity(newsJsonList[0]['titulo'], newsJsonList[0]['resumo'], newsJsonList[0]['link']),
          NewsEntity(newsJsonList[1]['titulo'], newsJsonList[1]['resumo'], newsJsonList[1]['link']),
        ],
      );
    });
  });
}
