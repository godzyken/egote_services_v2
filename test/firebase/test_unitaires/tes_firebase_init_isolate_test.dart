import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/mocks.dart'; // ou un stub

void main() {
  setUpAll(() {
    registerFallbackValue(MockEnvironment());
  });
}
