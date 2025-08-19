import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/providers/providers.dart'; // Central providers file
import 'package:test_app/screens/admin/add_edit_workout_template_screen.dart';

class WorkoutTemplateEditorScreen extends ConsumerWidget {
  const WorkoutTemplateEditorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final templatesAsync = ref.watch(workoutTemplatesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Templates'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.refresh(workoutTemplatesProvider),
          ),
        ],
      ),
      body: templatesAsync.when(
        data: (templates) {
          if (templates.isEmpty) {
            return const Center(child: Text('No templates found. Add one!'));
          }
          return ListView.builder(
            itemCount: templates.length,
            itemBuilder: (context, index) {
              final template = templates[index];
              return ListTile(
                title: Text(template.name),
                subtitle: Text(template.description),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddEditWorkoutTemplateScreen(template: template),
                  )).then((_) => ref.refresh(workoutTemplatesProvider));
                },
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
            builder: (context) => const AddEditWorkoutTemplateScreen(),
          )).then((_) => ref.refresh(workoutTemplatesProvider));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}