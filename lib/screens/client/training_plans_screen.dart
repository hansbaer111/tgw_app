import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/providers/providers.dart'; // Central providers file
import 'package:test_app/screens/client/live_workout_screen.dart';

class TrainingPlansScreen extends ConsumerWidget {
  const TrainingPlansScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final planAsync = ref.watch(activePlanProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Training Plan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.refresh(activePlanProvider),
          )
        ],
      ),
      body: planAsync.when(
        data: (plan) {
          if (plan == null) {
            return const Center(child: Text('No active plan assigned.'));
          }
          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Text(plan.name, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 8),
              Text(plan.description),
              const SizedBox(height: 24),
              ...plan.days.map((day) {
                return Card(
                  child: ListTile(
                    title: Text(day.name),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LiveWorkoutScreen(day: day),
                      ));
                    },
                  ),
                );
              }).toList(),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}