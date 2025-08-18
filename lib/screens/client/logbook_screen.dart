import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/models/workout_log_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_app/providers/providers.dart'; // Import providers
import 'package:test_app/screens/client/live_workout_screen.dart';

class LogbookScreen extends ConsumerStatefulWidget {
  const LogbookScreen({super.key});

  @override
  ConsumerState<LogbookScreen> createState() => _LogbookScreenState();
}

class _LogbookScreenState extends ConsumerState<LogbookScreen> {
  @override
  Widget build(BuildContext context) {
    final workoutLogsAsyncValue = ref.watch(workoutLogsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Workout Log'),
      ),
      body: workoutLogsAsyncValue.when(
        data: (logs) {
          if (logs.isEmpty) {
            return const Center(child: Text('No workout logs found.'));
          }
          return ListView.builder(
            itemCount: logs.length,
            itemBuilder: (context, index) {
              final log = logs[index];
              return ListTile(
                title: Text('Workout on ${log.date.toLocal().toString().split(' ')[0]}'),
                subtitle: Text('Exercise: ${log.exerciseId}'), // Using exerciseId instead of templateId
                onTap: () {
                  // TODO: Navigate to workout log details screen
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LiveWorkoutScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
