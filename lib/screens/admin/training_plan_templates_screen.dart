import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/models/workout_template_model.dart';
import 'package:test_app/main.dart';

final workoutTemplatesProvider = FutureProvider<List<WorkoutTemplateModel>>((ref) async {
  final databaseService = ref.read(databaseServiceProvider);
  return databaseService.getWorkoutTemplates(); // Assuming this method exists
});

class TrainingPlanTemplatesScreen extends ConsumerStatefulWidget {
  const TrainingPlanTemplatesScreen({super.key});

  @override
  ConsumerState<TrainingPlanTemplatesScreen> createState() => _TrainingPlanTemplatesScreenState();
}

class _TrainingPlanTemplatesScreenState extends ConsumerState<TrainingPlanTemplatesScreen> {
  @override
  Widget build(BuildContext context) {
    final workoutTemplatesAsyncValue = ref.watch(workoutTemplatesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Training Plan Templates'),
      ),
      body: workoutTemplatesAsyncValue.when(
        data: (templates) {
          if (templates.isEmpty) {
            return const Center(child: Text('No training plan templates found.'));
          }
          return ListView.builder(
            itemCount: templates.length,
            itemBuilder: (context, index) {
              final template = templates[index];
              return ListTile(
                title: Text(template.name),
                subtitle: Text(template.description ?? 'No description'),
                onTap: () {
                  // TODO: Navigate to template details screen
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
          // TODO: Implement add new template functionality
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}