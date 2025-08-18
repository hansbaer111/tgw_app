import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/models/client_plan_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_app/providers/providers.dart'; // Import providers

final clientPlansProvider = FutureProvider<List<ClientPlanModel>>((ref) async {
  final databaseService = ref.read(databaseServiceProvider);
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) return [];
  return databaseService.getClientPlans(user.uid); // Assuming this method exists
});

class TrainingPlansScreen extends ConsumerStatefulWidget {
  const TrainingPlansScreen({super.key});

  @override
  ConsumerState<TrainingPlansScreen> createState() => _TrainingPlansScreenState();
}

class _TrainingPlansScreenState extends ConsumerState<TrainingPlansScreen> {
  @override
  Widget build(BuildContext context) {
    final clientPlansAsyncValue = ref.watch(clientPlansProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Training Plans'),
      ),
      body: clientPlansAsyncValue.when(
        data: (plans) {
          if (plans.isEmpty) {
            return const Center(child: Text('No training plans assigned yet.'));
          }
          return ListView.builder(
            itemCount: plans.length,
            itemBuilder: (context, index) {
              final plan = plans[index];
              return ListTile(
                title: Text('Plan from ${plan.startDate.toLocal().toString().split(' ')[0]} to ${plan.endDate.toLocal().toString().split(' ')[0]}'),
                subtitle: Text('Client ID: ${plan.clientId}'),
                onTap: () {
                  // TODO: Navigate to plan details screen
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
