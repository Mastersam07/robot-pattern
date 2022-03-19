import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

class LoginRobot {
  const LoginRobot(this.driver);

  final FlutterDriver driver;

  Future<void> enterEmail(String email) async {
    await driver.tap(find.byValueKey('emailTextField'));
    await driver.enterText(email);
  }

  Future<void> enterPassword(String password) async {
    await driver.tap(find.byValueKey('passwordTextField'));
    await driver.enterText(password);
  }

  Future<void> onLoginClicked() async {
    await driver.tap(find.text('Login'));
  }

  Future<void> checkInvalidCredentialsSnackBar() async {
    final errorFinder = find.byValueKey('snackbar');
    await driver.waitFor(errorFinder);
  }

  Future<void> checkSuccessfulLoginSnackBar(String email) async {
    final successFinder = find.text('Welcome $email');
    await driver.waitFor(successFinder);
    expect(await driver.getText(successFinder), 'Welcome $email');
  }
}
