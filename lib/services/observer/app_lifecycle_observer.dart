import 'dart:async';
import 'package:base_flutter/base.dart';

class AppLifecycleObserver extends WidgetsBindingObserver {
  static final AppLifecycleObserver _observer = AppLifecycleObserver._internal();

  AppLifecycleObserver._internal();

  factory AppLifecycleObserver() => _observer;

  final _streamController = StreamController<AppLifecycleState>.broadcast();

  Stream<AppLifecycleState> get status async* {
    yield* _streamController.stream;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    debugPrint('state = $state');
    _streamController.add(state);
  }
}
