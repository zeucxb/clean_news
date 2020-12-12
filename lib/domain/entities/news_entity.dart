import 'package:equatable/equatable.dart';

class NewsEntity extends Equatable {
  final String title;
  final String content;
  final String url;

  NewsEntity(this.title, this.content, this.url);

  List get props => [title, content, url];
}
