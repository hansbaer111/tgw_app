import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/models/admin_attributes_model.dart';
import 'package:test_app/models/exercise_model.dart';
// For provider
import 'package:uuid/uuid.dart';
import 'package:test_app/providers/providers.dart';

class AddEditExerciseScreen extends ConsumerStatefulWidget {
  final ExerciseModel? exercise;

  const AddEditExerciseScreen({super.key, this.exercise});

  @override
  ConsumerState<AddEditExerciseScreen> createState() => _AddEditExerciseScreenState();
}

class _AddEditExerciseScreenState extends ConsumerState<AddEditExerciseScreen> {
  late WidgetRef _ref;

  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _videoUrlController;

  // Selected values for dropdowns
  String? _selectedEquipment;
  String? _selectedMuscleGroup;
  String? _selectedMovementPattern;
  List<String> _selectedSecondaryMuscles = [];
  List<ExerciseModifier> _selectedModifiers = [];

  @override
  void initState() {
    super.initState();
    _ref = ref;
    _nameController = TextEditingController(text: widget.exercise?.name);
    _descriptionController = TextEditingController(text: widget.exercise?.description);
    _videoUrlController = TextEditingController(text: widget.exercise?.videoUrl);

    if (widget.exercise != null) {
      _selectedEquipment = widget.exercise!.tags.equipment;
      _selectedMuscleGroup = widget.exercise!.tags.primaryMuscle;
      _selectedMovementPattern = widget.exercise!.tags.movementPattern;
      _selectedSecondaryMuscles = widget.exercise!.tags.secondaryMuscles ?? [];
      _selectedModifiers = widget.exercise!.modifiers ?? [];
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _videoUrlController.dispose();
    super.dispose();
  }

  Future<void> _saveExercise() async {
    if (_formKey.currentState!.validate()) {
      final newExercise = ExerciseModel(
        exerciseId: widget.exercise?.exerciseId ?? const Uuid().v4(),
        baseExerciseId: '', // Default value, adjust if needed
        name: _nameController.text,
        description: _descriptionController.text,
        videoUrl: _videoUrlController.text,
        ownerId: 'global', // All exercises created by admin are global
        tags: ExerciseTags(
          equipment: _selectedEquipment!,
          primaryMuscle: _selectedMuscleGroup!,
          secondaryMuscles: _selectedSecondaryMuscles,
          movementPattern: _selectedMovementPattern!,
        ),
        modifiers: _selectedModifiers,
      );

      final db = _ref.read(databaseServiceProvider);
      if (widget.exercise != null) {
        await db.updateExercise(newExercise);
      } else {
        await db.addExercise(newExercise);
      }

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final attributesAsync = _ref.watch(adminAttributesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exercise == null ? 'Add Exercise' : 'Edit Exercise'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveExercise,
          ),
        ],
      ),
      body: attributesAsync.when(
        data: (attributes) {
          // Ensure dropdown values exist in the attributes list
          if (_selectedEquipment != null && !attributes.equipmentTypes.contains(_selectedEquipment)) {
            _selectedEquipment = null;
          }
          if (_selectedMuscleGroup != null && !attributes.muscleGroups.contains(_selectedMuscleGroup)) {
            _selectedMuscleGroup = null;
          }
          if (_selectedMovementPattern != null && !attributes.movementPatterns.contains(_selectedMovementPattern)) {
            _selectedMovementPattern = null;
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Exercise Name'),
                    validator: (value) => value!.isEmpty ? 'Please enter a name' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(labelText: 'Description'),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _videoUrlController,
                    decoration: const InputDecoration(labelText: 'Video URL'),
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: _selectedEquipment,
                    decoration: const InputDecoration(labelText: 'Equipment'),
                    items: attributes.equipmentTypes.map((e) => DropdownMenuItem(value: e as String, child: Text(e as String))).toList(),
                    onChanged: (value) => setState(() => _selectedEquipment = value),
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: _selectedMuscleGroup,
                    decoration: const InputDecoration(labelText: 'Primary Muscle Group'),
                    items: attributes.muscleGroups.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                    onChanged: (value) => setState(() => _selectedMuscleGroup = value),
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: _selectedMovementPattern,
                    decoration: const InputDecoration(labelText: 'Movement Pattern'),
                    items: attributes.movementPatterns.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                    onChanged: (value) => setState(() => _selectedMovementPattern = value),
                  ),
                  const SizedBox(height: 16),
                  // Secondary Muscles Multi-Select
                  _buildMultiSelectChipDisplay(
                    'Secondary Muscles',
                    attributes.muscleGroups,
                    _selectedSecondaryMuscles,
                    (selected) => setState(() => _selectedSecondaryMuscles = selected),
                  ),
                  const SizedBox(height: 16),
                  // Modifiers Multi-Select
                  _buildMultiSelectChipDisplayForModifiers(
                    'Modifiers',
                    attributes.exerciseModifiers,
                    _selectedModifiers,
                    (selected) => setState(() => _selectedModifiers = selected),
                  ),
                ],
              ),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  Widget _buildMultiSelectChipDisplay(
    String title,
    List<String> allOptions,
    List<String> selectedOptions,
    Function(List<String>) onSelectionChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        Wrap(
          spacing: 8.0,
          children: allOptions.map((option) {
            final isSelected = selectedOptions.contains(option);
            return FilterChip(
              label: Text(option),
              selected: isSelected,
              onSelected: (selected) {
                final newSelection = List<String>.from(selectedOptions);
                if (selected) {
                  newSelection.add(option);
                } else {
                  newSelection.remove(option);
                }
                onSelectionChanged(newSelection);
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildMultiSelectChipDisplayForModifiers(
    String title,
    List<ExerciseModifier> allOptions,
    List<ExerciseModifier> selectedOptions,
    Function(List<ExerciseModifier>) onSelectionChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        Wrap(
          spacing: 8.0,
          children: allOptions.map((option) {
            final isSelected = selectedOptions.any((selected) => selected.id == option.id);
            return FilterChip(
              label: Text(option.name),
              selected: isSelected,
              onSelected: (selected) {
                final newSelection = List<ExerciseModifier>.from(selectedOptions);
                if (selected) {
                  newSelection.add(option);
                } else {
                  newSelection.removeWhere((item) => item.id == option.id);
                }
                onSelectionChanged(newSelection);
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}