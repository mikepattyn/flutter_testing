import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  TestWidgetsFlutterBinding.ensureInitialized();
  group('flutter_testing', skip: true, () {
    testWidgets('can click', (tester) async {
      var buttonFinder = find.byKey(const Key("Test_Button"));
      tester.tap(buttonFinder);
    });
  });
}
