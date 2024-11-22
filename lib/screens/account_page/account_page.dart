import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:yummy/models/user.dart';
import 'widgets/menu.dart';
import 'widgets/profile.dart';

class AccountPage extends ConsumerWidget {
  final User user;

  const AccountPage({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16.0),
            Profile(user),
            Expanded(
              child: Menu(),
            )
          ],
        ),
      ),
    );
  }
}
