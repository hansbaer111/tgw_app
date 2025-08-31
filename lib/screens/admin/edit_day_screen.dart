import 'package:flutter/material.dart';
import 'package:test_app/models/day_model.dart';
import 'package:test_app/models/exercise_in_plan_model.dart';
import 'package:test_app/models/exercise_model.dart';
import 'package:test_app/screens/admin/edit_exercise_in_plan_screen.dart';
import 'package:test_app/screens/admin/select_exercise_screen.dart';

class EditDayScreen extends StatefulWidget {
  final DayModel day;

  const EditDayScreen({super.key, required this.day});

  @override
  State<EditDayScreen> createState() => _EditDayScreenState();
}

class _EditDayScreenState extends State<EditDayScreen> {
  late TextEditingController _dayNameController;
  late List<ExerciseInPlanModel> _exercises;

  @override
  void initState() {
    super.initState();
    _dayNameController = TextEditingController(text: widget.day.name);
    _exercises = List.from(widget.day.exercises);
  }

  @override
  void dispose() {
    _dayNameController.dispose();
    super.dispose();
  }

  void _saveDay() {
    final updatedDay = widget.day.copyWith(
      name: _dayNameController.text,
      exercises: _exercises,
    );
    Navigator.of(context).pop(updatedDay);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Day: ${widget.day.name}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveDay,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _dayNameController,
              decoration: const InputDecoration(labelText: 'Day Name'),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Exercises', style: Theme.of(context).textTheme.titleLarge),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _exercises.length,
                      itemBuilder: (context, index) {
                        final exercise = _exercises[index];
                        return ListTile(
                          title: Text('Exercise ID: ${exercise.exerciseId}'), // Replace with actual exercise name
                          onTap: () async {
                            final updatedExercise = await Navigator.of(context).push<ExerciseInPlanModel>(
                              MaterialPageRoute(
                                builder: (context) => EditExerciseInPlanScreen(exerciseInPlan: exercise),
                              ),
                            );
                            if (updatedExercise != null) {
                              setState(() {
                                _exercises[index] = updatedExercise;
                              });
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final selectedExercise = await Navigator.of(context).push<ExerciseModel>(
            MaterialPageRoute(builder: (context) => const SelectExerciseScreen()),
          );
          if (selectedExercise != null) {
            setState(() {
              _exercises.add(ExerciseInPlanModel(
                exerciseId: selectedExercise.exerciseId,
                sets: [], // Default with empty sets
              ));
            });
          }
        },
        tooltip: 'Add Exercise',
        child: const Icon(Icons.add),
      ),
    );
  }
}
