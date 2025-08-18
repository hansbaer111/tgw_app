import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/models/exercise_model.dart'; // Import ExerciseModel
import 'package:test_app/providers/providers.dart'; // Import providers
import 'package:uuid/uuid.dart'; // For generating UUIDs

class CreateEditExerciseScreen extends ConsumerStatefulWidget {
  final ExerciseModel? exercise; // Optional exercise for editing
  const CreateEditExerciseScreen({Key? key, this.exercise}) : super(key: key);

  @override
  _CreateEditExerciseScreenState createState() => _CreateEditExerciseScreenState();
}

class _CreateEditExerciseScreenState extends ConsumerState<CreateEditExerciseScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _exerciseNameController = TextEditingController();
  final TextEditingController _videoUrlController = TextEditingController();

  String? _selectedMovementPattern;
  List<String> _selectedMuscleGroups = [];
  List<String> _selectedEquipment = [];

  @override
  void initState() {
    super.initState();
    if (widget.exercise != null) {
      _exerciseNameController.text = widget.exercise!.name;
      _videoUrlController.text = widget.exercise!.videoUrl ?? '';
      _selectedMovementPattern = widget.exercise!.movementPattern;
      _selectedMuscleGroups = List.from(widget.exercise!.muscleGroups);
      _selectedEquipment = List.from(widget.exercise!.equipment);
    }
  }

  @override
  void dispose() {
    _exerciseNameController.dispose();
    _videoUrlController.dispose();
    super.dispose();
  }

  void _saveExercise() async {
    if (_formKey.currentState!.validate()) {
      final newExercise = ExerciseModel(
        id: widget.exercise?.id ?? const Uuid().v4(),
        name: _exerciseNameController.text.trim(),
        description: '', // TODO: Add description field if needed
        muscleGroups: _selectedMuscleGroups,
        equipment: _selectedEquipment,
        movementPattern: _selectedMovementPattern!,
        tags: [], // TODO: Implement tags if needed
        videoUrl: _videoUrlController.text.trim().isEmpty ? null : _videoUrlController.text.trim(),
      );

      try {
        if (widget.exercise == null) {
          // Create new exercise
          await ref.read(databaseServiceProvider).addExercise(newExercise);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Exercise created successfully!')),
          );
        } else {
          // Update existing exercise
          await ref.read(databaseServiceProvider).updateExercise(newExercise);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Exercise updated successfully!')),
          );
        }
        ref.refresh(globalExercisesProvider); // Refresh the list in ExerciseManagementScreen
        Navigator.pop(context); // Go back to previous screen
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save exercise: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final adminAttributesAsyncValue = ref.watch(adminAttributesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exercise == null ? 'Create Exercise' : 'Edit Exercise'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView( // Use ListView to prevent overflow
            children: [
              TextFormField(
                controller: _exerciseNameController,
                decoration: const InputDecoration(labelText: 'Exercise Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an exercise name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _videoUrlController,
                decoration: const InputDecoration(labelText: 'Video URL (optional)'),
                keyboardType: TextInputType.url,
              ),
              const SizedBox(height: 20),
              adminAttributesAsyncValue.when(
                data: (attributes) {
                  return Column(
                    children: [
                      // Movement Pattern Dropdown
                      DropdownButtonFormField<String>(
                        value: _selectedMovementPattern,
                        hint: const Text('Select Movement Pattern'),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedMovementPattern = newValue;
                          });
                        },
                        items: attributes.movementPatterns.map((pattern) {
                          return DropdownMenuItem<String>(
                            value: pattern,
                            child: Text(pattern),
                          );
                        }).toList(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a movement pattern';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      // Muscle Groups Multi-select
                      DropdownButtonFormField<String>(
                        value: null, // No single value for multi-select
                        hint: const Text('Select Muscle Groups'),
                        onChanged: (String? newValue) {
                          // This onChanged is not ideal for multi-select.
                          // A custom multi-select widget would be better.
                          // For now, just a placeholder.
                        },
                        items: attributes.muscleGroups.map((group) {
                          return DropdownMenuItem<String>(
                            value: group,
                            child: Text(group),
                          );
                        }).toList(),
                        validator: (value) {
                          if (_selectedMuscleGroups.isEmpty) {
                            return 'Please select at least one muscle group';
                          }
                          return null;
                        },
                      ),
                      // Display selected muscle groups
                      Wrap(
                        spacing: 8.0,
                        children: _selectedMuscleGroups
                            .map((group) => Chip(
                                  label: Text(group),
                                  onDeleted: () {
                                    setState(() {
                                      _selectedMuscleGroups.remove(group);
                                    });
                                  },
                                ))
                            .toList(),
                      ),
                      const SizedBox(height: 20),
                      // Equipment Multi-select
                      DropdownButtonFormField<String>(
                        value: null, // No single value for multi-select
                        hint: const Text('Select Equipment'),
                        onChanged: (String? newValue) {
                          // This onChanged is not ideal for multi-select.
                          // A custom multi-select widget would be better.
                          // For now, just a placeholder.
                        },
                        items: attributes.equipmentTypes.map((equipment) {
                          return DropdownMenuItem<String>(
                            value: equipment.name,
                            child: Text(equipment.name),
                          );
                        }).toList(),
                        validator: (value) {
                          if (_selectedEquipment.isEmpty) {
                            return 'Please select at least one equipment type';
                          }
                          return null;
                        },
                      ),
                      // Display selected equipment
                      Wrap(
                        spacing: 8.0,
                        children: _selectedEquipment
                            .map((equipment) => Chip(
                                  label: Text(equipment),
                                  onDeleted: () {
                                    setState(() {
                                      _selectedEquipment.remove(equipment);
                                    });
                                  },
                                ))
                            .toList(),
                      ),
                    ],
                  );
                },
                loading: () => const CircularProgressIndicator(),
                error: (error, stack) => Text('Error loading attributes: $error'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveExercise,
                child: const Text('Save Exercise'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
