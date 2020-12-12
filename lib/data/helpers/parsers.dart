abstract class StringParser {
  String call(String value);
}

class UrlParamsParser implements StringParser {
  @override
  String call(String value) {
    return value.replaceAll(' ', '+');
  }
}
