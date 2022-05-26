import 'dart:io';

import 'package:dio/dio.dart';
import '../../core/params/article_request.dart';
import '../../core/resources/data_state.dart';
import '../../domain/entities/article.dart';
import '../../domain/repositories/articles_repository.dart';
import '../datasources/remote/news_api_service.dart';

class ArticlesRepositoryImpl implements ArticlesRepository {
  final NewsApiService _newsApiService;

  const ArticlesRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<Article>>> getBreakingNewsArticles(
    ArticlesRequestParams params,
  ) async {
    try {
      final response = await _newsApiService.getBreakingNewsArticles(
        apiKey: params.apiKey,
        country: params.country,
        category: params.category,
        page: params.page,
        pageSize: params.pageSize,
      );

      if (response.statusCode == HttpStatus.ok) {
        return DataSuccess(response.data?.articles ?? []);
      }
      return DataFailed(
        DioError(
            error: response.statusMessage,
            response: response,
            type: DioErrorType.response,
            requestOptions: response.requestOptions),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
