import 'package:flutter/material.dart';

class WorkupGeneratorDialog extends StatefulWidget {
  const WorkupGeneratorDialog({Key? key}) : super(key: key);

  @override
  _WorkupGeneratorDialogState createState() => _WorkupGeneratorDialogState();
}

class _WorkupGeneratorDialogState extends State<WorkupGeneratorDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _targetRmController = TextEditingController();
  final TextEditingController _progressionStepsController = TextEditingController();
  final TextEditingController _warmupRepsController = TextEditingController();

  @override
  void dispose() {
    _targetRmController.dispose();
    _progressionStepsController.dispose();
    _warmupRepsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Work-up Sätze generieren'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _targetRmController,
              decoration: const InputDecoration(labelText: 'Ziel RM (z.B. 1RM, 3RM)'),
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Bitte Ziel RM eingeben';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _progressionStepsController,
              decoration: const InputDecoration(labelText: 'Progression Steps (kg)'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Bitte Progression Steps eingeben';
                }
                if (double.tryParse(value) == null) {
                  return 'Bitte eine gültige Zahl eingeben';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _warmupRepsController,
              decoration: const InputDecoration(labelText: 'Warm-up Reps'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Bitte Warm-up Reps eingeben';
                }
                if (int.tryParse(value) == null) {
                  return 'Bitte eine gültige Zahl eingeben';
                }
                return null;
              },
            ),
          ],
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
              // TODO: Calculate and pass back the generated sets
              Navigator.of(context).pop();
            }
          },
          child: const Text('Generieren'),
        ),
      ],
    );
  }
}
