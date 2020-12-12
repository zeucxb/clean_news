import 'package:mobx/mobx.dart';
import 'package:news/domain/helpers/helpers.dart';
import 'package:news/domain/usecases/usecases.dart';
import 'package:news/ui/screens/search_news/news_viewmodel.dart';
import 'package:news/ui/screens/search_news/search_news_presenter.dart';

part 'search_news_store.g.dart';

class SearchNewsStore = _SearchNewsStoreBase with _$SearchNewsStore;

abstract class _SearchNewsStoreBase with Store implements SearchNewsPresenter {
  final SearchNews searchNews;

  _SearchNewsStoreBase(this.searchNews);

  @observable
  List<NewsViewModel> news = [];

  @observable
  bool isLoading = false;

  @observable
  String errorMessage;

  @action
  Future search(String searchText) async {
    isLoading = true;
    errorMessage = null;

    try {
      var result = await searchNews(searchText);

      news = result
          .map(
            (news) => NewsViewModel(
              title: news.title,
              content: news.content,
              url: news.url,
            ),
          )
          .toList();
    } on SearchError catch (e) {
      if (e == SearchError.invalid) {
        errorMessage = 'Termo de busca inválido ou em branco';
      } else {
        errorMessage = 'Nenhuma notícia encontrada';
      }
    } catch (_) {
      errorMessage = 'Erro inesparado';
    }

    isLoading = false;
  }
}
