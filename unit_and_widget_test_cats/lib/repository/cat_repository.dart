import 'package:unit_and_widget_test_cats/repository/model/cat.dart';
import 'package:unit_and_widget_test_cats/repository/service.dart';

class CatRepository {
  final CatService service;

  const CatRepository({required this.service});

  Future<Cat> search() async => service.search();
}
