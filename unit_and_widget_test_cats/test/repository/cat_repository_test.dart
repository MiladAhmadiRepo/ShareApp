import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:unit_and_widget_test_cats/repository/cat_repository.dart';
import 'package:unit_and_widget_test_cats/repository/model/result_error.dart';
import 'package:unit_and_widget_test_cats/repository/service.dart';

class MockService extends Mock implements CatService {}

void main() {
  group('cat repository', () {
    late CatService catService;
    late CatRepository catRepository;

    setUp(() {
      catService = MockService();
      catRepository = CatRepository(service: catService);
    });

    test('instantiates CatRepository  with a required catService ', () => expect(catRepository, isNotNull));

    test('call search method', () async {
      try {
        await catRepository.search();
      } catch (_) {}
      verify(() => catService.search()).called(1);
    });

    test('throws Result exception when search fails', () async {
      final exception=ErrorSearchingCat();
      when((){
        catService.search();
      }).thenThrow(exception);
      expect(()async=>catRepository.search(), throwsA(exception));
    });


  });
}
