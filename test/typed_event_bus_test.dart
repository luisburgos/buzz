import 'package:buzz/buzz.dart';
import 'package:mockito/mockito.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

class UiEventBus extends TypedEventBus<UiEvent> {}

class TestUiEventA extends UiEvent {}

class TestUiEventB extends UiEvent {}

class NotUiEventClass {}

class TestAppEventA extends AppEvent {}

class UiEventHandler extends Mock implements TypedEventHandler<UiEvent> {
  @override
  void handle(UiEvent event) {
    print(event.toString());
  }
}

class Parent {}

class Child extends Parent {}

class SubChild extends Child {}

void main() {
  test('sanity', () {
    expect(isSubtype<Parent>(Child), true);
    expect(isSubtype<Child>(SubChild), true);
    expect(isSubtype<Parent>(SubChild), true);
    expect(isSubtype<Child>(Parent), false);

    expect(isSubtype2(Child, Parent), true);
    expect(isSubtype2(SubChild, Child), true);
    expect(isSubtype2(SubChild, Parent), true);
    expect(isSubtype2(Parent, Child), false);

    expect(isSubtype2(TestUiEventA, UiEvent), true);
    expect(isSubtype2(TestUiEventB, UiEvent), true);
    expect(isSubtype2(TestAppEventA, UiEvent), false);
    expect(isSubtype2(NotUiEventClass, UiEvent), false);
  });

  test('UiEventBus.supportedType is UiEvent', () {
    UiEventBus eventBus = UiEventBus();
    expect(
      eventBus.supportedType,
      UiEvent,
    );
  });

  test('UiEventBus.isTypeSupported use cases', () {
    UiEventBus eventBus = UiEventBus();
    expect(eventBus.isTypeSupported(TestUiEventA), true);
    expect(eventBus.isTypeSupported(TestUiEventB), true);

    expect(eventBus.isTypeSupported(TestAppEventA), false);
    expect(eventBus.isTypeSupported(NotUiEventClass), false);
  });
}

bool isSubtype2<S, T>(dynamic s, T t) {
  print('$s is $t? => ${s is T}');
  print('${s.runtimeType} is $t? => ${s.runtimeType is T}');
  return s is T;
}

bool isSubtype<T>(dynamic type) {
  final listFromS = List.from(type);
  print('listFromS: $listFromS');
  return listFromS is List<T>;
}
