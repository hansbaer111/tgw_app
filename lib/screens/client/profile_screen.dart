import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/providers/providers.dart'; // Central providers file

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = FirebaseAuth.instance.currentUser;
    final userModelAsync = ref.watch(userProvider(user!.uid));

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: userModelAsync.when(
        data: (userModel) => ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            ListTile(
              title: const Text('Name'),
              subtitle: Text(userModel.displayName),
            ),
            ListTile(
              title: const Text('Email'),
              subtitle: Text(userModel.email),
            ),
            ListTile(
              title: const Text('Status'),
              subtitle: Text(userModel.status),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => FirebaseAuth.instance.signOut(),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Logout'),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
