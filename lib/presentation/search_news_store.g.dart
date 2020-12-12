// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_news_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchNewsStore on _SearchNewsStoreBase, Store {
  final _$newsAtom = Atom(name: '_SearchNewsStoreBase.news');

  @override
  List<NewsViewModel> get news {
    _$newsAtom.reportRead();
    return super.news;
  }

  @override
  set news(List<NewsViewModel> value) {
    _$newsAtom.reportWrite(value, super.news, () {
      super.news = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_SearchNewsStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_SearchNewsStoreBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$searchAsyncAction = AsyncAction('_SearchNewsStoreBase.search');

  @override
  Future<dynamic> search(String searchText) {
    return _$searchAsyncAction.run(() => super.search(searchText));
  }

  @override
  String toString() {
    return '''
news: ${news},
isLoading: ${isLoading},
errorMessage: ${errorMessage}
    ''';
  }
}
