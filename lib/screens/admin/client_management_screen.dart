import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/providers/providers.dart'; // Central providers file
import 'package:test_app/screens/admin/assign_plan_screen.dart';
import 'package:test_app/widgets/admin/update_client_status_dialog.dart';
import 'package:test_app/screens/client/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_app/models/user_model.dart';

class ClientManagementScreen extends ConsumerWidget {
  const ClientManagementScreen({super.key});

  void _showUpdateStatusDialog(BuildContext context, WidgetRef ref, UserModel client) {
    showDialog(
      context: context,
      builder: (context) => UpdateClientStatusDialog(
        client: client,
        onStatusChanged: (newStatus) async {
          await ref.read(databaseServiceProvider).updateUserStatus(client.uid, newStatus);
          ref.refresh(allUsersProvider);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsync = ref.watch(allUsersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Client Management'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.refresh(allUsersProvider),
          ),
        ],
      ),
      body: usersAsync.when(
        data: (users) {
          final clients = users.where((user) => user.role == 'client').toList();
          if (clients.isEmpty) {
            return const Center(child: Text('No clients found.'));
          }
          return ListView.builder(
            itemCount: clients.length,
            itemBuilder: (context, index) {
              final client = clients[index];
              return ListTile(
                title: Text(client.displayName),
                subtitle: Text(client.email),
                onTap: () => _showUpdateStatusDialog(context, ref, client),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Chip(
                      label: Text(client.status),
                      backgroundColor: client.status == 'active' ? Colors.green : (client.status == 'pending' ? Colors.orange : Colors.red),
                    ),
                    IconButton(
                      icon: const Icon(Icons.chat_bubble_outline),
                      onPressed: () {
                        // TODO: Get admin ID dynamically
                        final adminId = FirebaseAuth.instance.currentUser!.uid;
                                                  final conversationId = '${client.uid}_$adminId'; // Assuming admin is always the second part
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ChatScreen(
                            conversationId: conversationId,
                            recipientName: client.displayName,
                          ),
                        ));
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AssignPlanScreen(),
          ));
        },
        tooltip: 'Assign Plan',
        child: const Icon(Icons.assignment_ind),
      ),
    );
  }
}