import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/models/exercise_model.dart';
import 'package:test_app/main.dart';

final exercisesProvider = FutureProvider<List<ExerciseModel>>((ref) async {
  final databaseService = ref.read(databaseServiceProvider);
  return databaseService.getExercises(); // Assuming this method exists
});

class ExerciseLibraryScreen extends ConsumerStatefulWidget {
  const ExerciseLibraryScreen({super.key});

  @override
  ConsumerState<ExerciseLibraryScreen> createState() => _ExerciseLibraryScreenState();
}

class _ExerciseLibraryScreenState extends ConsumerState<ExerciseLibraryScreen> {
  @override
  Widget build(BuildContext context) {
    final exercisesAsyncValue = ref.watch(exercisesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise Library'),
      ),
      body: exercisesAsyncValue.when(
        data: (exercises) {
          if (exercises.isEmpty) {
            return const Center(child: Text('No exercises found.'));
          }
          return ListView.builder(
            itemCount: exercises.length,
            itemBuilder: (context, index) {
              final exercise = exercises[index];
              return ListTile(
                title: Text(exercise.name),
                subtitle: Text(exercise.description ?? 'No description'),
                trailing: Text(exercise.tags.join(', ')),
                onTap: () {
                  // TODO: Navigate to exercise details screen
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
          // TODO: Implement add new exercise functionality
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}