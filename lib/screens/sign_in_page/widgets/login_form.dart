import '../../providers/auth_state/auth_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginForm extends ConsumerWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/yummy_logo.png',
            height: 150,
            width: 150,
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              // filled: true,
              hintText: 'Username',
              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(8.0), // Rounded corner border
              ),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              // filled: true,
              hintText: 'Password',
              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(8.0), // Rounded corner border
              ),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            child: const Text('Login'),
            onPressed: () {
              ref.read(authStateProvider.notifier).signIn(
                  _usernameController.value.text,
                  _passwordController.value.text);
            },
          ),
        ],
      ),
    );
  }
}
