import 'package:flutter/material.dart';
import 'widgets/login_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 700) {
            // Display Desktop View
            return Row(
              children: [
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset(
                      'assets/login_background.webp',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: FractionallySizedBox(
                      widthFactor: 0.70, child: LoginForm()),
                ),
              ],
            );
          } else {
            // Display Mobile View
            return Column(
              children: [
                Expanded(
                  child: LoginForm(),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
