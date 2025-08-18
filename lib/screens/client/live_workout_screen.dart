import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/models/day_model.dart'; // Import DayModel
import 'package:test_app/models/exercise_model.dart';
import 'package:test_app/providers/providers.dart'; // Import providers
import 'package:uuid/uuid.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_app/models/workout_log_model.dart';
import 'package:test_app/models/workout_set_model.dart'; // Import WorkoutSetModel

class LiveWorkoutScreen extends ConsumerStatefulWidget {
  final DayModel day; // Required DayModel parameter
  const LiveWorkoutScreen({super.key, required this.day});

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
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please add at least one exercise to save the workout.')),
      );
      return;
    }

    final databaseService = ref.read(databaseServiceProvider);
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User not logged in. Cannot save workout.')),
      );
      return;
    }

    // Create WorkoutLogModel
    final workoutLogId = const Uuid().v4();

    List<WorkoutLogModel> logsToSave = [];
    for (var entry in _workoutExercises) {
      final exercise = entry['exercise'] as ExerciseModel;
      final sets = [
        WorkoutSetModel(
          setNumber: 1, // Assuming one set for simplicity, adjust as needed
          reps: entry['reps'].toString(),
          rpe: 'N/A', // RPE not captured in UI, setting to N/A
        )
      ];

      logsToSave.add(WorkoutLogModel(
        id: const Uuid().v4(), // New ID for each log entry
        userId: user.uid,
        dayId: widget.day.name, // Use the day name from DayModel
        exerciseId: exercise.id,
        date: DateTime.now(),
        sets: sets,
        notes: 'Manual workout entry for ${widget.day.name}', // Placeholder
        editHistory: [],
      ));
    }

    try {
      for (var log in logsToSave) {
        await databaseService.saveWorkoutLog(log);
      }
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Workout saved successfully!')),
      );
      Navigator.pop(context); // Go back to LogbookScreen
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save workout: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final exercisesAsyncValue = ref.watch(globalExercisesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Workout for ${widget.day.name}'), // Display workout day name
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