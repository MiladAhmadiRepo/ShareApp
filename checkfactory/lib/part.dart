part of 'main.dart';
class TestChild extends Test {
  /// private constructor can only be called from within the same library
  /// Call the private constructor of the super class
  TestChild() : super._();

  /// static members of other classes need to be prefixed with
  /// the class name, even when it is the super class
  final d = Test.a +1;   //<---undefined name 'a'
}