import 'package:flutter/material.dart';

import 'login_page.dart';

void main() {
  runApp(const RobotPattern());
}

class RobotPattern extends StatelessWidget {
  const RobotPattern({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Robot Pattern')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const FlutterLogo(
              key: Key('flutterLogo'),
              size: 180,
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => Navigator.of(context).push(LoginPage.route),
              child: const Text('Go to Login'),
            ),
          ],
        ),
      ),
    );
  }
}
