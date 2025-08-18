import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_app/providers/providers.dart';
import 'package:test_app/screens/client/chat_screen.dart'; // Import ChatScreen

class ProfileTab extends ConsumerWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfileAsyncValue = ref.watch(userProvider(FirebaseAuth.instance.currentUser!.uid));
    final adminAttributesAsyncValue = ref.watch(adminAttributesProvider);

    return Scaffold(
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
                const SizedBox(height: 20),
                const Text(
                  'My Equipment:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                adminAttributesAsyncValue.when(
                  data: (attributes) {
                    if (attributes.equipmentTypes.isEmpty) {
                      return const Text('No equipment added yet.');
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: attributes.equipmentTypes
                          .map((e) => Text('- ${e.name}'))
                          .toList(),
                    );
                  },
                  loading: () => const CircularProgressIndicator(),
                  error: (error, stack) => Text('Error loading equipment: $error'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    // For simplicity, assuming a fixed admin ID for conversation
                    final adminId = 'admin_uid_placeholder'; // Replace with actual admin UID
                    final currentUserUid = FirebaseAuth.instance.currentUser!.uid;
                    final conversationId = currentUserUid.compareTo(adminId) < 0
                        ? '${currentUserUid}_$adminId'
                        : '${adminId}_$currentUserUid';

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(
                          conversationId: conversationId,
                          recipientName: 'Coach', // Or fetch admin's display name
                        ),
                      ),
                    );
                  },
                  child: const Text('Nachricht an Coach'),
                ),
                const SizedBox(height: 10),
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