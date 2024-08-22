import 'package:flutter/material.dart';
import '../models/user.dart';

class UserListItem extends StatelessWidget {
  final User user;
  final VoidCallback onTap;

  const UserListItem({Key? key, required this.user, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user.name ?? 'N/A'),
      subtitle: Text(user.email ?? 'N/A'),
      trailing: Text(user.username ?? 'N/A'),
      onTap: onTap,
    );
  }
}

