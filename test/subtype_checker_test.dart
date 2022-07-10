import 'package:buzz/utils/subtype_checker.dart';
import 'package:test/test.dart';

class Parent {}

class ParentA extends Parent {}

class Child extends Parent {}

class ChildA extends Child {}

class SubChild extends Child {}

class SubChildA extends Child {}

class NonRelatedClass {}

void main() {
  group('isValid', () {
    test('Child isValid of Parent', () {
      final checker = SubtypeChecker<Child, Parent>();
      expect(checker.isValid(), true);
    });
    test('SubChild isValid of Child', () {
      final checker = SubtypeChecker<SubChild, Child>();
      expect(checker.isValid(), true);
    });
    test('SubChild isValid of Parent', () {
      final checker = SubtypeChecker<SubChild, Parent>();
      expect(checker.isValid(), true);
    });
    test('Parent isValid of Child', () {
      final checker = SubtypeChecker<Parent, Child>();
      expect(checker.isValid(), false);
    });
    test('NonRelatedClass isNotValid of Parent, nor Child, nor SubChild', () {
      final parentChecker = SubtypeChecker<NonRelatedClass, Parent>();
      expect(parentChecker.isValid(), false);

      final childChecker = SubtypeChecker<NonRelatedClass, Child>();
      expect(childChecker.isValid(), false);

      final subChildChecker = SubtypeChecker<NonRelatedClass, SubChild>();
      expect(subChildChecker.isValid(), false);
    });
  });
}
