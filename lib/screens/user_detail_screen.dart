import 'package:flutter/material.dart';
import '../models/user.dart';

class UserDetailScreen extends StatelessWidget {
  final User user;

  const UserDetailScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name ?? 'User Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${user.name ?? 'N/A'}'),
            const SizedBox(height: 8),
            Text('Username: ${user.username ?? 'N/A'}'),
            const SizedBox(height: 8),
            Text('Email: ${user.email ?? 'N/A'}'),
            const SizedBox(height: 8),
            Text('Phone: ${user.phone ?? 'N/A'}'),
            const SizedBox(height: 8),
            Text('Website: ${user.website ?? 'N/A'}'),
            const SizedBox(height: 16),
            const Text('Address:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Street: ${user.address?.street ?? 'N/A'}'),
            Text('Suite: ${user.address?.suite ?? 'N/A'}'),
            Text('City: ${user.address?.city ?? 'N/A'}'),
            Text('Zipcode: ${user.address?.zipcode ?? 'N/A'}'),
            const SizedBox(height: 16),
            const Text('Company:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Name: ${user.company?.name ?? 'N/A'}'),
            Text('Catch Phrase: ${user.company?.catchPhrase ?? 'N/A'}'),
            Text('BS: ${user.company?.bs ?? 'N/A'}'),
          ],
        ),
      ),
    );
  }
}