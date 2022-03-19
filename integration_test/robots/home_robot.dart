import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

class HomeRobot {
  const HomeRobot(this.driver);

  final FlutterDriver driver;

  Future<void> goToLoginPage() async {
    await driver.tap(find.text('Go to Login'));
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<void> assertUserIsOnTheHomeScreen() async {
    await driver.waitFor(find.byValueKey('flutterLogo'));
    expect(await driver.getText(find.text('Go to Login')), 'Go to Login');
  }
}
