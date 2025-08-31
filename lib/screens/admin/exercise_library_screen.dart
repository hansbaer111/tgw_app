import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/providers/providers.dart'; // Central providers file
import 'package:test_app/screens/admin/add_edit_exercise_screen.dart';

class ExerciseLibraryScreen extends ConsumerWidget {
  const ExerciseLibraryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exercisesAsync = ref.watch(exercisesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise Library'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.refresh(exercisesProvider),
          ),
        ],
      ),
      body: exercisesAsync.when(
        data: (exercises) {
          if (exercises.isEmpty) {
            return const Center(child: Text('No exercises found. Add one!'));
          }
          return ListView.builder(
            itemCount: exercises.length,
            itemBuilder: (context, index) {
              final exercise = exercises[index];
              return ListTile(
                title: Text(exercise.name),
                subtitle: Text(exercise.tags.primaryMuscle),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddEditExerciseScreen(exercise: exercise),
                  )).then((_) => ref.refresh(exercisesProvider));
                },
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () async {
                    await ref.read(databaseServiceProvider).deleteExercise(exercise.exerciseId);
                    ref.refresh(exercisesProvider);
                  },
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
            builder: (context) => const AddEditExerciseScreen(),
          )).then((_) => ref.refresh(exercisesProvider));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}