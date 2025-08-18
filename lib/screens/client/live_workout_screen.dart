import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/models/exercise_model.dart';
import 'package:test_app/main.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';
import 'package:test_app/models/workout_log_model.dart';
import 'package:test_app/screens/admin/exercise_library_screen.dart';

class LiveWorkoutScreen extends ConsumerStatefulWidget {
  const LiveWorkoutScreen({super.key});

  @override
  ConsumerState<LiveWorkoutScreen> createState() => _LiveWorkoutScreenState();
}

class _LiveWorkoutScreenState extends ConsumerState<LiveWorkoutScreen> {
  final _formKey = GlobalKey<FormState>();
  ExerciseModel? _selectedExercise;
  final TextEditingController _setsController = TextEditingController();
  final TextEditingController _repsController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();

  final List<Map<String, dynamic>> _workoutExercises = [];

  @override
  void dispose() {
    _setsController.dispose();
    _repsController.dispose();
    _weightController.dispose();
    _durationController.dispose();
    super.dispose();
  }

  void _addExerciseToWorkout() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _workoutExercises.add({
          'exercise': _selectedExercise,
          'sets': int.parse(_setsController.text),
          'reps': int.parse(_repsController.text),
          'weight': double.parse(_weightController.text),
          'duration': _durationController.text.isNotEmpty ? double.parse(_durationController.text) : null,
        });
        _selectedExercise = null;
        _setsController.clear();
        _repsController.clear();
        _weightController.clear();
        _durationController.clear();
      });
    }
  }

  void _saveWorkout() async {
    if (_workoutExercises.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please add at least one exercise to save the workout.')),
      );
      return;
    }

    final databaseService = ref.read(databaseServiceProvider);
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User not logged in. Cannot save workout.')),
      );
      return;
    }

    // Create WorkoutLogModel
    final workoutLogId = const Uuid().v4();
    final List<String> exerciseLogIds = []; // This will store IDs of ExerciseInPlanModel or similar

    // For simplicity, let's assume we are just storing the exercise details directly in the log for now.
    // In a real app, you might create ExerciseInPlanModel and WorkoutSetModel instances.
    // For now, I'll just store the raw data in the workout log.
    // This part needs to be refined based on the actual data model for workout logs.

    // Let's assume `exerciseLogs` will store a JSON string representation of each exercise entry.
    final List<String> exerciseLogs = _workoutExercises.map((e) => jsonEncode({
      'exerciseId': (e['exercise'] as ExerciseModel).id,
      'sets': e['sets'],
      'reps': e['reps'],
      'weight': e['weight'],
      'duration': e['duration'],
    })).toList();


    final workoutLog = WorkoutLogModel(
      id: workoutLogId,
      userId: user.uid,
      templateId: 'manual_workout', // Assuming a default template ID for manual workouts
      date: DateTime.now(),
      exerciseLogs: exerciseLogs,
      editHistory: [], // No edit history for new log
    );

    try {
      await databaseService.saveWorkoutLog(workoutLog);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Workout saved successfully!')),
      );
      Navigator.pop(context); // Go back to LogbookScreen
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save workout: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final exercisesAsyncValue = ref.watch(exercisesProvider); // Assuming exercisesProvider is available

    return Scaffold(
      appBar: AppBar(
        title: const Text('Log New Workout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  exercisesAsyncValue.when(
                    data: (exercises) {
                      return DropdownButtonFormField<ExerciseModel>(
                        value: _selectedExercise,
                        hint: const Text('Select Exercise'),
                        onChanged: (ExerciseModel? newValue) {
                          setState(() {
                            _selectedExercise = newValue;
                          });
                        },
                        items: exercises.map<DropdownMenuItem<ExerciseModel>>((ExerciseModel exercise) {
                          return DropdownMenuItem<ExerciseModel>(
                            value: exercise,
                            child: Text(exercise.name),
                          );
                        }).toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'Please select an exercise';
                          }
                          return null;
                        },
                      );
                    },
                    loading: () => const CircularProgressIndicator(),
                    error: (error, stack) => Text('Error loading exercises: $error'),
                  ),
                  TextFormField(
                    controller: _setsController,
                    decoration: const InputDecoration(labelText: 'Sets'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter sets';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _repsController,
                    decoration: const InputDecoration(labelText: 'Reps'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter reps';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _weightController,
                    decoration: const InputDecoration(labelText: 'Weight (kg)'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter weight';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _durationController,
                    decoration: const InputDecoration(labelText: 'Duration (minutes, optional)'),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _addExerciseToWorkout,
                    child: const Text('Add Exercise to Workout'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _workoutExercises.length,
                itemBuilder: (context, index) {
                  final exerciseData = _workoutExercises[index];
                  final exercise = exerciseData['exercise'] as ExerciseModel;
                  return ListTile(
                    title: Text(exercise.name),
                    subtitle: Text('Sets: ${exerciseData['sets']}, Reps: ${exerciseData['reps']}, Weight: ${exerciseData['weight']}kg'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          _workoutExercises.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _saveWorkout,
              child: const Text('Save Workout'),
            ),
          ],
        ),
      ),
    );
  }
}