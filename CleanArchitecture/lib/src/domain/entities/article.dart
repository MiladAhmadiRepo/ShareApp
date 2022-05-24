import 'package:clean_architecture/src/domain/entities/source.dart';
import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final int id;
  final Source source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  const Article({required this.id, required this.source,required  this.author,
    required  this.title,required  this.description,required  this.url,
    required this.urlToImage,required  this.publishedAt,required  this.content});

  @override
  List<Object> get props => [
        id,
        source,
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content,
      ];

  @override
  bool get stringify => true;
}
