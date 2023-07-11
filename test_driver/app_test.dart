import 'dart:developer';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('a test group', () {
    final buttonFinder = find.byValueKey("Test_Button");

    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver!.close();
      }
    });
    test('check health', () async {
      Health health = await driver!.checkHealth();

      log('${health.status}');
    });

    test('flutter drive test', () async {
      await driver!.tap(buttonFinder);
    });
  });
}
