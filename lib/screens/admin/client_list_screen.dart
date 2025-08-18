import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/screens/admin/client_detail_screen.dart';
import 'package:test_app/providers/providers.dart'; // Import providers
import 'package:test_app/services/database_service.dart'; // Import DatabaseService

class ClientListScreen extends ConsumerWidget {
  const ClientListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allUsersAsyncValue = ref.watch(allUsersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Client List'),
      ),
      body: allUsersAsyncValue.when(
        data: (users) {
          if (users.isEmpty) {
            return const Center(child: Text('No users found.'));
          }
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                title: Text(user.displayName),
                subtitle: Text('${user.email} - Status: ${user.status}'),
                trailing: user.status == 'pending'
                    ? ElevatedButton(
                        onPressed: () async {
                          await DatabaseService().updateUserStatus(user.uid, 'approved');
                          ref.refresh(allUsersProvider); // Refresh the list
                        },
                        child: const Text('Freischalten'),
                      )
                    : null,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ClientDetailScreen(userId: user.uid),
                    ),
                  );
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}