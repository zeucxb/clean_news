import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:news/data/http/http_client.dart';
import 'package:news/data/usecases/gov_search_news.dart';

import '../../mocks/gov_search_news_mock.dart';

class HttpMock extends Mock implements HttpClient {}

main() {
  GovSearchNews usecase;
  HttpClient httpClientMock;
  final faker = Faker();

  setUp(() {
    httpClientMock = HttpMock();
    usecase = GovSearchNews(httpClientMock);
  });

  group('GovSearchNews', () {
    test('Deve retornar uma lista de NewsEntity em caso de sucesso', () async {
      final mock = FakeGovSearchNewsResponse.jsonMock();
      final response = await usecase(faker.randomGenerator.string(20));

      when(httpClientMock.get(any)).thenAnswer((realInvocation) async => mock);

      expect(response[0].title,
          'STF acata denúncia contra o deputado Jair Bolsonaro por incitação ao crime de estupro');
    });
  });
}
