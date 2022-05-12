import 'package:clean_architecture/src/domain/entities/source.dart';
import 'package:equatable/equatable.dart';

class Article extends Equatable{
  final Source source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;
  @override
  List<Object?> get props =>

}