import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/main.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  TestWidgetsFlutterBinding.ensureInitialized();
  group('flutter_testing', () {
    testWidgets('can click', (tester) async {
      await tester.pumpWidget(const MyApp());
      var buttonFinder = find.byKey(const Key("Test_Button"));
      expect(buttonFinder, findsOneWidget);
      await tester.tap(buttonFinder);
      await tester.tap(buttonFinder);
      await tester.tap(buttonFinder);
      await tester.tap(buttonFinder);
    });
  });
}
