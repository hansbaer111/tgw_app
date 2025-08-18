import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/providers/providers.dart'; // Import providers
import 'package:test_app/screens/admin/template_editor_screen.dart'; // Reusing for now, will be a dedicated exercise editor

class ExerciseManagementScreen extends ConsumerWidget {
  const ExerciseManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final globalExercises = ref.watch(globalExercisesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Übungs-Bibliothek'),
      ),
      body: globalExercises.when(
        data: (exercises) {
          return ListView.builder(
            itemCount: exercises.length,
            itemBuilder: (context, index) {
              final exercise = exercises[index];
              return ListTile(
                title: Text(exercise.name),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to a dedicated create/edit exercise screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TemplateEditorScreen(), // Placeholder for now
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}