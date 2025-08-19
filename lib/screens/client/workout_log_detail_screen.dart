import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_app/models/workout_log_model.dart';
import 'package:test_app/widgets/client/exercise_name_view.dart';

class WorkoutLogDetailScreen extends StatelessWidget {
  final WorkoutLogModel log;

  const WorkoutLogDetailScreen({super.key, required this.log});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${log.dayName} - ${DateFormat.yMMMd().format(log.date)}'),
      ),
      body: ListView.builder(
        itemCount: log.exercises.length,
        itemBuilder: (context, index) {
          final exercise = log.exercises[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ExerciseNameView(exerciseId: exercise.exerciseId),
                  const SizedBox(height: 16),
                  ...exercise.sets.asMap().entries.map((entry) {
                    final setIndex = entry.key;
                    final set = entry.value;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Set ${setIndex + 1}'),
                          Text('${set.reps} reps'),
                          Text('${set.weight} kg'),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}