import 'package:dio/dio.dart';
import '../../models/breaking_news_response_model.dart';

class _NewsApiService extends NewsApiService {
  _NewsApiService(this._dio, {this.baseUrl = ""}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://newsapi.org/v2';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<Response<BreakingNewsResponseModel>> getBreakingNewsArticles() async {
    const _extra = <String, dynamic>{};
    final _data = <String, dynamic>{};

    BaseOptions option = BaseOptions(
      connectTimeout: 3000,
      receiveTimeout: 3000,
      method: 'GET',
    );
    Dio dio = Dio(option);
    Response _result  = await dio.get(baseUrl + '/top-headlines');

    final value = BreakingNewsResponseModel.fromJson(_result .data ?? <String, dynamic>{});
    final response = Response(data: value, requestOptions: RequestOptions(path: baseUrl + '/top-headlines'),

    );
    return response;
  }
}

abstract class NewsApiService {
  factory NewsApiService(Dio dio, {String baseUrl}) = _NewsApiService;

  Future<Response<BreakingNewsResponseModel>> getBreakingNewsArticles({
    String apiKey,
    String country,
    String category,
    int page,
    int pageSize,
  });
}
