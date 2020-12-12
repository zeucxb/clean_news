import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:news/ui/screens/search_news/search_news_presenter.dart';
import 'package:news/ui/screens/search_news/widgets/news_list_widget.dart';
import 'package:news/ui/screens/search_news/widgets/search_field_widget.dart';

class SearchNewsScreen extends StatelessWidget {
  final SearchNewsPresenter presenter;
  final TextEditingController searchFieldController = TextEditingController();

  SearchNewsScreen(this.presenter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SearchFieldWidget(
              controller: searchFieldController,
              onPressed: () => presenter.search(searchFieldController.text),
            ),
            Expanded(
              child: Observer(
                builder: (_) {
                  if (presenter.isLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (presenter.errorMessage != null && presenter.errorMessage.isNotEmpty) {
                    return Center(
                      child: Text(presenter.errorMessage),
                    );
                  }

                  if (presenter.news == null || presenter.news.isEmpty) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.remove_red_eye_outlined),
                            Text('Nada para ver aqui'),
                          ],
                        ),
                        Text('Use a barra de pesquisa para buscar notícias')
                      ],
                    );
                  }

                  return NewsListWidget(news: presenter.news);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
