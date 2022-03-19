import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Route get route {
    return MaterialPageRoute(builder: (_) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Authentication')),
      body: const Padding(
        padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var _isLoading = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          style: const TextStyle(fontSize: 20),
          key: const Key('emailTextField'),
          decoration: const InputDecoration(hintText: 'Email'),
          keyboardType: TextInputType.emailAddress,
          controller: _emailController,
        ),
        const SizedBox(height: 8),
        TextFormField(
          style: const TextStyle(fontSize: 20),
          obscuringCharacter: '*',
          key: const Key('passwordTextField'),
          obscureText: true,
          decoration: const InputDecoration(hintText: 'Password'),
          controller: _passwordController,
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          height: 45,
          child: ElevatedButton(
            child: _isLoading
                ? const CircularProgressIndicator()
                : const Text('Login'),
            onPressed: _isLoading
                ? null
                : () async {
                    if (_emailController.text.isEmpty ||
                        _passwordController.text.isEmpty) {
                      _showSnackBar('Invalid credentials');
                      return;
                    }
                    setState(() {
                      _isLoading = true;
                    });
                    await Future.delayed(const Duration(seconds: 1));
                    setState(() {
                      _isLoading = false;
                    });
                    _showSnackBar('Welcome ${_emailController.text}');
                  },
          ),
        ),
        // if (_isLoading) const CircularProgressIndicator(),
      ],
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
          SnackBar(key: const Key('snackbar'), content: Text(message)));
  }
}
