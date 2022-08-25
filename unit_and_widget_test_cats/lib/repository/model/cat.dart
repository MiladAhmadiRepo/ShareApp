import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unit_and_widget_test_cats/repository/model/breed.dart';

part 'cat.freezed.dart';
part 'cat.g.dart';



@freezed
class Cat with _$Cat {
  const factory Cat({
    final List<Breed>? breeds,
    final String? id,
    final String? url,
    final int? width,
    final int? height,
  }) = _Cat;

  factory Cat.fromJson(Map<String, dynamic> json) => _$CatFromJson(json);
}



