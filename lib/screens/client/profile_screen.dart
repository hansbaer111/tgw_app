import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_app/models/user_model.dart';
import 'package:test_app/providers/providers.dart'; // Import providers

final userProfileProvider = FutureProvider<UserModel?>((ref) async {
  final databaseService = ref.read(databaseServiceProvider);
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) return null;
  return databaseService.getUser(user.uid);
});

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final userProfileAsyncValue = ref.watch(userProfileProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: userProfileAsyncValue.when(
        data: (userModel) {
          if (userModel == null) {
            return const Center(child: Text('User profile not found.'));
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Display Name: ${userModel.displayName}', style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 8),
                Text('Email: ${userModel.email}', style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 8),
                Text('Role: ${userModel.role}', style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 8),
                Text('Status: ${userModel.status}', style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                  },
                  child: const Text('Logout'),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
