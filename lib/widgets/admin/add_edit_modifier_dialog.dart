import 'package:flutter/material.dart';
import 'package:test_app/models/admin_attributes_model.dart';
import 'package:uuid/uuid.dart';

class AddEditModifierDialog extends StatefulWidget {
  final ExerciseModifier? initialValue;
  final Function(ExerciseModifier) onSave;

  const AddEditModifierDialog({
    super.key,
    this.initialValue,
    required this.onSave,
  });

  @override
  State<AddEditModifierDialog> createState() => _AddEditModifierDialogState();
}

class _AddEditModifierDialogState extends State<AddEditModifierDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  ModifierParameter _parameter = ModifierParameter.reps;
  ValueType _valueType = ValueType.numeric;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialValue?.name);
    if (widget.initialValue != null) {
      _parameter = widget.initialValue!.parameter;
      _valueType = widget.initialValue!.valueType;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _handleSave() {
    if (_formKey.currentState!.validate()) {
      final newModifier = ExerciseModifier(
        id: widget.initialValue?.id ?? const Uuid().v4(),
        name: _nameController.text.trim(),
        parameter: _parameter,
        valueType: _valueType,
      );
      widget.onSave(newModifier);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.initialValue == null ? 'Add Modifier' : 'Edit Modifier'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nameController,
              autofocus: true,
              decoration: const InputDecoration(labelText: 'Modifier Name'),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a name.';
                }
                return null;
              },
            ),
            DropdownButtonFormField<ModifierParameter>(
              value: _parameter,
              decoration: const InputDecoration(labelText: 'Parameter'),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _parameter = value;
                  });
                }
              },
              items: ModifierParameter.values.map((param) {
                return DropdownMenuItem(value: param, child: Text(param.toString().split('.').last));
              }).toList(),
            ),
            DropdownButtonFormField<ValueType>(
              value: _valueType,
              decoration: const InputDecoration(labelText: 'Value Type'),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _valueType = value;
                  });
                }
              },
              items: ValueType.values.map((type) {
                return DropdownMenuItem(value: type, child: Text(type.toString().split('.').last));
              }).toList(),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _handleSave,
          child: const Text('Save'),
        ),
      ],
    );
  }
}