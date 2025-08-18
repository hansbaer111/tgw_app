import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/providers/providers.dart';
import 'package:test_app/screens/admin/create_edit_exercise_screen.dart'; // Reusing for now, will be a dedicated ExerciseDetailScreen

class LogbuchTab extends ConsumerWidget {
  const LogbuchTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exerciseStatsAsyncValue = ref.watch(logbuchProvider);

    return Scaffold(
      body: exerciseStatsAsyncValue.when(
        data: (stats) {
          if (stats.isEmpty) {
            return const Center(child: Text('No exercise stats found.'));
          }
          return ListView.builder(
            itemCount: stats.length,
            itemBuilder: (context, index) {
              final stat = stats[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: ListTile(
                  title: Text('Exercise ID: ${stat.exerciseId}'), // Will replace with actual exercise name
                  subtitle: Text(
                      'Max Weight: ${stat.maxWeight.toStringAsFixed(2)}kg, ' 
                      'Total Reps: ${stat.totalReps}, ' 
                      'Total Sets: ${stat.totalSets}'),
                  onTap: () {
                    // TODO: Navigate to ExerciseDetailScreen, passing exerciseId
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateEditExerciseScreen(exercise: null), // Pass null for exercise
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}