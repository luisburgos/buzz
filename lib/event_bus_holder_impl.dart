import 'package:buzz/infra/typed_event_bus.dart';
import 'package:buzz/utils.dart';

import 'infra/event_bus_holder.dart';

class EventBusHolderImpl implements IEventBusHolder {
  final _allStreamBuses = <dynamic, TypedEventBus>{};

  @override
  void destroy() {
    _allStreamBuses.clear();
  }

  @override
  TypedEventBus forKind(dynamic type) {
    TypedEventBus? eventBus;

    for (var value in _allStreamBuses.values) {
      bool isSupported = value.isTypeSupported(type);
      if (isSupported) {
        eventBus = value;
      }

      if (eventBus != null) {
        break;
      }
    }

    if (eventBus != null) {
      return eventBus;
    } else {
      throw BusNotFound(type.toString());
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
      throw BusNotFound(X.toString());
    }
  }

  @override
  void addEventBus(TypedEventBus streamBus) {
    final typeModule = streamBus.runtimeType;
    if (!_allStreamBuses.containsKey(typeModule)) {
      _allStreamBuses[typeModule] = streamBus;
      developerLog('INITIALIZED $typeModule');
    }
  }
}
