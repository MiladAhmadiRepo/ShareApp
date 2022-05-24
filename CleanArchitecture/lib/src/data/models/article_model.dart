import 'package:clean_architecture/src/data/models/source_model.dart';
import 'package:clean_architecture/src/domain/entities/article.dart';
import 'package:clean_architecture/src/domain/entities/source.dart';

class ArticleModel extends Article {
  const ArticleModel(
      {required int id,
      required SourceModel source,
      required String author,
      required String title,
      required String description,
      required String url,
      required String urlToImage,
      required String publishedAt,
      required String content})
      : super(
            id: id,
            source: source,
            author: author,
            title: title,
            description: description,
            url: url,
            urlToImage: urlToImage,
            publishedAt: publishedAt,
            content: content);

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return ArticleModel(
          id: 0,
          source: SourceModel.fromJson({"id": "0", "name": ""}),
          author: "",
          title: "",
          description: "",
          url: "",
          urlToImage: "",
          publishedAt: "",
          content: "");
    }

    return ArticleModel(
        id: int.parse(json['id'] as String),
        source: SourceModel.fromJson(json['source'] as Map<String, dynamic>),
        author: json['author'] as String,
        title: json['title'] as String,
        description: json['description'] as String,
        url: json['url'] as String,
        urlToImage: json['urlToImage'] as String,
        publishedAt: json['publishedAt'] as String,
        content: json['content'] as String);
  }
}
