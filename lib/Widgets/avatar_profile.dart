import 'package:flutter/material.dart';
import 'package:fitness_app/store/profile_store_singleton.dart';

class AvatarProfile extends StatelessWidget {
  const AvatarProfile({super.key, required this.avatar, required this.id});

  final String avatar;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          profileStore.setId(id);
          Navigator.of(context).pop();
        },
        child: CircleAvatar(radius: 40, child: Image.asset(avatar)),
      ),
    );
  }
}
