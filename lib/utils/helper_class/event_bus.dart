import 'package:event_bus/event_bus.dart';

class EventBusListener {
  factory EventBusListener() => _getInstance();
  static EventBusListener? _instance;

  EventBusListener._internal();

  static EventBusListener get instance => _getInstance();

  static EventBusListener _getInstance() {
    _instance ??= EventBusListener._internal();
    return _instance!;
  }

  final _eventBus = EventBus();

  void fire(dynamic event) {
    _eventBus.fire(event);
  }

  Stream<T> on<T>() {
    return _eventBus.on<T>();
  }
}

class LogoutEventBus {
  LogoutEventBus();
}
