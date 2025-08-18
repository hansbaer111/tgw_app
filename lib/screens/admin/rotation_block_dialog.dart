import 'package:flutter/material.dart';
import 'package:test_app/models/exercise_model.dart'; // Assuming ExerciseModel is needed
import 'package:test_app/models/workout_set_model.dart'; // Assuming WorkoutSetModel is needed

class RotationBlockDialog extends StatefulWidget {
  const RotationBlockDialog({Key? key}) : super(key: key);

  @override
  _RotationBlockDialogState createState() => _RotationBlockDialogState();
}

class _RotationBlockDialogState extends State<RotationBlockDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _weeksController = TextEditingController();
  List<ExerciseModel> _selectedExercises = []; // Reorderable list of exercises
  List<String> _weeklySchemes = []; // Reorderable list of weekly schemes (e.g., "3x5 @8")

  @override
  void dispose() {
    _weeksController.dispose();
    super.dispose();
  }

  void _addExercise() {
    setState(() {
      // TODO: Implement exercise selection (e.g., from a dropdown or search)
      // For now, add a placeholder exercise
      _selectedExercises.add(ExerciseModel(id: 'new_exercise', name: 'New Exercise', description: '', muscleGroups: [], equipment: [], movementPattern: '', tags: []));
    });
  }

  void _addScheme() {
    setState(() {
      _weeklySchemes.add(''); // Add an empty scheme for now
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Rotation Block hinzufügen'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _weeksController,
                decoration: const InputDecoration(labelText: 'Anzahl Wochen'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Bitte Anzahl Wochen eingeben';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Bitte eine gültige Zahl eingeben';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Text('Übungen (Reihenfolge anpassen):'),
              ReorderableListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _selectedExercises.length,
                itemBuilder: (context, index) {
                  final exercise = _selectedExercises[index];
                  return ListTile(
                    key: ValueKey(exercise.id), // Unique key for reordering
                    title: Text(exercise.name),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove_circle),
                      onPressed: () {
                        setState(() {
                          _selectedExercises.removeAt(index);
                        });
                      },
                    ),
                  );
                },
                onReorder: (oldIndex, newIndex) {
                  setState(() {
                    if (newIndex > oldIndex) {
                      newIndex -= 1;
                    }
                    final item = _selectedExercises.removeAt(oldIndex);
                    _selectedExercises.insert(newIndex, item);
                  });
                },
              ),
              ElevatedButton(
                onPressed: _addExercise,
                child: const Text('+ Übung hinzufügen'),
              ),
              const SizedBox(height: 20),
              const Text('Wöchentliche Schemata (Reihenfolge anpassen):'),
              ReorderableListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _weeklySchemes.length,
                itemBuilder: (context, index) {
                  final scheme = _weeklySchemes[index];
                  return ListTile(
                    key: ValueKey(index), // Unique key for reordering
                    title: TextFormField(
                      initialValue: scheme,
                      decoration: InputDecoration(labelText: 'Schema Woche ${index + 1}'),
                      onChanged: (value) {
                        _weeklySchemes[index] = value;
                      },
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove_circle),
                      onPressed: () {
                        setState(() {
                          _weeklySchemes.removeAt(index);
                        });
                      },
                    ),
                  );
                },
                onReorder: (oldIndex, newIndex) {
                  setState(() {
                    if (newIndex > oldIndex) {
                      newIndex -= 1;
                    }
                    final item = _weeklySchemes.removeAt(oldIndex);
                    _weeklySchemes.insert(newIndex, item);
                  });
                },
              ),
              ElevatedButton(
                onPressed: _addScheme,
                child: const Text('+ Schema hinzufügen'),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Abbrechen'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // TODO: Calculate and pass back the generated rotation block
              Navigator.of(context).pop();
            }
          },
          child: const Text('Generieren'),
        ),
      ],
    );
  }
}
