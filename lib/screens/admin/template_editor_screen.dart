import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/models/day_model.dart';
import 'package:test_app/models/exercise_in_plan_model.dart';
import 'package:test_app/models/workout_set_model.dart';
import 'package:test_app/models/workout_template_model.dart';
import 'package:test_app/providers/providers.dart'; // Import providers
import 'package:test_app/screens/admin/workup_generator_dialog.dart'; // Import WorkupGeneratorDialog
import 'package:test_app/screens/admin/rotation_block_dialog.dart'; // Import RotationBlockDialog
import 'package:uuid/uuid.dart';

class TemplateEditorScreen extends ConsumerStatefulWidget {
  final String? templateId;
  const TemplateEditorScreen({Key? key, this.templateId}) : super(key: key);

  @override
  _TemplateEditorScreenState createState() => _TemplateEditorScreenState();
}

class _TemplateEditorScreenState extends ConsumerState<TemplateEditorScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _templateNameController = TextEditingController();
  final TextEditingController _templateDescriptionController = TextEditingController();
  List<DayModel> _days = []; // List to hold days in the template

  @override
  void initState() {
    super.initState();
    if (widget.templateId != null) {
      // TODO: Fetch existing template data and populate controllers/days
    } else {
      // Initialize with a default day
      _days.add(DayModel(name: 'Day 1', exercises: []));
    }
  }

  @override
  void dispose() {
    _templateNameController.dispose();
    _templateDescriptionController.dispose();
    super.dispose();
  }

  void _addDay() {
    setState(() {
      _days.add(DayModel(name: 'Day ${_days.length + 1}', exercises: []));
    });
  }

  void _removeDay(int index) async {
    final bool? confirm = await _confirmDelete(context, _days[index].name);
    if (confirm == true) {
      setState(() {
        _days.removeAt(index);
      });
    }
  }

  void _addExerciseToDay(int dayIndex) {
    setState(() {
      _days[dayIndex].exercises.add(ExerciseInPlanModel(exerciseId: '', sets: []));
    });
  }

  void _removeExerciseFromDay(int dayIndex, int exerciseIndex) async {
    final bool? confirm = await _confirmDelete(context, 'Exercise ${exerciseIndex + 1}');
    if (confirm == true) {
      setState(() {
        _days[dayIndex].exercises.removeAt(exerciseIndex);
      });
    }
  }

  void _addSetToExercise(int dayIndex, int exerciseIndex) {
    setState(() {
      _days[dayIndex].exercises[exerciseIndex].sets.add(WorkoutSetModel(setNumber: _days[dayIndex].exercises[exerciseIndex].sets.length + 1, reps: '', rpe: ''));
    });
  }

  void _removeSetFromExercise(int dayIndex, int exerciseIndex, int setIndex) async {
    final bool? confirm = await _confirmDelete(context, 'Set ${setIndex + 1}');
    if (confirm == true) {
      setState(() {
        _days[dayIndex].exercises[exerciseIndex].sets.removeAt(setIndex);
      });
    }
  }

  void _saveTemplate() async { // Made async
    if (_formKey.currentState!.validate()) {
      final newTemplate = WorkoutTemplateModel(
        id: widget.templateId ?? const Uuid().v4(),
        name: _templateNameController.text,
        description: _templateDescriptionController.text,
        days: _days,
      );
      try {
        await ref.read(databaseServiceProvider).saveWorkoutTemplate(newTemplate);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Template saved successfully!')),
        );
        Navigator.pop(context); // Go back to template library
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save template: $e')),
        );
      }
    }
  }

  void _showWorkupGeneratorDialog() async {
    final generatedSets = await showDialog<List<WorkoutSetModel>>(
      context: context,
      builder: (context) => const WorkupGeneratorDialog(),
    );

    if (generatedSets != null && generatedSets.isNotEmpty) {
      // TODO: Add generated sets to the currently selected exercise/day
      // This requires knowing which exercise/day is currently active.
      // For now, just print the generated sets.
      print('Generated Sets: $generatedSets');
    }
  }

  void _showRotationBlockDialog() async {
    final generatedBlock = await showDialog<List<DayModel>>(
      context: context,
      builder: (context) => const RotationBlockDialog(),
    );

    if (generatedBlock != null && generatedBlock.isNotEmpty) {
      // TODO: Add generated block to the template
      // For now, just print the generated block.
      print('Generated Rotation Block: $generatedBlock');
    }
  }

  Future<bool?> _confirmDelete(BuildContext context, String itemName) async {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Delete'),
        content: Text('Are you sure you want to delete "$itemName"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final globalExercisesAsyncValue = ref.watch(globalExercisesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.templateId == null ? 'New Template' : 'Edit Template: ${widget.templateId}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _templateNameController,
                decoration: const InputDecoration(labelText: 'Template Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a template name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _templateDescriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: _days.length,
                  itemBuilder: (context, dayIndex) {
                    final day = _days[dayIndex];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  day.name,
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () => _removeDay(dayIndex),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: day.exercises.length,
                              itemBuilder: (context, exerciseIndex) {
                                final exerciseInPlan = day.exercises[exerciseIndex];
                                return Card(
                                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Exercise ${exerciseIndex + 1}'),
                                            IconButton(
                                              icon: const Icon(Icons.delete),
                                              onPressed: () => _removeExerciseFromDay(dayIndex, exerciseIndex),
                                            ),
                                          ],
                                        ),
                                        globalExercisesAsyncValue.when(
                                          data: (exercises) {
                                            return DropdownButtonFormField<String>(
                                              value: exerciseInPlan.exerciseId.isEmpty ? null : exerciseInPlan.exerciseId,
                                              hint: const Text('Select Exercise'),
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  _days[dayIndex].exercises[exerciseIndex] = exerciseInPlan.copyWith(exerciseId: newValue ?? '');
                                                });
                                              },
                                              items: exercises.map((exercise) {
                                                return DropdownMenuItem<String>(
                                                  value: exercise.id,
                                                  child: Text(exercise.name),
                                                );
                                              }).toList(),
                                              validator: (value) {
                                                if (value == null || value.isEmpty) {
                                                  return 'Please select an exercise';
                                                }
                                                return null;
                                              },
                                            );
                                          },
                                          loading: () => const CircularProgressIndicator(),
                                          error: (error, stack) => Text('Error loading exercises: $error'),
                                        ),
                                        const SizedBox(height: 10),
                                        const Text('Sets:'),
                                        ListView.builder(
                                          shrinkWrap: true,
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemCount: exerciseInPlan.sets.length,
                                          itemBuilder: (context, setIndex) {
                                            final workoutSet = exerciseInPlan.sets[setIndex];
                                            return Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: TextFormField(
                                                        initialValue: workoutSet.reps,
                                                        decoration: InputDecoration(labelText: 'Reps (Set ${workoutSet.setNumber})'),
                                                        keyboardType: TextInputType.number,
                                                        validator: (value) {
                                                          if (value == null || value.isEmpty) {
                                                            return 'Required';
                                                          }
                                                          if (int.tryParse(value) == null) {
                                                            return 'Invalid number';
                                                          }
                                                          return null;
                                                        },
                                                        onChanged: (value) {
                                                          setState(() {
                                                            exerciseInPlan.sets[setIndex] = workoutSet.copyWith(reps: value);
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                    SizedBox(width: 10),
                                                    Expanded(
                                                      child: TextFormField(
                                                        initialValue: workoutSet.rpe,
                                                        decoration: InputDecoration(labelText: 'RPE (Set ${workoutSet.setNumber})'),
                                                        keyboardType: TextInputType.number,
                                                        validator: (value) {
                                                          if (value == null || value.isEmpty) {
                                                            return 'Required';
                                                          }
                                                          if (int.tryParse(value) == null) {
                                                            return 'Invalid number';
                                                          }
                                                          return null;
                                                        },
                                                        onChanged: (value) {
                                                          setState(() {
                                                            exerciseInPlan.sets[setIndex] = workoutSet.copyWith(rpe: value);
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                    IconButton(
                                                      icon: const Icon(Icons.delete),
                                                      onPressed: () => _removeSetFromExercise(dayIndex, exerciseIndex, setIndex),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                        ElevatedButton(
                                          onPressed: () => _addSetToExercise(dayIndex, exerciseIndex),
                                          child: const Text('+ Satz hinzufügen'),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            ElevatedButton(
                              onPressed: () => _addExerciseToDay(dayIndex),
                              child: const Text('+ Übung hinzufügen'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _addDay,
                    child: const Text('+ Tag hinzufügen'),
                  ),
                  ElevatedButton(
                    onPressed: _saveTemplate,
                    child: const Text('Save Template'),
                  ),
                  ElevatedButton(
                    onPressed: _showWorkupGeneratorDialog, // Button to open the WorkupGeneratorDialog
                    child: const Text('⚡ Work-up Sätze generieren'),
                  ),
                  ElevatedButton(
                    onPressed: _showRotationBlockDialog, // Button to open the RotationBlockDialog
                    child: const Text('✨ Rotation Block hinzufügen'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
