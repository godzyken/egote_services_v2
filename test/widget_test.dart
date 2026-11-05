import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App smoke test placeholder', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: Center(child: Text('Egote Services Hub'))),
      ),
    );

    expect(find.text('Egote Services Hub'), findsOneWidget);
  });
}
