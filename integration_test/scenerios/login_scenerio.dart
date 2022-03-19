import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import '../robots/robots.dart';

void main() {
  late FlutterDriver driver;
  late LoginRobot loginRobot;
  late HomeRobot homeRobot;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
    loginRobot = LoginRobot(driver);
    homeRobot = HomeRobot(driver);
  });

  tearDownAll(() async {
    await driver.close();
  });

  group('Login', () {
    test('display error message when no login information is provided',
        () async {
      await homeRobot.goToLoginPage();
      await loginRobot.onLoginClicked();
      await loginRobot.checkInvalidCredentialsSnackBar();
    });

    test('login a user when email and password are provided', () async {
      await loginRobot.enterEmail('samuel@mailinator.com');
      await loginRobot.enterPassword('+449404');
      await loginRobot.onLoginClicked();
      await loginRobot.checkSuccessfulLoginSnackBar('samuel@mailinator.com');
    });
  });
}
