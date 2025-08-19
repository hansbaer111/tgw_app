import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_app/models/day_model.dart';
import 'package:test_app/models/workout_log_model.dart';
import 'package:test_app/models/workout_set_model.dart';
import 'package:test_app/services/database_service.dart';
import 'package:test_app/widgets/client/exercise_name_view.dart';
import 'package:test_app/widgets/client/workout_set_tracker.dart';
import 'package:uuid/uuid.dart';

class LiveWorkoutScreen extends StatefulWidget {
  final DayModel day;

  const LiveWorkoutScreen({super.key, required this.day});

  @override
  State<LiveWorkoutScreen> createState() => _LiveWorkoutScreenState();
}

class _LiveWorkoutScreenState extends State<LiveWorkoutScreen> {
  // Map to store the performed sets for each exercise
  late Map<String, List<WorkoutSetModel>> _performedExercises;

  @override
  void initState() {
    super.initState();
    _performedExercises = {
      for (var exercise in widget.day.exercises) exercise.exerciseId: exercise.sets
    };
  }

  void _finishWorkout() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return; // Should not happen if user is logged in

    final completedExercises = _performedExercises.entries.map((entry) {
      return PerformedExercise(
        exerciseId: entry.key,
        sets: entry.value,
      );
    }).toList();

    final workoutLog = WorkoutLogModel(
      id: const Uuid().v4(),
      userId: userId,
      date: DateTime.now(),
      dayName: widget.day.name,
      exercises: completedExercises,
      editHistory: [],
    );

    await DatabaseService().saveWorkoutLog(workoutLog);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Workout saved successfully!')),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout: ${widget.day.name}'),
        actions: [
          TextButton(
            onPressed: _finishWorkout,
            child: const Text('FINISH', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: widget.day.exercises.length,
        itemBuilder: (context, index) {
          final exerciseInPlan = widget.day.exercises[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ExerciseNameView(exerciseId: exerciseInPlan.exerciseId),
                  const SizedBox(height: 16),
                  WorkoutSetTracker(
                    exerciseInPlan: exerciseInPlan,
                    onSetsChanged: (newSets) {
                      setState(() {
                        _performedExercises[exerciseInPlan.exerciseId] = newSets;
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}