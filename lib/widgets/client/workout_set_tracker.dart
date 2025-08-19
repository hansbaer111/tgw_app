import 'package:flutter/material.dart';
import 'package:test_app/models/exercise_in_plan_model.dart';
import 'package:test_app/models/workout_set_model.dart';

class WorkoutSetTracker extends StatefulWidget {
  final ExerciseInPlanModel exerciseInPlan;
  final Function(List<WorkoutSetModel>) onSetsChanged;

  const WorkoutSetTracker({
    super.key,
    required this.exerciseInPlan,
    required this.onSetsChanged,
  });

  @override
  State<WorkoutSetTracker> createState() => _WorkoutSetTrackerState();
}

class _WorkoutSetTrackerState extends State<WorkoutSetTracker> {
  late List<WorkoutSetModel> _performedSets;

  @override
  void initState() {
    super.initState();
    // Initialize performed sets based on the plan, but mark them as not completed
    _performedSets = widget.exerciseInPlan.sets
        .map((set) => set.copyWith(isCompleted: false))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(_performedSets.length, (index) {
        final set = _performedSets[index];
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Checkbox(
              value: set.isCompleted,
              onChanged: (bool? value) {
                setState(() {
                  _performedSets[index] = set.copyWith(isCompleted: value!);
                  widget.onSetsChanged(_performedSets);
                });
              },
            ),
            Text('Set ${index + 1}'),
            SizedBox(
              width: 80,
              child: TextFormField(
                initialValue: set.reps.toString(),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Reps'),
                onChanged: (value) {
                  final reps = int.tryParse(value) ?? 0;
                  _performedSets[index] = set.copyWith(reps: reps);
                  widget.onSetsChanged(_performedSets);
                },
              ),
            ),
            SizedBox(
              width: 80,
              child: TextFormField(
                initialValue: set.weight.toString(),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Weight (kg)'),
                onChanged: (value) {
                  final weight = double.tryParse(value) ?? 0;
                  _performedSets[index] = set.copyWith(weight: weight);
                  widget.onSetsChanged(_performedSets);
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}