import 'package:uuid/uuid.dart';

class Seconds{
  final String value;
  Seconds():value=DateTime.now().toIso8601String();
}