import 'dart:isolate';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/mocks.dart';

void main() {
  test('✅ Isolate returns mocked service result', () async {
    final receivePort = ReceivePort();
    final token = RootIsolateToken.instance!;
    final mockService = MockInitService();

    when(() => mockService.initialize()).thenAnswer(
      (_) async {
        await Future.delayed(Duration(milliseconds: 500));
        return '✅ Mocked Init Complete';
      },
    );

    await Isolate.spawn<MockParams>(
      _mockedIsolateFunction,
      MockParams(
          sendPort: receivePort.sendPort, token: token, service: mockService),
      debugName: 'mocked_isolate',
      onError: receivePort.sendPort,
      onExit: receivePort.sendPort,
    );

    final result = await receivePort.first.timeout(
      Duration(seconds: 3),
      onTimeout: () => '❌ TIMEOUT',
    );

    expect(result, equals('✅ Mocked Init Complete'));
  });
}

/// Fonction de test simulant l'exécution dans un isolate
Future<void> _mockedIsolateFunction(MockParams params) async {
  BackgroundIsolateBinaryMessenger.ensureInitialized(params.token);

  final result = await params.service.initialize();
  params.sendPort.send(result);
}
