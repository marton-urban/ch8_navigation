import '../../providers/auth_state/auth_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Menu extends ConsumerWidget {
  const Menu({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        ListTile(
          title: const Text('View Kodeco'),
          onTap: () {},
        ),
        ListTile(
          title: const Text('Logout'),
          onTap: () => ref.read(authStateProvider.notifier).signOut(),
        )
      ],
    );
  }
}
