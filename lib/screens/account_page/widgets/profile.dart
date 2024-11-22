import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yummy/models/user.dart';

class Profile extends ConsumerWidget {
  const Profile(
    this.user, {
    super.key,
  });

  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        CircleAvatar(
          radius: 60.0, // Adjust the radius to change the size of the avatar
          backgroundImage: AssetImage(user.profileImageUrl),
        ),
        const SizedBox(height: 16.0),
        Text(
          user.firstName,
          style: const TextStyle(
            fontSize: 21,
          ),
        ),
        Text(user.role),
        Text(
          '${user.points} points',
        ),
      ],
    );
  }
}
