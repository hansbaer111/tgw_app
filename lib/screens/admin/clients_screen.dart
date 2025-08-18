import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/models/user_model.dart';
import 'package:test_app/main.dart';

final clientsProvider = FutureProvider<List<UserModel>>((ref) async {
  final databaseService = ref.read(databaseServiceProvider);
  return databaseService.getClients(); // Assuming this method exists
});

class ClientsScreen extends ConsumerStatefulWidget {
  const ClientsScreen({super.key});

  @override
  ConsumerState<ClientsScreen> createState() => _ClientsScreenState();
}

class _ClientsScreenState extends ConsumerState<ClientsScreen> {
  @override
  Widget build(BuildContext context) {
    final clientsAsyncValue = ref.watch(clientsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Clients'),
      ),
      body: clientsAsyncValue.when(
        data: (clients) {
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
                trailing: Text(client.status),
                onTap: () {
                  // TODO: Navigate to client details screen
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement add new client functionality
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}