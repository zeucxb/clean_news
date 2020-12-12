import 'dart:convert';

import 'package:http/http.dart';
import 'package:news/data/http/http.dart';

class HttpAdapter implements HttpClient {
  final Client client;

  HttpAdapter(this.client);

  Future<dynamic> get(String url) async {
    var response = Response('', 500);

    try {
      response = await client.get(url);
    } catch (error) {
      throw HttpError.serverError;
    }
    return _handleResponseStatus(response);
  }

  dynamic _handleResponseStatus(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.body.isEmpty ? null : jsonDecode(response.body);
      case 204:
        return null;
      case 400:
        throw HttpError.badRequest;
      case 401:
        throw HttpError.unauthorized;
      case 403:
        throw HttpError.forbidden;
      case 404:
        throw HttpError.notFound;
      default:
        throw HttpError.serverError;
    }
  }
}
