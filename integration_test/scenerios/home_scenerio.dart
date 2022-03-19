import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import '../robots/robots.dart';

void main() {
  late FlutterDriver driver;
  late HomeRobot homeRobot;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
    homeRobot = HomeRobot(driver);
  });

  tearDownAll(() async {
    await driver.close();
  });

  group('Home', () {
    test('confirm a user is on home screen', () async {
      await homeRobot.assertUserIsOnTheHomeScreen();
    });
  });
}
