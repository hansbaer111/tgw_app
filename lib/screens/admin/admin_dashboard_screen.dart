import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/providers/providers.dart'; // Central providers file

class AdminDashboardScreen extends ConsumerWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalClientsAsync = ref.watch(totalClientsProvider);
    final totalWorkoutsLoggedAsync = ref.watch(totalWorkoutsLoggedProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome, Admin!', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Overview', style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 16),
                    totalClientsAsync.when(
                      data: (count) => Text('Total Clients: $count', style: Theme.of(context).textTheme.titleMedium),
                      loading: () => const CircularProgressIndicator(),
                      error: (e, s) => Text('Error loading total clients: $e'),
                    ),
                    const SizedBox(height: 8),
                    totalWorkoutsLoggedAsync.when(
                      data: (count) => Text('Total Workouts Logged: $count', style: Theme.of(context).textTheme.titleMedium),
                      loading: () => const CircularProgressIndicator(),
                      error: (e, s) => Text('Error loading total workouts: $e'),
                    ),
                  ],
                ),
              ),
            ),
            // TODO: Add more dashboard widgets (e.g., recent activities, pending approvals)
          ],
        ),
      ),
    );
  }
}