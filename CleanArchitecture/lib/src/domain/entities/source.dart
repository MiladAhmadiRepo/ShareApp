import 'package:equatable/equatable.dart';

class Source extends Equatable{
  final String id ;
  final String name ;


  const Source({required this.id,required this.name});

  @override
  List<Object?> get props => [id,name];

  @override
  bool? get stringify => true;

}