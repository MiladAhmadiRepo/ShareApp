import 'package:uuid/uuid.dart';

class BreadCrumb{
  bool isActive;
  final String name;
  final String uuid;

  BreadCrumb({required this.isActive,required this.name}):uuid=const Uuid().v4();

  void activate(){
    isActive=true;
  }

  String get title =>name+ (isActive?' > ':'');

  @override
  bool operator ==(covariant BreadCrumb other) {
   // return isActive==other.isActive && name==other.name;
    return uuid==other.uuid;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => uuid.hashCode;
}