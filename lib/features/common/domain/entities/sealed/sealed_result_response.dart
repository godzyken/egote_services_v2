import 'dart:async';

class DurationTimer {
  int duration = 0;

  Timer? _durationTimer;
  final StreamController<int> _durationStreamController =
      StreamController.broadcast();

  Stream<int> get durationStream => _durationStreamController.stream;

  start() {
    _durationTimer ??=
        Timer.periodic(const Duration(seconds: 1), (timer) async {
      duration++;
      _durationStreamController.add(duration);
    });
  }

  stop() {
    _durationTimer?.cancel();
    _durationTimer = null;
  }

  dispose() {
    _durationTimer?.cancel();
    _durationTimer = null;
    duration = 0;
  }
}

/*
sealed class Result<S, E extends Exception> {
  const Result();
}

final class Success<S, E extends Exception> extends Result<S, E> {
  const Success(this.value);
  final S value;
}

final class Failure<S, E extends Exception> extends Result<S, E> {
  const Failure(this.exception);
  final E exception;
}*/
