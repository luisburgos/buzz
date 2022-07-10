import 'package:buzz/infra/typed_event_bus.dart';
import 'package:buzz/utils.dart';

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
      print('\n$bus - $T');
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
      throw BuzzChannelNotFound(T.toString());
    }
  }

  @override
  X of<X extends TypedEventBus>() {
    TypedEventBus? eventBus;

    for (var entry in _allStreamBuses.entries) {
      print('$entry - ${entry.key} looking for $X');
      if (entry.key == X) {
        eventBus = entry.value;
      }

      if (eventBus != null) {
        break;
      }
    }

    if (eventBus != null) {
      print('Bus of $X found');
      return eventBus as X;
    } else {
      throw BuzzChannelNotFound(X.toString());
    }
  }

  @override
  void addEventBus<X>(TypedEventBus<X> streamBus) {
    final typeModule = streamBus.runtimeType;
    if (_allStreamBuses.containsKey(typeModule)) return;
    _allStreamBuses[typeModule] = streamBus;
    buzzLog('INITIALIZED $typeModule');
  }
}
