import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:test_app/providers/providers.dart'; // Central providers file
import 'package:test_app/screens/client/workout_log_detail_screen.dart';

class LogbookScreen extends ConsumerWidget {
  const LogbookScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logsAsync = ref.watch(workoutLogsStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Logbook'),
      ),
      body: logsAsync.when(
        data: (logs) {
          if (logs.isEmpty) {
            return const Center(child: Text('No workouts logged yet.'));
          }
          return ListView.builder(
            itemCount: logs.length,
            itemBuilder: (context, index) {
              final log = logs[index];
              return ListTile(
                title: Text(log.dayName),
                subtitle: Text(DateFormat.yMMMd().format(log.date)),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => WorkoutLogDetailScreen(log: log),
                  ));
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
