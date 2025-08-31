import 'package:flutter/material.dart';
import 'package:test_app/models/exercise_in_plan_model.dart';
import 'package:test_app/models/workout_set_model.dart';

class EditExerciseInPlanScreen extends StatefulWidget {
  final ExerciseInPlanModel exerciseInPlan;

  const EditExerciseInPlanScreen({super.key, required this.exerciseInPlan});

  @override
  State<EditExerciseInPlanScreen> createState() => _EditExerciseInPlanScreenState();
}

class _EditExerciseInPlanScreenState extends State<EditExerciseInPlanScreen> {
  late List<WorkoutSetModel> _sets;

  @override
  void initState() {
    super.initState();
    _sets = List.from(widget.exerciseInPlan.sets);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _saveSets() {
    final updatedExerciseInPlan = widget.exerciseInPlan.copyWith(sets: _sets);
    Navigator.of(context).pop(updatedExerciseInPlan);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Exercise Sets'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveSets,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _sets.length,
        itemBuilder: (context, index) {
          final set = _sets[index];
          return ListTile(
            title: Text('Set ${index + 1}'),
            subtitle: Text('Reps: ${set.reps}, Weight: ${set.weight}kg'), // Example
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  _sets.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Add a new set
          setState(() {
            _sets.add(WorkoutSetModel(setNumber: _sets.length + 1, reps: 10, weight: 50)); // Example set
          });
        },
        tooltip: 'Add Set',
        child: const Icon(Icons.add),
      ),
    );
  }
}
