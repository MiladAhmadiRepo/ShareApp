import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:unit_and_widget_test_cats/repository/model/result_error.dart';
import 'package:unit_and_widget_test_cats/repository/service.dart';

class MockHttp extends Mock implements http.Client{}
class MockResponse extends Mock implements http.Response{}
class FakeUri extends Fake implements Uri{}

void main(){
  group('service', () {
    late CatService catService;
    late MockHttp httpClient;
    
    setUpAll(() {
      registerFallbackValue(FakeUri());
    });

    setUp((){
      httpClient=MockHttp();
      catService=CatService(httpClient: httpClient);
    });
    
    group("constructor", () { 
      test("does not required a httpClient", () {
        expect(CatService(), isNotNull);
      });
    });
    
    group("catSearch", () {
      test('make correct http request with empty response , throw [ErrorEmptyResponse]', ()async{
        final response=MockResponse();
        when(()=>response.statusCode).thenReturn(200);
        when(()=>response.body).thenReturn('');
        when(()=>httpClient.get(any())).thenAnswer((_)async=>response);

        try{
          await catService.search();
          fail('should throw error empty body');
        }catch(error){
          expect(error, isA<ErrorEmptyResponse>());
        }
        verify(()=>httpClient.get( Uri.parse(
            'https://api.thecatapi.com/v1/images/search?has_breeds=true'))).called(1);

      });
    });
    
  });
}