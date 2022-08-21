import 'package:buzz/infra/typed_event_bus.dart';
import 'package:buzz/utils/utils.dart';

import 'infra/errors.dart';
import 'infra/event_bus_holder.dart';

class EventBusHolderImpl implements IEventBusHolder {
  final _allStreamBuses = <Type, TypedEventBus>{};

  int get totalBuses => _allStreamBuses.length;

  @override
  void destroy() {
    _allStreamBuses.clear();
  }

  @override
  TypedEventBus forType<T>() {
    TypedEventBus? eventBus;

    for (var bus in _allStreamBuses.values) {
      bool isSupported = bus.isTypeSupported<T>();
      if (isSupported) {
        eventBus = bus;
      }

      if (eventBus != null) {
        break;
      }
    }

    if (eventBus != null) {
      return eventBus;
    } else {
      throw BuzzTypedEventBusForTypeNotFound(T.toString());
    }
  }

  @override
  X of<X extends TypedEventBus>() {
    TypedEventBus? eventBus;

    for (var entry in _allStreamBuses.entries) {
      if (entry.key == X) {
        eventBus = entry.value;
      }

      if (eventBus != null) {
        break;
      }
    }

    if (eventBus != null) {
      return eventBus as X;
    } else {
      throw BuzzTypedEventBusForTypeNotFound(X.toString());
    }
  }

  @override
  void addEventBus(TypedEventBus streamBus) {
    final typeModule = streamBus.runtimeType;
    if (_allStreamBuses.containsKey(typeModule)) return;
    _allStreamBuses[typeModule] = streamBus;
    buzzLog('INITIALIZED $typeModule');
  }
}
