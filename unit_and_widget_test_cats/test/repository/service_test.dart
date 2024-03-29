import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:unit_and_widget_test_cats/repository/model/cat.dart';
import 'package:unit_and_widget_test_cats/repository/model/result_error.dart';
import 'package:unit_and_widget_test_cats/repository/service.dart';
import 'package:unit_and_widget_test_cats/utils/test_helper.dart';

class MockHttp extends Mock implements http.Client {}

class MockResponse extends Mock implements http.Response {}

class FakeUri extends Fake implements Uri {}

void main() {
  group('service', () {
    late CatService catService;
    late MockHttp httpClient;

    setUpAll(() {
      registerFallbackValue(FakeUri());
    });

    setUp(() {
      httpClient = MockHttp();
      catService = CatService(httpClient: httpClient);
    });

    group("constructor", () {
      test("does not required a httpClient", () {
        expect(CatService(), isNotNull);
      });
    });

    group("catSearch", () {

      test('make correct http request with empty response , throw [ErrorEmptyResponse]', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);

        try {
          await catService.search();
          fail('should throw error empty body');
        } catch (error) {
          expect(error, isA<ErrorEmptyResponse>());
        }
        verify(() => httpClient.get(Uri.parse('https://api.thecatapi.com/v1/images/search?has_breeds=true')))
            .called(1);
      });

      test('throws ResultError on non_200 response ', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(404);
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        expect(catService.search(), throwsA(isA<ErrorSearchingCat>()));
      });

      test('return cat.json on a valid response ', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn(TestHelper.searchCatJsonResponse);
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        await catService.search();
        expect(Cat.fromJson(jsonDecode(response.body)[0]),isA<Cat>());
      });

    });
  });
}
