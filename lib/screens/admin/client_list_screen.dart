import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/screens/admin/client_detail_screen.dart';
import 'package:test_app/providers/providers.dart'; // Import providers

class ClientListScreen extends ConsumerWidget {
  const ClientListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Client List'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Client 1'),
            subtitle: const Text('client1@example.com'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ClientDetailScreen(userId: 'client1_id'),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Client 2'),
            subtitle: const Text('client2@example.com'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ClientDetailScreen(userId: 'client2_id'),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Client 3'),
            subtitle: const Text('client3@example.com'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ClientDetailScreen(userId: 'client3_id'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
